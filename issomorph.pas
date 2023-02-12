procedure issomorph( K2,B2,F2:Char);
var
K,B,F:char;
xn,xl,n:integer;
S2: array [cell] of nums;  {solved grid copy}

begin

for xn:= 0 to 80 do
 begin
 s2[xn]:=S[xn];
 end;
 
initiate;

for xn:= 0 to 80 do 
 s[xn]:=s2[xn];

k:=k2;
b:=b2;
f:=f2;

if not (K in ['d','t','s','b','c','r','m','p'])
 then
   begin
writexy(2,29,' Which area to move?');
writexy(2,30,' D{igit},R{ow},C{ol},S{tack},B{and},T{ranspose},M{irror},P{ivot}');
K:=readkey;
gotoxy(23,29); write(': ',K);
   end;

 case K of

{R} #114:
 begin

   if not (B in ['1'..'9'])
    then
     begin
   writexy(2,31,' Which Row to move? {1..9}');
   B:=readkey;  write(': ',B);
     end;

   if not (F in ['1'..'9'])
    then
     begin
   writexy(2,32,' Swaping with Row?');

   case B of
    #49,#50,#51 : write(' 1,2,3');
    #52,#53,#54 : write(' 4,5,6');
    #55,#56,#57 : write(' 7,8,9');

   end;

   F:=readkey; write(': ',F);
    end;

   for xn:=0 to 8 do
    begin

    s[Rset[(ord(b)-48)-1,xn]]:= S2[Rset[(ord(f)-48)-1,xn]];
    s[Rset[(ord(f)-48)-1,xn]]:= S2[Rset[(ord(b)-48)-1,xn]];	

    end;

  end;  {row}

{C} #99:
 begin

  if not (B in ['1'..'9'])
    then
     begin
   writexy(2,31,' Which Col to move? {1..9}');
   B:=readkey;  write(': ',B);
     end;

   if not (F in ['1'..'9'])
    then
     begin
   writexy(2,32,' Swaping with Col?');

   case B of
    #49,#50,#51 : write(' 1,2,3');
    #52,#53,#54 : write(' 4,5,6');
    #55,#56,#57 : write(' 7,8,9');

   end;

   F:=(readkey); write(': ',F);
    end;
	
  for xn:=0 to 8 do
    begin

    s[Cset[(ord(b)-48)-1,xn]]:= S2[Cset[(ord(f)-48)-1,xn]];
    s[Cset[(ord(f)-48)-1,xn]]:= S2[Cset[(ord(b)-48)-1,xn]];

    end;

 end; {col}

{Band} #98:
 begin

    if not (B in ['1'..'3'])
    then
     begin
   writexy(2,31,' Which Band to Swap? {1..3}');
   B:=readkey;  write(': ',B);
     end;

    if not (F in ['1'..'3'])
    then
     begin
   writexy(2,32,' Swaping with Band? {1..3}');
   F:=readkey;  write(': ',F);
      end;

   For xn:= 0 to 8 do
    for n:= 0 to 2 do
      begin
        s[Rset[(((ord(b)-48)-1)*3+n),xn]]:=s2[Rset[(((ord(f)-48)-1)*3+n),xn]];
        s[Rset[(((ord(f)-48)-1)*3+n),xn]]:=s2[Rset[(((ord(b)-48)-1)*3+n),xn]];	
		
		
      end;

 end;  {Band}

{stack} #115:
 begin

     if not (B in ['1'..'3'])
    then
     begin
   writexy(2,31,' Which Stack to Swap? {1..3}');
   B:=readkey;  write(': ',B);
     end;

    if not (F in ['1'..'3'])
    then
     begin
   writexy(2,32,' Swaping with Stack? {1..3}');
   F:=readkey;  write(': ',F);
      end;

   For xn:= 0 to 8 do
    for n:= 0 to 2 do
      begin
        s[Cset[(((ord(b)-48)-1)*3+n),xn]]:=s2[Cset[(((ord(f)-48)-1)*3+n),xn]];
        s[Cset[(((ord(f)-48)-1)*3+n),xn]]:=s2[Cset[(((ord(b)-48)-1)*3+n),xn]];
		
		
      end;

 end; {stack}

{Transpose} #116:
 begin

 if not(k2 in['t'])
 then
 writexy(2,31,' Transposing Grid (Diagonal reflection & Anti Diagonal Reflection)');
 if not (b in ['1'..'2'] )
  then begin
 writexy(2,32,' Diagonal / Anti Diagonal ? {1,2} ');
   B:=readkey;  write(': ',B);
   end;

  if b = '1' then 
  begin
 for xn:= 0 to 8 do
  for n:= 0 to 8 do
   begin

     S[Rset[xn,n]]:=s2[Cset[xn,n]];

    end;
 end;

  if b = '2' then  
  begin
  for xn:= 8 downto 0 do
   for n:= 8 downto 0 do
   begin

   S[Rset[n,xn]]:=s2[Cset[8-n,8-xn]];
   	
   end;
   end;

 end; {Transpose}

{D} #100:
 begin

  if not (B in ['1'..'9'] )
   then
   begin
  writexy(2,31,' Which Digit to Swap? {1..9}');
   B:=readkey;  write(': ',B);
   end;

  if not (F in ['1'..'9'] )
   then
   begin
   writexy(2,32,' Swaping with Digit {1..9}');
   F:=readkey;  write(': ',F);
    end;

   For xn:= 0 to 80 do
   begin

    if S2[xn]= [ord(b)-48 ]
      then
	   begin
        s[xn]:=[ord(F)-48];
		
		end;

    if S2[xn]= [ord(F)-48 ]
      then
      s[xn]:=[ord(B)-48];
    end;

 end;

 {Mirror} #109: begin
 if not(k2 in['m'])
 then
 writexy(2,31,' Mirror Grid (Reflection)');
 if not (b in ['1'..'2'] )
  then begin
 writexy(2,32,' Horizontal / Vertical ? {1,2}');
   B:=readkey;  write(': ',B);
   end;
   
    if B ='1'
     then	  
	  begin	  
	   for n:= 0 to 8 do
	   for xn:= 0 to 8 do
	   S[rset[xn,n]]:=S2[Rset[(8-xn),n]];
	  end;

	if B ='2'
     then	 
	  begin
	   for n:= 0 to 8 do
	   for xn:= 0 to 8 do
	   S[Cset[xn,n]]:=S2[Cset[(8-xn),n]];
	  end;

 end;

 {Pivot/quater turn} #112:
 begin

 if not(k2 in['p'])
 then
 writexy(2,31,' Pivot Grid ( 1/4 turn)');
 if not (b in ['1'..'2'] )
  then begin
 writexy(2,32,' Left / Right ? {1,2}');
   B:=readkey;  write(': ',B);
   end;

  if b = '1' then begin
 for xn:= 0 to 8 do
  for n:= 8 downto 0 do
   begin

     S[Cset[xn,(8-n)]]:=s2[Rset[xn,n]];

    end;
 end;

  if b = '2' then begin
  for xn:= 8 downto 0 do
   for n:= 0 to 8 do
   begin

   S[Cset[xn,n]]:=s2[Rset[(8-xn),n]];

   end;
   end;

 end; {pivit}
   end;

if not (K2 in ['d','t','s','b','c','r','m','p'])
 then
   begin
writexy(2,29,'                                                ');
writexy(2,30,'                                                                  ');
writexy(2,31,'                                                                  ');
writexy(2,32,'                                      ');
end;

for xL:=0 to 80 do
 if s[xl] <> [] then
    begin
      nsector[Rx[xl]]:=nsector[rx[xl]] + s[xl];
      nsector[Cy[xl]+9]:=nsector[cy[xl]+9] + s[xl];
      nsector[bxy[xl]+18]:=nsector[Bxy[xl]+18] + s[xl];
	  
        exclude(ocell,xl);
		include(Acell,xl);		
     end;
	 
{sbrc;
errorcheck;
wpm(1,0,0);}	 

end;  {issomorphic transformation}