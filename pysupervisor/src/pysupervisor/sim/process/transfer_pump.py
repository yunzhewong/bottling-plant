from pysupervisor.node_builder import NodeBuilder
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.process.constants import OUTLET_FLOW_HEIGHT_RATE_M_S


def iterate_level(current_level: float, mix_output_open: bool):
    if not mix_output_open:
        return current_level
    return current_level + OUTLET_FLOW_HEIGHT_RATE_M_S * SCAN_PERIOD_S


class TransferPump:
    def __init__(self, node_builder: NodeBuilder):
        self.mix_output = node_builder.create_node_ref(
            suffix=".MixOutletOpen", node_type=bool
        )
        self.buffer_level = node_builder.create_node_ref(
            suffix=".BufferLevelReadback", node_type=float
        )

    async def initialise(self):
        await self.buffer_level.set(2.0)

    async def scan(self):
        await self.buffer_level.set(
            iterate_level(
                current_level=await self.buffer_level.get(),
                mix_output_open=await self.mix_output.get(),
            )
        )

    async def is_mix_output_open(self):
        return await self.mix_output.get()
