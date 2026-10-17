FUNCTION_BLOCK FB_11_MixingTank
  VAR
    LevelTolerance_m : REAL := 0.1;
    TempTolerance_m : REAL := 1;
    LevelHysteresis : HYSTERESIS;
    TempHysteresis : HYSTERESIS;
  END_VAR
  VAR_OUTPUT
    InletOpen : BOOL := FALSE;
    HeaterOn : BOOL := FALSE;
  END_VAR
  VAR_INPUT
    LevelSetpoint_m : REAL := 2;
    LevelReadback_m : REAL := 2;
    TempSetpoint_degC : REAL := 50;
    TempReadback_degC : REAL := 50;
  END_VAR

  LevelHysteresis(EN := TRUE, XIN1 := LevelReadback_m, XIN2 := LevelSetpoint_m, EPS := LevelTolerance_m);
  InletOpen := NOT(LevelHysteresis.Q);
  TempHysteresis(EN := TRUE, XIN1 := TempReadback_degC, XIN2 := TempSetpoint_degC, EPS := TempTolerance_m);
  HeaterOn := NOT(TempHysteresis.Q);
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
