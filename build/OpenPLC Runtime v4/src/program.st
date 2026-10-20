FUNCTION_BLOCK BangBangControl
  VAR
    HYSTERESIS0 : HYSTERESIS;
    Setpoint : REAL;
    Readback : REAL;
    Tolerance : REAL;
    Active : BOOL;
    ShouldActuate : BOOL;
    Actuating : BOOL;
  END_VAR

  HYSTERESIS0(EN := TRUE, XIN1 := Setpoint, XIN2 := Readback, EPS := Tolerance);
  IF HYSTERESIS0.ENO THEN
      ShouldActuate := HYSTERESIS0.Q;
  END_IF;
  Actuating := ShouldActuate AND Active;
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
    Fault : LatchingFault;
    _TMP_NOT5838470_OUT : BOOL;
  END_VAR

  Fault.Active := TempControl.Active AND LevelControl.Active;
  _TMP_NOT5838470_OUT := NOT(Fault.LatchedOutput);
  TempControl.Active := _TMP_NOT5838470_OUT;
END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_1_Process

END_FUNCTION_BLOCK

PROGRAM main
  VAR
    FB_11_MIXINGTANK0 : FB_11_MixingTank;
  END_VAR

  FB_11_MIXINGTANK0(EN := TRUE);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
