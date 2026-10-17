import asyncio
from dataclasses import dataclass

from asyncua import Client, Node, ua

URL = "opc.tcp://127.0.0.1:4840/openplc/opcua"
NS_URI = "urn:openplc:opcua:namespace"

# this could be in a .env, but I'm that's not the point of this exercise
USERNAME = "admin"
PASSWORD = "admin"

BASE_NODEID = "PLC.main"


def get_variant_type(node_type: type):
    if node_type == float:
        return ua.VariantType.Float
    if node_type == bool:
        return ua.VariantType.Boolean


@dataclass(frozen=True)
class NodeRef[T]:
    node: Node
    node_type: type[T]

    async def get(self) -> T:
        return await self.node.get_value()

    async def set(self, value: T):
        await self.node.write_value(
            ua.DataValue(Value=ua.Variant(value, get_variant_type(self.node_type)))
        )


@dataclass
class NodeBuilder:
    client: Client
    prefix: str
    idx: int

    def create_node_ref(self, suffix: str, node_type: type):
        node = self.client.get_node(
            ua.NodeId(
                Identifier=ua.String(f"{self.prefix}{suffix}"),
                NamespaceIndex=ua.Int16(self.idx),
            )
        )
        return NodeRef(node=node, node_type=node_type)

    def extend(self, midfix: str):
        return NodeBuilder(
            client=self.client, prefix=self.prefix + midfix, idx=self.idx
        )


SCAN_PERIOD_S = 20e-3
INLET_FLOWRATE_M3S = 0.1
AMBIENT_TEMPERATURE = 25
HEATER_TEMPERATURE = 100
TEMP_COEFFICIENT = 0.01


class MixingTank:
    def __init__(self, node_builder: NodeBuilder):
        self.level_setpoint = node_builder.create_node_ref(
            suffix=".LevelSetpoint_m", node_type=float
        )
        self.level_readback = node_builder.create_node_ref(
            suffix=".LevelReadback_m", node_type=float
        )
        self.inlet_open = node_builder.create_node_ref(
            suffix=".InletOpen", node_type=bool
        )

        self.temp_setpoint = node_builder.create_node_ref(
            suffix=".TempSetpoint_degC", node_type=float
        )
        self.temp_readback = node_builder.create_node_ref(
            suffix=".TempReadback_degC", node_type=float
        )
        self.heater_on = node_builder.create_node_ref(
            suffix=".HeaterOn", node_type=bool
        )

    async def scan(self):
        await self._update_level()
        await self._update_temp()

    async def _update_level(self):
        readback = await self.level_readback.get()
        if await self.inlet_open.get():
            readback += SCAN_PERIOD_S * INLET_FLOWRATE_M3S
        await self.level_readback.set(readback)

    async def _update_temp(self):
        readback = await self.temp_readback.get()
        readback += TEMP_COEFFICIENT * (AMBIENT_TEMPERATURE - readback) * SCAN_PERIOD_S
        if await self.heater_on.get():
            readback += (
                TEMP_COEFFICIENT * (HEATER_TEMPERATURE - readback) * SCAN_PERIOD_S
            )
        await self.temp_readback.set(readback)


async def main():
    client = Client(URL)
    client.set_user(USERNAME)
    client.set_password(PASSWORD)

    async with client:
        idx = await client.get_namespace_index(NS_URI)
        base_node_builder = NodeBuilder(client=client, prefix=BASE_NODEID, idx=idx)

        mixing_tank = MixingTank(
            node_builder=base_node_builder.extend(".FB_11_MIXINGTANK0")
        )

        while True:
            await mixing_tank.scan()
            await asyncio.sleep(SCAN_PERIOD_S)


asyncio.run(main())
