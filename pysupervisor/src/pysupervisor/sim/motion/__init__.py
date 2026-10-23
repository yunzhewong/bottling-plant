from pysupervisor import opcua_cache


class Capper(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.bottle_in_position = builder.create_opcua_cache(
            ".BottleInPosition", node_type=bool
        )
        self.applied_rotation = builder.create_opcua_cache(
            ".AppliedRotation", node_type=float
        )
        self.torque_feedback = builder.create_opcua_cache(
            ".TorqueFeedback", node_type=float
        )


class CasePacker(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.total_bottle_count = builder.create_opcua_cache(
            ".TotalCount", node_type=int
        )
        self.packable_bottle_count = builder.create_opcua_cache(
            ".PackableCount", node_type=int
        )
        self.pack_signal = builder.create_opcua_cache(".PackSignal", node_type=bool)
        self.case_count = builder.create_opcua_cache(".CaseCount", node_type=int)


class Motion(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.capper = Capper(builder=builder.extend(".Capper"))
        self.conveyor = CasePacker(builder=builder.extend(".CasePacker"))
