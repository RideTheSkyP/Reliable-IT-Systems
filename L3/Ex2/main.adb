with Ada.Text_IO; 
use Ada.Text_IO;
with Rev;

procedure Main is
	TemporaryString : String := "String to reverse";
begin
	Rev(TemporaryString);
	Put_Line(TemporaryString);
end Main;
