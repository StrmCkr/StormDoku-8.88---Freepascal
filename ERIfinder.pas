{builds the data base for ERi}
procedure ERIntersection;
var
n,yn,xn,xa,ya,I,j:integer;
begin

setlength(ERi,0);
setlength(ERi,9);

 for xa:= 0 to 8 do
 For n:= 1 to 9 do
   ERi[xa,n]:=[];

 for n:= 1 to 9 do
    for xa:=0 to 2 do
     for ya:=0 to 2 do
	
	  if   (Sec[xa*3+ya+18,n] < 6) and (sec[xa*3+ya+18,n] > 1 )
   then 	
       for I:= 0 to 2 do
         for yn:= (ya*3) to (2+(ya*3)) do     {columns}
          begin
		
           xn:=(I+(xa*3));    {rows}

           j:= (xa*3)+(ya);    {box}
		  		
		   if ( (digitRCB[yn+9,n] * digitrcb[j+18,n] )
           +    (digitRCB[xn,n] * digitrcb[j+18,n] )
           =    (digitRCB[j+18,n]) )

         and  ( DigitRCB[j+18,n] <> [] )
         and  ((digitRCB[yn+9,n] * digitrcb[j+18,n] ) - DigitRCB[xn,n]  <> [])
         and  ((digitRCB[xn,n] * digitrcb[j+18,n] ) - DigitRCB[yn+9,n]  <> [])
          then
		
	        eri[j,n]:=ERI[j,n]+ [bxyn[Rset[xn,yn]]]; { box,n saving position} 
		

		 end;

end;