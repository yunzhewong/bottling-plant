FUNCTION_BLOCK FB_11_MixingTank
  VAR
    TempControl : BANGBANGCONTROL;
    LevelControl : BANGBANGCONTROL;
    RequestTempControl : BOOL;
    RequestLevelControl : BOOL;
    LatchingFault : LATCHINGFAULT;
    OpenInlet : BOOL;
    HeaterOn : BOOL;
  END_VAR
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
    LevelReadback : REAL;
  END_VAR

TempControl(Tolerance := 1);
LevelControl(Tolerance := 0.2);

LatchingFault(Active := RequestTempControl AND RequestLevelControl);

HeaterOn := RequestTempControl AND TempControl.ShouldActuate AND NOT LatchingFault.LatchedOutput;
OpenInlet := RequestLevelControl AND LevelControl.ShouldActuate AND NOT LatchingFault.LatchedOutput;
LevelReadback := LevelControl.Readback;

END_FUNCTION_BLOCK