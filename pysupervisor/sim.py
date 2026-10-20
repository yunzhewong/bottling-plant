import asyncio

from asyncua.client.client import Client
from pysupervisor.node_builder import NodeBuilder
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.mixing_tank import MixingTank

URL = "opc.tcp://127.0.0.1:4840/openplc/opcua"
NS_URI = "urn:openplc:opcua:namespace"

# this could be in a .env, but I'm that's not the point of this exercise
USERNAME = "admin"
PASSWORD = "admin"

BASE_NODEID = "PLC.main"


async def main():
    client = Client(URL)
    client.set_user(USERNAME)
    client.set_password(PASSWORD)

    async with client:
        idx = await client.get_namespace_index(NS_URI)
        base_node_builder = NodeBuilder(client=client, prefix=BASE_NODEID, idx=idx)

        mixing_tank = MixingTank(node_builder=base_node_builder.extend(".MixingTank"))
        await mixing_tank.initialise()

        while True:
            await mixing_tank.scan()
            await asyncio.sleep(SCAN_PERIOD_S)


asyncio.run(main())
