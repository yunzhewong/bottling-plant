(* Mixing Tank of Fluids and Temperature *)

FUNCTION_BLOCK FB_11_MixingTank
  VAR
  END_VAR
  VAR_OUTPUT
    Level_RBV : REAL := 50;
    Temp_RBV : REAL := 50;
  END_VAR
  VAR_OUTPUT RETAIN
  END_VAR
  VAR_INPUT
    Level_SP : REAL := 50;
    Temp_SP : REAL := 50;
    InletFlow_SP : REAL := 50;
    OutletFlow_SP : REAL := 50;
    ExternalTemperature : REAL := 50;
  END_VAR


{
  "name": "FB_11_MixingTank",
  "rungs": []
}
END_FUNCTION_BLOCK