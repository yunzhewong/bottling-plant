FUNCTION_BLOCK FB_11_MixingTank_TempLevelControl
  VAR
    LevelHysteresis : HYSTERESIS;
    TempHysteresis : HYSTERESIS;
  END_VAR
  VAR_OUTPUT
    InletOpen : BOOL := FALSE;
    HeaterOn : BOOL := FALSE;
  END_VAR
  VAR_OUTPUT RETAIN
  END_VAR
  VAR_INPUT
    LevelSetpoint_m : REAL := 2;
    LevelReadback_m : REAL := 2;
    TempSetpoint_degC : REAL := 50;
    TempReadback_degC : REAL := 50;
    Active : BOOL := 50;
  END_VAR
  VAR_TEMP
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