package body Max2 with SPARK_Mode is
	function FindMax2 (V : Vector) return Integer is
		FirstMax : Natural := 0;
		SecondMax : Natural := 0;
	begin
		for I in V'Range loop
			if V(I) > FirstMax then
				SecondMax := FirstMax;
				FirstMax := V(I);
			elsif V(I) > SecondMax and V(I) < FirstMax then
				SecondMax := V(I);
			end if;

			pragma Loop_Invariant (FirstMax > SecondMax);
	    	pragma Loop_Invariant (for all J in V'First..I => (if V(J) /= FirstMax then SecondMax >= V(J)));
			pragma Loop_Invariant (for some J in V'First..I => FirstMax = V(J));
			pragma Loop_Invariant (if SecondMax /= 0 then (for some J in V'First..I => SecondMax = V(J)));
		end loop;
		return SecondMax;
	end FindMax2;

end Max2;