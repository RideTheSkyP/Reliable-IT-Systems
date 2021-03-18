function Sqrt (X : Float; Tolerance : Float) return Float
	with
		SPARK_Mode,
		Pre => X >= 0.0 and X <= 1.8E19 and
			Tolerance > Float'Model_Epsilon and Tolerance <= 1.0,
		Post => abs(X - Sqrt'Result ** 2) <= X * Tolerance
is
	Approx : Float := X;
begin
	-- if X = 0.0 or X = 1.0 then 
	-- 	return Approx; 
	-- end if;

	while abs(X - Approx ** 2) > X * Tolerance loop
		exit when Approx = 0.0;
		Approx := (Approx + X / Approx) / 2.0;


		pragma Loop_Invariant (if X < 1.0 then (Approx < 1.0 and Approx >= X)
							   else (if X > 1.0 then (Approx >= 1.0 and Approx < X)));
		-- pragma Loop_Invariant((if X < 1.0 then (Approx >= X and Approx < 1.0)));
		-- pragma Loop_Invariant((if X > 1.0 then (Approx >= 1.0 and Approx < X)));
		-- pragma Loop_Invariant(if X < 1.0 then Approx < 1.0);
		-- pragma Loop_Invariant(if X < 1.0 then Approx > X);
		-- pragma Loop_Invariant(if X > 1.0 then Approx > 1.0);
		-- pragma Loop_Invariant(if X > 1.0 then Approx < X);
	end loop;
	return Approx;
end Sqrt;