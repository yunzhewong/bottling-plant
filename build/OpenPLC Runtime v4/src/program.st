FUNCTION_BLOCK FB_11_MixingTank
  VAR_OUTPUT
    Level_RBV : REAL := 50;
    Temp_RBV : REAL := 50;
  END_VAR
  VAR_INPUT
    Level_SP : REAL := 50;
    Temp_SP : REAL := 50;
    InletFlow_SP : REAL := 50;
    OutletFlow_SP : REAL := 50;
    ExternalTemperature : REAL := 50;
  END_VAR

END_FUNCTION_BLOCK

FUNCTION_BLOCK FB_1_Process

END_FUNCTION_BLOCK

PROGRAM main
  VAR
    TON0 : TON;
    PID0 : PID;
  END_VAR
  VAR_INPUT
    In : BOOL := 0;
  END_VAR
  VAR_OUTPUT
    Out : BOOL := 0;
  END_VAR

  Out := In;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
