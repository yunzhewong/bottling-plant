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