FUNCTION_BLOCK FB_12_TransferPump
  VAR
    RequestMixDrain : BOOL;
    MixOutletOpen : BOOL;
  END_VAR
  VAR CONSTANT
  END_VAR
  VAR_INPUT
    MixLevelReadback : REAL;
  END_VAR
  VAR_TEMP
  END_VAR
  VAR_OUTPUT
    BufferLevelReadback : REAL;
    LatchingFault : LATCHINGFAULT;
  END_VAR

MixOutletOpen := RequestMixDrain AND MixLevelReadback > 1 AND NOT LatchingFault.LatchedOutput;

END_FUNCTION_BLOCK