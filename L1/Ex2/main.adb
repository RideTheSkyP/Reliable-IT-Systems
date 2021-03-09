with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;
with Poly;

procedure Main is
   X : Integer;
   A : Poly.Vector (0 .. 2);
begin
   X := 2;
   A := (10, 15, 20);

   Put(Poly.Horner(X, A));
end Main;
