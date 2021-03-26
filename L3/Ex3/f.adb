with Interfaces; 
use Interfaces;

function F(X : Unsigned_64) return Unsigned_64 with 
	SPARK_Mode
is
	Y : Unsigned_64 := X;
begin
	while Y mod 2 /= 0 loop
		pragma Loop_Variant(Increases => Y);
		Y := (3 * Y + 1) / 2;
		
	end loop;
	return Y / 2;
end F;
