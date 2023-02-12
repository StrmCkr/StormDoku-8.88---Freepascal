{CHECKS THE GRID FOR INVALID STATES}
procedure errorcheck;
var
XN,N,YN,counting,s,f,k:INTEGER;
count2:RCBnums;
Begin
UNIQUE:= TRUE;

  {redundant checks as they are found below}
{FOR XN:= 0 TO 80 Do
 BEGIN

 //no cell and pm can be empty
 IF (s[XN] = [])  AND (nm[XN] =0 )
  THEN
    UNiQUE:= FALSE;

 //no peer cell of xn, can have the same solved digit
 FOR N IN S[XN] Do
 FOR YN IN PEER[XN] DO
   IF N IN S[YN]
     THEN
       UNIQUE:= FALSE;
END;  }

For xn:= 0 to 26 do
begin

if (sectorN[xn] <>  [1..9]-ssector[xn] )  { and (sectorN[xn] <> [])} {shows mutiple digits pms are missing in full}
 then
  unique:=false;

if (sectorN[xn] <> []) and (sectorN[xn] = [1..9] - ssector[xn]) then
 begin
 Counting:= 0;
 count2:=[];

{no sector can have less digits then unsolved cells
no sector can have more digits then unsolved cells}
   for n in sectorN[xn] do
     begin
      inc(counting);
      count2:= Rnsector[xn,n] + count2;
      end;
     if popcnt(dword((count2))) <> counting
      then
      unique:= false;
 
end;	 
   { no subset can have less cells then the subset digit count} 

For f in [1..8] do
for yn:= slist[F] to flist[F] do
  if comboset[yn] * sectorN[xn] = comboset[yn]
    then
	 begin
	  S:= 0;
      count2:=[];

   for n in sectorN[xn] * comboset[yn] do
     begin
      inc(S);
      count2:= Rnsector[xn,n] + count2;
      end;
     if popcnt(dword((count2))) < S
      then
        unique:= false;
    end;



end;


END;
