from pysupervisor import opcua_cache
from pysupervisor.sim.process.mixing_tank import MixingTank
from pysupervisor.sim.process.transfer_pump import TransferPump


class Process(opcua_cache.LookupBranch):
    def __init__(self, builder: opcua_cache.Builder):
        self.transfer_pump = TransferPump(builder=builder.extend(".TransferPump"))
        self.mixing_tank = MixingTank(
            node_builder=builder.extend(".MixingTank"),
            outlet_open=self.transfer_pump.mix_output,
        )

    def on_fill_mm3(self, quantity: float):
        self.transfer_pump.on_fill_mm3(quantity)
