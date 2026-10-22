FUNCTION_BLOCK BangBangControl
  VAR
    Hysteresis : HYSTERESIS;
  END_VAR
  VAR_INPUT
    Setpoint : REAL;
    Tolerance : REAL;
  END_VAR
  VAR_OUTPUT
    Readback : REAL;
    ShouldActuate : DINT;
  END_VAR

  Hysteresis( XIN1 := Setpoint, XIN2 := Readback, EPS := Tolerance);
  ShouldActuate := Hysteresis.Q;
END_FUNCTION_BLOCK

FUNCTION_BLOCK LatchingFault
  VAR_INPUT
    Active : BOOL := FALSE;
    Reset : BOOL := FALSE;
  END_VAR
  VAR_OUTPUT
    LatchedOutput : BOOL := FALSE;
  END_VAR

  LatchedOutput := Active OR (LatchedOutput AND NOT Reset);
END_FUNCTION_BLOCK

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

FUNCTION_BLOCK FB_12_TransferPump
  VAR
    RequestMixDrain : BOOL;
    MixOutletOpen : BOOL;
  END_VAR
  VAR_INPUT
    MixLevelReadback : REAL;
  END_VAR
  VAR_OUTPUT
    BufferLevelReadback : REAL;
    LatchingFault : LATCHINGFAULT;
  END_VAR

  MixOutletOpen := RequestMixDrain AND MixLevelReadback > 1 AND NOT LatchingFault.LatchedOutput;
END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_1_Process
  VAR
    MixingTank : FB_11_MIXINGTANK;
    TransferPump : FB_12_TRANSFERPUMP;
  END_VAR
  VAR_OUTPUT
    BufferLevel : REAL;
  END_VAR

  MixingTank();
  TransferPump(MixLevelReadback := MixingTank.LevelReadback);
  BufferLevel := TransferPump.BufferLevelReadback;
END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_2_Packaging
  VAR
    Filler : FB_2_PACKAGING_FILLER;
    Conveyor : FB_2_PACKAGING_CONVEYOR;
  END_VAR

  Filler();
  Conveyor();
END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_2_Packaging_Filler
  VAR
    FlowRateSetpoint_mm3_s : REAL;
    FlowRateReadback_mm3_s : REAL;
    FillVolume_mm3 : REAL;
    OverFillFault : LATCHINGFAULT;
  END_VAR
  VAR_OUTPUT
    BottleFull : BOOL;
  END_VAR

  if FillVolume_mm3 > 100 then
      BottleFull := TRUE;
  end_if
  OverFillFault(Active := FillVolume_mm3 > 120);
END_FUNCTION_BLOCK

PROGRAM main
  VAR
    Process : FB_1_Process;
    Packaging : FB_2_Packaging;
  END_VAR

  Process(EN := TRUE);
  Packaging(EN := TRUE);
END_PROGRAM

FUNCTION_BLOCK FB_2_Packaging_Conveyor
  VAR_INPUT
    BottleFull : BOOL;
  END_VAR
  VAR
    LoadBottle : BOOL;
    BottleLoaded : BOOL;
    LoadedCount : INT;
  END_VAR

END_FUNCTION_BLOCK


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
