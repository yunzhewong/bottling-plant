import asyncio

from asyncua.client.client import Client

from pysupervisor import opcua_cache
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.motion import Motion
from pysupervisor.sim.packaging import Packaging
from pysupervisor.sim.process import Process
from pysupervisor.sim.shared import UtilityState
from pysupervisor.sim.utilities import Utilities

URL = "opc.tcp://127.0.0.1:4840/openplc/opcua"
NS_URI = "urn:openplc:opcua:namespace"

# this could be in a .env, but I'm that's not the point of this exercise
USERNAME = "admin"
PASSWORD = "admin"

BASE_NODEID = "PLC.main"


class Main(opcua_cache.LookupBranch):
    def __init__(self, node_builder: opcua_cache.Builder):
        self.utilities = Utilities(
            node_builder=node_builder.extend("Utilities"),
            on_utility_change=self._on_utility_change,
        )

        self.process = Process(builder=node_builder.extend("Process"))
        self.packaging = Packaging(
            builder=node_builder.extend("Packaging"),
            on_fill_mm3=self.process.on_fill_mm3,
            on_conveyor_change=self._on_conveyor_change,
        )
        self.motion = Motion(builder=node_builder.extend("Motion"))

    def _on_utility_change(self, utility_state: UtilityState):
        print(utility_state)  # TODO: set values on all subitems

    def _on_conveyor_change(self):
        self.motion.on_conveyor_change()


async def main():
    client = Client(URL)
    client.set_user(USERNAME)
    client.set_password(PASSWORD)

    async with client:
        idx = await client.get_namespace_index(NS_URI)
        node_builder = opcua_cache.Builder(client=client, prefix=BASE_NODEID, idx=idx)

        main = Main(node_builder=node_builder)
        main.initialise()

        caches = opcua_cache.ScanVariables(values=main.get_caches())

        while True:
            await caches.read(client)
            main.scan()
            await caches.write(client)
            await asyncio.sleep(SCAN_PERIOD_S)


asyncio.run(main())
