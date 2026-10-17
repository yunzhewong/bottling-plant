FUNCTION_BLOCK FB_11_MixingTank_TempLevelControl
  VAR
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
    Active : BOOL := 50;
  END_VAR
  VAR CONSTANT
    LevelTolerance_m : REAL := 0.1;
    TempTolerance_degC : REAL := 1;
  END_VAR

  // Hysteresis is documented to do be centred around XIN2, but in reality is around XIN1?

  LevelHysteresis(XIN1 := LevelSetpoint_m, XIN2 := LevelReadback_m, EPS := LevelTolerance_m);
  InletOpen := LevelHysteresis.Q AND Active; // If not active, force to 0 

  TempHysteresis(XIN1 := TempSetpoint_degC, XIN2 := TempReadback_degC, EPS := TempTolerance_degC);
  HeaterOn := TempHysteresis.Q AND Active; // If not active, force to 0
END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_11_MixingTank
  VAR
    TempControl : FB_11_MIXINGTANK_TEMPLEVELCONTROL;
  END_VAR
  VAR_OUTPUT
    Running : BOOL := FALSE;
  END_VAR
  VAR_INPUT
    Start : BOOL := FALSE;
    Stop : BOOL := TRUE;
  END_VAR

  Running := Stop AND (Running OR Start);
  TempControl(EN := TRUE, Active := Running);
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
