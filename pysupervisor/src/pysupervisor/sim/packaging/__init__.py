from pysupervisor import opcua_cache

FILL_RAMP_LIMIT = 0.01


def limit_ramp(change: float, limit: float):
    if change > limit:
        return limit
    if change < -limit:
        return -limit
    return change


class Filler(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.flow_rate_setpoint = builder.create_opcua_cache(
            ".FlowRateSetpoint_mm3_s", node_type=float
        )
        self.flow_rate_readback = builder.create_opcua_cache(
            ".FlowRateReadback_mm3_s", node_type=float
        )
        self.fill_volume = builder.create_opcua_cache(
            ".FillVolume_mm3", node_type=float
        )

    def scan(self):
        readback_adjustment = limit_ramp(
            self.flow_rate_setpoint.get() - self.flow_rate_readback.get(),
            limit=FILL_RAMP_LIMIT,
        )
        self.flow_rate_readback.set(self.flow_rate_readback.get() + readback_adjustment)
        self.fill_volume.set(self.fill_volume.get() + self.flow_rate_readback.get())


class Conveyor(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        pass


class Packaging(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.filler = Filler(builder=builder.extend(".Filler"))
        self.conveyor = Conveyor(builder=builder.extend(".Conveyor"))
