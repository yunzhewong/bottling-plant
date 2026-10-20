FUNCTION_BLOCK LatchingFault
  VAR
  END_VAR
  VAR_INPUT
    Active : BOOL := FALSE;
    Reset : BOOL := FALSE;
  END_VAR
  VAR_OUTPUT
    LatchedOutput : BOOL := FALSE;
  END_VAR


LatchedOutput := Active OR (LatchedOutput AND NOT Reset);

END_FUNCTION_BLOCK