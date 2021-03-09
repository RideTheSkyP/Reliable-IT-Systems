with Ada.Integer_Text_IO;
with Selection;

procedure Main is
   A : Selection.Arr := (14, 9, -21, 2, 21, 5, -4, 0);
begin
   Selection.Sort(A);
   for I in A'First .. A'Last loop
      Ada.Integer_Text_IO.Put(A(I));
   end loop;
end Main;
