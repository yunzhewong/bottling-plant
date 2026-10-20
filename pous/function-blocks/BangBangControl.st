FUNCTION_BLOCK BangBangControl
  VAR
    Hysteresis : HYSTERESIS;
  END_VAR
  VAR_INPUT
    Setpoint : REAL;
    Tolerance : REAL;
  END_VAR
  VAR_OUTPUT
    Readback : REAL;
    ShouldActuate : DINT;
  END_VAR

Hysteresis( XIN1 := Setpoint, XIN2 := Readback, EPS := Tolerance);
ShouldActuate := Hysteresis.Q;

END_FUNCTION_BLOCK