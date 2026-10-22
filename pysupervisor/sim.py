import asyncio

from asyncua.client.client import Client
from pysupervisor.opcua_cache import Caches, NodeBuilder, OPCUALookupBranch
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.process.mixing_tank import MixingTank
from pysupervisor.sim.process.transfer_pump import TransferPump

URL = "opc.tcp://127.0.0.1:4840/openplc/opcua"
NS_URI = "urn:openplc:opcua:namespace"

# this could be in a .env, but I'm that's not the point of this exercise
USERNAME = "admin"
PASSWORD = "admin"

BASE_NODEID = "PLC.main"


class Main(OPCUALookupBranch):
    def __init__(self, node_builder: NodeBuilder):
        self.transfer_pump = TransferPump(
            builder=node_builder.extend(".Process.TransferPump")
        )
        self.mixing_tank = MixingTank(
            node_builder=node_builder.extend(".Process.MixingTank"),
            outlet_open=self.transfer_pump.mix_output,
        )


async def main():
    client = Client(URL)
    client.set_user(USERNAME)
    client.set_password(PASSWORD)

    async with client:
        idx = await client.get_namespace_index(NS_URI)
        node_builder = NodeBuilder(client=client, prefix=BASE_NODEID, idx=idx)

        main = Main(node_builder=node_builder)

        caches = Caches(as_list=main.get_caches())

        while True:
            await caches.read(client)
            main.scan()
            await caches.write(client)
            await asyncio.sleep(SCAN_PERIOD_S)


asyncio.run(main())
