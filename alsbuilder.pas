procedure alsfinder;
 var
 xn,yn,yn2,l,j,m,r,s,f:integer;
 output: text;

 begin
cellcombo;

{assign(output,'C:\sudoku\combotest.txt');
erase(output);
rewrite(output);
close(output);}

R:=-1;
setlength(als,r+1,5);
 for xn:= 0 to 26 do  {"A" sector search}
  for L:= 1 to 8 do  { N cell  postion  size max is 8 for +1 digits}
  if popcnt(dword(sectorN[xn])) >= 2 then  {skips sectors that have less then 2 digits}
   		if ((L < 2) and (xn in [18..26] ) )
			  or ( l > 1)
			   then

 for M:= 0 to (8-L) do {sets the digit count  flex range and links required based on l}
  begin
  J:= M+L +1; {sets the digit count size}
 if popcnt(dword(sectorN[xn])) >= j then  {skips sectors with less then j digit}

   for yn:= Slist[l] to flist[l] do {position size}
   if not((xn in [0..17]) and (  yn in [9,10,17,30,31,35,42,43,44] ) and (l =2)) {duplicate skipping code}
	and not( (xn in [0..17]) and (yn in [45,109,128]) and (l =3))
	 then
   if ( combocell[510] * combosets[xn,yn] = combosets[xn,yn] )  {checks that all active cells for the selected set are active}
    then
   if  (popcnt(dword(Combonum[yn,xn])) = j)     {checks that the # of active cells only have J digit}
    then
   for yn2:= Slist[j] to flist[j] do  {digit count}
   if (sectorN[xn] * comboset[yn2] = comboset[yn2] )  {checks the set selected has all digits }
    then
       if  (combocell[yn2] * combosetS[xn,yn]  = combosetS[xn,yn])  {digit count matches position size}
	  then
	   begin
	   r:=r+1;
	   setlength(als,R+1,5);
	   als[R,0]:=xn;
	   als[R,1]:=l;
	   als[R,2]:=j;
	   als[R,3]:=yn;
	   als[R,4]:=yn2;	
	  { append(output);
	   if R > 0 then  writeln(output);
       write(output,als[r,0],' ',als[r,1],' ',als[r,2],' ',als[r,3],' ',als[r,4]);	
	   close(output);}		
	   end;		
end;
{
writexy(2,60,' ');
write(r,' ');
write(high(als));}
end;

procedure aHsfinder;
 var
 xn,yn,yn2,l,j,m,r,s,f:integer;
 output: text;
 begin

assign(output,'C:\sudoku\combotest.txt');
erase(output);
rewrite(output);
close(output);		

Cellcombo;
 
 r:=-1;
 setlength(ahs,r+1,5);

 for xn:= 0 to 26 do
    for L:= 1 to 8 do {digits}
	if (popcnt(dword(sectorN[xn])) >= l)
	 then
	  for m:= 0 to (8 - L) do  {sets the Cell count  flex range and links required based on l}
	    begin
       J:= (M+L)+1; {cell size}

 for yn:= Slist[l] to flist[l] do  {digit set used}
if (sectorN[xn]*comboset[yn]) = comboset[yn]  {digit set must match exactly}
 then
   for yn2:= Slist[j] to flist[j] do  {cells} {cycles the positions listing based on the set}
    if not((xn in [18..26]{[0..17]}) and (  yn2 in [9,10,17,30,31,35,42,43,44] ) and (J =2)) {duplicate skipping code}
	and not( (xn in [18..26]{[0..17]}) and (yn2 in [45,109,128]) and (J =3))
	 then
       if   hcombonum[yn,xn]  = comboset2[yn2] {position count matchs, j size}
         then
           begin
		    R:=R+1;
	        setlength(ahs,R+1,5);
	         ahs[R,0]:=xn; {sector}
	         ahs[R,1]:=l;  {Digit size}
	         ahs[R,2]:=j;  {cell size}
	         ahs[R,3]:=yn; {digits}
	         ahs[R,4]:=yn2; {cells position}
			
       append(output);
	   if R > 0 then  writeln(output);
       write(output,ahs[r,0],' ',ahs[r,1],' ',ahs[r,2],' ',ahs[r,3],' ',ahs[r,4]);	
	   close(output);	
		   end;

        end;
end;

procedure nlsfinder;
 var
 xn,yn,yn2,l,j,m,r,s,f:integer;
 output: text;

 begin
cellcombo;

{assign(output,'C:\sudoku\combotest.txt');
erase(output);
rewrite(output);
close(output);}

R:=-1;
setlength(nls,r+1,5);
 for xn:= 0 to 26 do  {"A" sector search}
  for L:= 1 to 9 do  { N cell  postion  size max is 9 for n digits}
  if popcnt(dword(sectorN[xn])) >= 2 then  {skips sectors that have less then 2 digits}
   		if ((L < 2) and (xn in [18..26] ) )
			  or ( l > 1)
			   then

 for M:= 0 to 0{8 -l} do {sets the digit count  flex range and links required based on l}
  begin
  J:= M+L ; {sets the digit count size}
 if popcnt(dword(sectorN[xn])) > j then  {skips sectors with less then j digit}

   for yn:= Slist[l] to flist[l] do {position size}
   if not((xn in [0..17]) and (  yn in [9,10,17,30,31,35,42,43,44] ) and (l =2)) {duplicate skipping code}
	and not( (xn in [0..17]) and (yn in [45,109,128]) and (l =3))
	 then
   if ( combocell[510] * combosets[xn,yn] = combosets[xn,yn] )  {checks that all active cells for the selected set are active}
    then
   if  (popcnt(dword(Combonum[yn,xn])) = j)     {checks that the # of active cells only have J digit}
    then
   for yn2:= Slist[j] to flist[j] do  {digit count}
   if (sectorN[xn] * comboset[yn2] = comboset[yn2] )  {checks the set selected has all digits }
    then
       if  (combocell[yn2] * combosetS[xn,yn]  = combosetS[xn,yn])  {digit count matches position size}
	  then
	   begin
	   r:=r+1;
	   setlength(nls,R+1,5);
	   nls[R,0]:=xn;
	   nls[R,1]:=l;
	   nls[R,2]:=j;
	   nls[R,3]:=yn;
	   nls[R,4]:=yn2;	
	   append(output);
	  { if R > 0 then  writeln(output);
       write(output,nls[r,0],' ',nls[r,1],' ',nls[r,2],' ',nls[r,3],' ',nls[r,4]);	
	   close(output);	}	
	   end;		
end;
{
writexy(2,60,' ');
write(r,' ');
write(high(nls));}
end;

procedure Hlsfinder;
 var
 xn,yn,yn2,l,j,m,r,s,f:integer;
 output: text;
 begin

{assign(output,'C:\sudoku\combotest.txt');
erase(output);
rewrite(output);
close(output);}		

Cellcombo;
 
 r:=-1;
 setlength(hls,r+1,5);

 for xn:= 0 to 26 do
    for L:= 1 to 9 do {digits}
	if (popcnt(dword(sectorN[xn])) > l)
	 then
	  for m:= 0 to 0{(8 - L)} do  {sets the Cell count  flex range and links required based on l}
	    begin
       J:= (M+L); {cell size}

 for yn:= Slist[l] to flist[l] do  {digit set used}
if (sectorN[xn]*comboset[yn]) = comboset[yn]  {digit set must match exactly}
 then
   for yn2:= Slist[j] to flist[j] do  {cells} {cycles the positions listing based on the set}
    if not((xn in [18..26]{[0..17]}) and (  yn2 in [9,10,17,30,31,35,42,43,44] ) and (J =2)) {duplicate skipping code}
	and not( (xn in [18..26]{[0..17]}) and (yn2 in [45,109,128]) and (J =3))
	 then
       if   hcombonum[yn,xn]  = comboset2[yn2] {position count matchs, j size}
         then
           begin
		    R:=R+1;
	        setlength(hls,R+1,5);
	         hls[R,0]:=xn; {sector}
	         hls[R,1]:=l;  {Digit size}
	         hls[R,2]:=j;  {cell size}
	         hls[R,3]:=yn; {digits}
	         hls[R,4]:=yn2; {cells position}
			
      { append(output);
	   if R > 0 then  writeln(output);
       write(output,hls[r,0],' ',hls[r,1],' ',hls[r,2],' ',hls[r,3],' ',hls[r,4]);	
	   close(output);}	
		   end;

        end;
end;