from pysupervisor import opcua_cache
from pysupervisor.sim.constants import SCAN_PERIOD_S
from pysupervisor.sim.process.constants import OUTLET_FLOW_HEIGHT_RATE_M_S

INLET_FLOW_HEIGHT_RATE_M_S = 0.1
AMBIENT_TEMPERATURE = 25
HEATER_TEMPERATURE = 100
TEMP_COEFFICIENT = 0.01


def iterate_level(current_level: float, inlet_open: bool, outlet_open: bool):
    inlet_flow = 0
    if inlet_open:
        inlet_flow += SCAN_PERIOD_S * INLET_FLOW_HEIGHT_RATE_M_S

    outlet_flow = 0
    if outlet_open:
        outlet_flow -= SCAN_PERIOD_S * OUTLET_FLOW_HEIGHT_RATE_M_S

    return current_level + inlet_flow + outlet_flow


def adjust_temperature(current_temp: float, adjustment_temp: float):
    return TEMP_COEFFICIENT * (adjustment_temp - current_temp) * SCAN_PERIOD_S


def iterate_temperature(current_temp: float, heater_on: float):
    ambient_adjustment = adjust_temperature(
        current_temp=current_temp, adjustment_temp=AMBIENT_TEMPERATURE
    )
    heater_adjustment = 0
    if heater_on:
        heater_adjustment += adjust_temperature(
            current_temp=current_temp, adjustment_temp=HEATER_TEMPERATURE
        )
    return current_temp + ambient_adjustment + heater_adjustment


class SetpointReadback(opcua_cache.LookupBranch):
    def __init__(self, node_builder: opcua_cache.Builder, initial_value: float):
        self.initial_value = initial_value
        self.setpoint = node_builder.create_opcua_cache(
            suffix="Setpoint", node_type=float
        )
        self.readback = node_builder.create_opcua_cache(
            suffix="Readback", node_type=float
        )

    def initialise(self):
        self.setpoint.set(self.initial_value)
        self.readback.set(self.initial_value)


class MixingTank(opcua_cache.LookupBranch):
    def __init__(
        self, node_builder: opcua_cache.Builder, outlet_open: opcua_cache.Value
    ):
        self.level_control = SetpointReadback(
            node_builder=node_builder.extend("LevelControl"), initial_value=5
        )
        self.inlet_open = node_builder.create_opcua_cache(
            suffix="OpenInlet", node_type=bool
        )
        self.temp_control = SetpointReadback(
            node_builder=node_builder.extend("TempControl"), initial_value=50
        )
        self.heater_on = node_builder.create_opcua_cache(
            suffix="HeaterOn", node_type=bool
        )

        self._outlet_open = outlet_open

    def scan(self):
        self.level_control.readback.set(
            iterate_level(
                current_level=self.level_control.readback.get(),
                inlet_open=self.inlet_open.get(),
                outlet_open=self._outlet_open.get(),
            )
        )
        self.temp_control.readback.set(
            iterate_temperature(
                current_temp=self.temp_control.readback.get(),
                heater_on=self.heater_on.get(),
            )
        )
