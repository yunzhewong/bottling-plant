from collections.abc import Callable

from pysupervisor import opcua_cache
from pysupervisor.sim.process.mixing_tank import AMBIENT_TEMPERATURE
from pysupervisor.sim.shared import UtilityState


class Utilities:
    def __init__(
        self,
        node_builder: opcua_cache.Builder,
        on_utility_change: Callable[[UtilityState], None],
    ):
        self.utility_state = UtilityState(pressure=700, temperature=10)

        self.compressed_air = CompressedAir(
            node_builder=node_builder.extend(".CompressedAir"),
            on_readback_pressure_change_kpa=self._on_pressure_change,
        )
        self.cooling_loop = CoolingLoop(
            node_builder=node_builder.extend(".CoolingLoop"),
            on_readback_temperature_c=self._on_cooling_change,
        )
        self._on_utility_change = on_utility_change

    def _on_pressure_change(self, pressure_kpa: float):
        new_state = UtilityState(
            pressure=pressure_kpa, temperature=self.utility_state.temperature
        )
        self.utility_state = new_state
        self._on_utility_change(new_state)

    def _on_cooling_change(self, temperature_c: float):
        new_state = UtilityState(
            pressure=self.utility_state.pressure, temperature=temperature_c
        )
        self.utility_state = new_state
        self._on_utility_change(new_state)


class FacilityUtility(opcua_cache.LookupBranch):
    def __init__(
        self,
        node_builder: opcua_cache.Builder,
        on_readback_change: Callable[[float], None],
        get_target: Callable[[float], float],
    ):
        self.generation_setpoint = node_builder.create_opcua_cache(
            suffix=".GenerationSetpoint", node_type=float
        )
        self.generation_readback = node_builder.create_opcua_cache(
            suffix=".GenerationReadback", node_type=float
        )
        self.target_readback = node_builder.create_opcua_cache(
            suffix=".TargetReadback", node_type=float
        )

        self.get_target = get_target
        self.on_readback_change = on_readback_change

    def scan(self):
        generation_readback = self.generation_setpoint.get()
        self.generation_readback.set(generation_readback)

        target_pressure = self.get_target(generation_readback)
        self.target_readback.set(target_pressure)

        self.on_readback_change(target_pressure)


TARGET_PRESSURE_MULTIPLIER = 0.8


class CompressedAir(FacilityUtility):
    def __init__(
        self,
        node_builder: opcua_cache.Builder,
        on_readback_pressure_change_kpa: Callable[[float], None],
    ):
        super().__init__(
            node_builder=node_builder,
            on_readback_change=on_readback_pressure_change_kpa,
            get_target=lambda setpoint: setpoint * TARGET_PRESSURE_MULTIPLIER,
        )


class CoolingLoop(FacilityUtility):
    def __init__(
        self,
        node_builder: opcua_cache.Builder,
        on_readback_temperature_c: Callable[[float], None],
    ):
        def get_target(setpoint: float):
            return_to_ambient = 0.2 * (AMBIENT_TEMPERATURE - setpoint)
            return setpoint + return_to_ambient

        super().__init__(
            node_builder=node_builder,
            on_readback_change=on_readback_temperature_c,
            get_target=get_target,
        )
