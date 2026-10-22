from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.process.constants import OUTLET_FLOW_HEIGHT_RATE_M_S

from pysupervisor import opcua_cache


def iterate_level(current_level: float, mix_output_open: bool):
    if not mix_output_open:
        return current_level
    return current_level + OUTLET_FLOW_HEIGHT_RATE_M_S * SCAN_PERIOD_S


class TransferPump(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.mix_output = builder.create_opcua_cache(
            suffix=".MixOutletOpen", node_type=bool
        )
        self.buffer_level = builder.create_opcua_cache(
            suffix=".BufferLevelReadback", node_type=float
        )

    def initialise(self):
        self.buffer_level.set(2.0)

    def scan(self):
        self.buffer_level.set(
            iterate_level(
                current_level=self.buffer_level.get(),
                mix_output_open=self.mix_output.get(),
            )
        )

    def is_mix_output_open(self):
        return self.mix_output.get()
