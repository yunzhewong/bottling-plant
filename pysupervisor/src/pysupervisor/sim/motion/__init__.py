import time
from enum import Enum

from pysupervisor import opcua_cache
from pysupervisor.sim.constants import SCAN_PERIOD_S

APPLICATION_TORQUE = 0.9
CAP_MASS = 0.05


def calculate_resist_torque(angle: float):
    """
    Torque vs rotation angle, assuming similar behaviour to a bolted joint.
    Assumptions defined using Claude for suggestions
    """
    if angle < 300:
        # before critical angle, rolls smoothly
        return 0.05
    if angle < 320:
        # snug point, connection starts
        return 0.05 + (0.07 / 20) * (angle - 300)
    if angle < 440:
        # build up
        return 0.12 + (0.88 / 120) * (angle - 320)
    # yields
    return 0.1


class Capper(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.apply_torque = builder.create_opcua_cache(".ApplyTorque", node_type=float)
        self.angular_velocity_feedback = builder.create_opcua_cache(
            ".AngularVelocityFeedback", node_type=float
        )
        self.angle_feedback = builder.create_opcua_cache(
            ".AngleFeedback", node_type=float
        )
        self.resist_torque_feedback = builder.create_opcua_cache(
            ".ResistTorqueFeedback", node_type=float
        )

    def scan(self):
        resist_torque = calculate_resist_torque(angle=self.angle_feedback.get())
        movement_torque = APPLICATION_TORQUE - resist_torque
        actual_torque = movement_torque if self.apply_torque.get() else 0
        angular_acceleration_s = actual_torque / CAP_MASS
        new_angular_velocity = (
            self.angular_velocity_feedback.get()
            + angular_acceleration_s * SCAN_PERIOD_S
        )
        new_angle = self.angle_feedback.get() + new_angular_velocity * SCAN_PERIOD_S

        self.angular_velocity_feedback.set(new_angular_velocity)
        self.angle_feedback.set(new_angle)
        self.resist_torque_feedback.set(resist_torque)


PACK_AMOUNT = 10
PACK_TIME = 5


class PackState(Enum):
    Idle = 0
    Packing = 1


class CasePacker(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.initiate_pack = builder.create_opcua_cache(".InitiatePack", node_type=bool)
        self.pack_state = builder.create_opcua_cache(".PackState", node_type=bool)
        self.case_count = builder.create_opcua_cache(".CaseCount", node_type=int)
        self.pack_complete_time = time.time()

    def scan(self):
        match self.pack_state.get():
            case PackState.Idle.value:
                if not self.initiate_pack.get():
                    return

                self.pack_state.set(PackState.Packing.value)
                self.pack_complete_time = time.time() + PACK_TIME
            case PackState.Packing.value:
                if time.time() < self.pack_complete_time:
                    return

                self.pack_state.set(PackState.Idle.value)
                self.case_count.set(self.case_count.get() + 1)


class Motion(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.capper = Capper(builder=builder.extend(".Capper"))
        self.conveyor = CasePacker(builder=builder.extend(".CasePacker"))
