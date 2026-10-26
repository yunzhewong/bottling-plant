import time
from collections.abc import Callable
from enum import Enum

from pysupervisor import opcua_cache
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.shared import UtilityReadback, UtilityState

FILL_RAMP_LIMIT = 0.01
FILL_RATE_LIMIT = 300
FILL_AMOUNT = 330


def saturate_limit(value: float, limit: float):
    if value > limit:
        return limit
    if value < -limit:
        return -limit
    return value


class Filler(opcua_cache.LookupBranch):
    def __init__(
        self, builder: opcua_cache.Builder, on_fill_mm3: Callable[[float], None]
    ):
        self.flow_rate_setpoint = builder.create_opcua_cache(
            "FlowRateSetpoint_mm3_s", node_type=float
        )
        self.flow_rate_readback = builder.create_opcua_cache(
            "FlowRateReadback_mm3_s", node_type=float
        )
        self.utility_readback = UtilityReadback(builder)
        self.fill_volume = builder.create_opcua_cache("FillVolume_mm3", node_type=float)

        self.on_fill_mm3 = on_fill_mm3

    def scan(self):
        readback_adjustment = saturate_limit(
            self.flow_rate_setpoint.get() - self.flow_rate_readback.get(),
            limit=FILL_RAMP_LIMIT,
        )
        new_flow_rate = saturate_limit(
            value=self.flow_rate_readback.get() + readback_adjustment,
            limit=FILL_RATE_LIMIT,
        )
        volume_change = new_flow_rate * SCAN_PERIOD_S

        self.flow_rate_readback.set(new_flow_rate)
        self.on_fill_mm3(volume_change)
        self.fill_volume.set(self.fill_volume.get() + volume_change)

    def clear_bottle_fill(self):
        self.fill_volume.set(0)


LOAD_TIME = 1


class ConveyorState(Enum):
    Idle = 0
    Loading = 1


class Conveyor(opcua_cache.LookupBranch):
    def __init__(
        self, builder: opcua_cache.Builder, on_bottle_change: Callable[[], None]
    ):
        self.load_bottle = builder.create_opcua_cache("LoadBottle", node_type=bool)
        self.bottle_loaded = builder.create_opcua_cache("BottleLoaded", node_type=bool)
        self.utility_readback = UtilityReadback(builder=builder)
        self.state = ConveyorState.Idle
        self.bottle_loaded_time = time.time() + LOAD_TIME

        self._on_bottle_change = on_bottle_change

    def initialise(self):
        self.load_bottle.set(False)
        self.bottle_loaded.set(False)

    def scan(self):
        current_time = time.time()
        match self.state:
            case ConveyorState.Idle:
                self.bottle_loaded.set(True)
                if self.load_bottle.get():
                    self.bottle_loaded_time = current_time + LOAD_TIME
                    self.state = ConveyorState.Loading
            case ConveyorState.Loading:
                self.bottle_loaded.set(False)
                if current_time > self.bottle_loaded_time:
                    self._on_bottle_change()
                    self.state = ConveyorState.Idle


class Packaging(opcua_cache.LookupBranch):
    def __init__(
        self,
        builder: opcua_cache.Builder,
        on_fill_mm3: Callable[[float], None],
        on_conveyor_change: Callable[[], None],
    ):
        self.filler = Filler(builder=builder.extend("Filler"), on_fill_mm3=on_fill_mm3)

        def on_bottle_change():
            self.filler.clear_bottle_fill()
            on_conveyor_change()

        self.conveyor = Conveyor(
            builder=builder.extend("Conveyor"), on_bottle_change=on_bottle_change
        )

    def handle_utility_change(self, utility_state: UtilityState):
        self.filler.utility_readback.handle_utility_change(utility_state)
        self.conveyor.utility_readback.handle_utility_change(utility_state)
