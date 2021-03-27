function Sqrt (X : Float; Tolerance : Float) return Float with 
	SPARK_Mode,
	Pre => X >= 0.0 and X <= 1.8E19 and Tolerance > Float'Model_Epsilon and Tolerance <= 1.0,
	Post => abs(X - Sqrt'Result ** 2) <= X * Tolerance
is
	Approx : Float := X;
begin
	while abs(X - Approx ** 2) > X * Tolerance loop
		exit when Approx = 0.0 or Approx = 1.0;
		Approx := (Approx + X / Approx) / 2.0;
		
		pragma Loop_Invariant(if X < 1.0 then (Approx < 1.0 and Approx > X)
							  else (if X > 1.0 then (Approx > 1.0 and Approx < X)));
	end loop;
	
	pragma Assert(abs(X - Approx ** 2) <= X * Tolerance);
	return Approx;
end Sqrt;
