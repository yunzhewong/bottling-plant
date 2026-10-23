import time
from enum import Enum

from pysupervisor import opcua_cache

FILL_RAMP_LIMIT = 0.01
FILL_AMOUNT = 330


def limit_ramp(change: float, limit: float):
    if change > limit:
        return limit
    if change < -limit:
        return -limit
    return change


class Filler(opcua_cache.LookupBranch):
    def __init__(
        self, builder: opcua_cache.Builder, bottle_filled: opcua_cache.Value[bool]
    ):
        self.flow_rate_setpoint = builder.create_opcua_cache(
            ".FlowRateSetpoint_mm3_s", node_type=float
        )
        self.flow_rate_readback = builder.create_opcua_cache(
            ".FlowRateReadback_mm3_s", node_type=float
        )
        self.fill_volume = builder.create_opcua_cache(
            ".FillVolume_mm3", node_type=float
        )

        self._bottle_filled = bottle_filled

    def scan(self):
        readback_adjustment = limit_ramp(
            self.flow_rate_setpoint.get() - self.flow_rate_readback.get(),
            limit=FILL_RAMP_LIMIT,
        )
        self.flow_rate_readback.set(self.flow_rate_readback.get() + readback_adjustment)
        self.fill_volume.set(self.fill_volume.get() + self.flow_rate_readback.get())
        if self.fill_volume.get() > FILL_AMOUNT:
            self._bottle_filled.set(True)


LOAD_TIME = 0.5


class ConveyorState(Enum):
    Idle = 0
    Loading = 1


class Conveyor(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.load_bottle = builder.create_opcua_cache(".LoadBottle", node_type=bool)
        self.bottle_loaded = builder.create_opcua_cache(".BottleLoaded", node_type=bool)
        self.bottle_filled = builder.create_opcua_cache(".BottleFilled", node_type=bool)
        self.bottle_capped = builder.create_opcua_cache(".BottleCapped", node_type=bool)
        self.loaded_count = builder.create_opcua_cache(".LoadedCount", node_type=int)
        self.state = ConveyorState.Idle
        self.bottle_loaded_time = time.time() + LOAD_TIME

    def initialise(self):
        self.load_bottle.set(False)
        self.bottle_loaded.set(False)
        self.loaded_count.set(0)

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
                self.bottle_filled.set(False)
                self.bottle_capped.set(False)
                if current_time > self.bottle_loaded_time:
                    self.loaded_count.set(self.loaded_count.get() + 1)
                    self.state = ConveyorState.Idle


class Packaging(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.conveyor = Conveyor(builder=builder.extend(".Conveyor"))
        self.filler = Filler(
            builder=builder.extend(".Filler"), bottle_filled=self.conveyor.bottle_filled
        )
