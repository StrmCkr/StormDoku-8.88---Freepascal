{Empty Rectangle}
procedure ER(K:integer);
var
g,a,xn,xn2,xn3,u:integer; 
begin
links; 
if k = 0 then begin u:=0; setlength(techwrite,u+1,12);  end;

for g in [1..9] do
 for xn:=low(linkset[g][6]) to high(linkset[g][6]) do
   for xn2:=low(linkset[g,1]) to high(linkset[g][1]) do
   
   if (linkset[g,6,xn,5] * linkset[g,1,xn2,4] <>[])
   and ((linkset[g,6,xn,1]+linkset[g,6,xn,2]) * (linkset[g,1,xn2,2]+linkset[g,1,xn2,1]) = [])    

 then 
 begin 
    {basic} 
  if (linkset[g,6,xn,8] * linkset[g,1,xn2,9] <> [])
   then    
    begin 
   active:=true;    
   covered2[g]:=covered2[g] + (linkset[g,6,xn,8] * linkset[g,1,xn2,9])
    end; 
	
	{+ 1 link for rings/crabby} 
	for a in[1,6] do 
	for xn3:= low(linkset[g,a]) to high(linkset[g][a]) do
       if  ((linkset[g,6,xn,1]+linkset[g,6,xn,2]) * (linkset[g,a,xn3,2]+linkset[g,a,xn3,1]) = [])
	   and ((linkset[g,1,xn2,1]+linkset[g,1,xn2,2]) * (linkset[g,a,xn3,2]+linkset[g,a,xn3,1]) = [])
       and (linkset[g,6,xn,4] * linkset[g,a,xn3,4] <> [])
 
          then 
             begin 
 			     { crabby  + } 
                active:=true; 
              covered2[g]:=covered2[g] + (linkset[g,6,xn,9] * linkset[g,a,xn3,9]);
			  covered2[g]:=covered2[g] + (linkset[g,1,xn2,9] * linkset[g,a,xn3,9]);

			  if (a =5) and (linkset[g,a,xn3,5] * linkset[g,1,xn2,5] <> []) {linked er}
			    then 
				  begin 
				  covered2[g]:=covered2[g] + (linkset[g,1,xn2,8] * linkset[g,6,xn,9]);
				  covered2[g]:= covered2[g] +(linkset[g,6,xn,8] * linkset[g,a,xn3,8]); 
				  covered2[g]:=covered2[g] + (linkset[g,a,xn3,8] * linkset[g,1,xn2,8])
				  end; 
				  
			  exit;
              end; 
   
	
end;   
      

 if k = 0 then techdisplay(#65,u);
end;{empty rectangle}