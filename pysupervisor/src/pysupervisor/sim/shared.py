from dataclasses import dataclass

from pysupervisor import opcua_cache


@dataclass
class UtilityState:
    pressure: float
    temperature: float


class UtilityReadback(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.compressed_air_readback = builder.create_opcua_cache(
            "CompressedAirReadback", node_type=float
        )
        self.cooling_loop_readback = builder.create_opcua_cache(
            "CoolingLoopReadback", node_type=float
        )

    def handle_utility_change(self, utility_state: UtilityState):
        self.compressed_air_readback.set(utility_state.pressure)
        self.cooling_loop_readback.set(utility_state.temperature)
