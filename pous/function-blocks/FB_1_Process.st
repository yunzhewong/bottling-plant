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