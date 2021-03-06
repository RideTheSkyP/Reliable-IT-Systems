procedure Rev (S : in out String) with 
	SPARK_Mode,
	Pre => S'First < Positive'Last / 2 and S'Last < Positive'Last / 2,
	Post => (for all I in S'Range => S(I) = S'Old(S'First + S'Last - I))
is
	TemporaryString : String(S'Range) := S;
begin
	for I in S'Range loop
		S(I) := TemporaryString(S'Last - I + S'First);
		pragma Loop_Invariant(for all J in S'First..I => S(J) = TemporaryString(S'Last - J + S'First));
	end loop;
end Rev;
