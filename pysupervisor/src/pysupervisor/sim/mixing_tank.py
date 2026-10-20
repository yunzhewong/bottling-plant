from pysupervisor.node_builder import NodeBuilder
from pysupervisor.sim.constants import SCAN_PERIOD_S

INLET_FLOWRATE_M3S = 0.1
AMBIENT_TEMPERATURE = 25
HEATER_TEMPERATURE = 100
TEMP_COEFFICIENT = 0.01


def iterate_level(current_level: float, inlet_open: bool):
    if not inlet_open:
        return current_level
    return current_level + SCAN_PERIOD_S * INLET_FLOWRATE_M3S


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


class SetpointReadback:
    def __init__(self, node_builder: NodeBuilder):
        self.setpoint = node_builder.create_node_ref(
            suffix=".Setpoint", node_type=float
        )
        self.readback = node_builder.create_node_ref(
            suffix=".Readback", node_type=float
        )

    async def initialise(self, initial_value: float):
        await self.setpoint.set(initial_value)
        await self.readback.set(initial_value)


class MixingTank:
    def __init__(self, node_builder: NodeBuilder):
        self.level_control = SetpointReadback(
            node_builder=node_builder.extend(".LevelControl")
        )
        self.inlet_open = node_builder.create_node_ref(
            suffix=".OpenInlet", node_type=bool
        )
        self.temp_control = SetpointReadback(
            node_builder=node_builder.extend(".TempControl")
        )
        self.heater_on = node_builder.create_node_ref(
            suffix=".HeaterOn", node_type=bool
        )

    async def initialise(self):
        await self.level_control.initialise(initial_value=5)
        await self.temp_control.initialise(initial_value=50)

    async def scan(self):
        await self.level_control.readback.set(
            iterate_level(
                current_level=await self.level_control.readback.get(),
                inlet_open=await self.inlet_open.get(),
            )
        )
        await self.temp_control.readback.set(
            iterate_temperature(
                current_temp=await self.temp_control.readback.get(),
                heater_on=await self.heater_on.get(),
            )
        )
