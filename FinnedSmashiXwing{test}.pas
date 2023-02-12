{ Finned and or Sashimi x-wings}
procedure smashi (k:integer);
var 
g,xn,xn2,u:integer;
begin 
if k = 0 then begin u:=0; setlength(techwrite,u+1,12); end;

For G in [1..9] do
 for xn:= low(linkset[g,1]) to high(linkset[g,1] )do
  
  for xn2:=low(linkset[g,2] ) to high(linkset[g,2]) do 
      if (linkset[g,1,xn,5] * linkset[g,2,xn2,4] <> [])
	 and (linkset[g,1,xn,5] * linkset[g,2,xn2,4] <> [])
	   and (linkset[g,1,xn,8] * linkset[g,2,xn2,9] <> [])
	  and ((linkset[g,1,xn,2]+linkset[g,1,xn,1] ) * (linkset[g,2,xn2,1]+linkset[g,2,xn2,2] ) = [])
	 
	   then 
	     begin
		  active:=true;L		 
		  covered2[g]:=covered2[g] + (linkset[g,1,xn,8] * linkset[g,2,xn2,9]); 
		 end; 
   

if k = 0 then techdisplay(#20,u);

end;{finned sashim x-wing} 