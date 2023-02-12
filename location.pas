Procedure location(a:integer); {writes on the screen the Box/Row/Col  & sector }
var
i:integer;
begin
  Gotoxy(3,3); write(BXY[a]);
  gotoxy(7,3); write(Rx[a]);
  gotoxy(11,3); write(Cy[a]);
  gotoxy(15,3); write(Rset[rx[a],cy[a]],' ');
  Gotoxy(42,3); write(bsec[BXY[a]],' ',Rsec[Rx[a]],' ',Csec[Cy[a]],' ');

  gotoxy(2,6); {displaying the pm grid for the selected cell}

  for i:= 1 to 9 do
   if  not (i in ((nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + Delpm[a] + Ipm[a] + covered[a]))
   and  (s[a]=[]) and not (a in covered2[i])
  
     then
      write(I)
     else
      write(space);
	  
if unique = false
  then
   begin
   textcolor(4);
   writexy(28,24,'Error');
   end;
 if unique = True
  then
   begin
   textcolor(6);
   writexy(28,24,'Valid');
   end;
 
if (unique2 = True) 
  then 
   begin 
    textcolor(5); 
	writexy(24,25,'Unique Solution');
   end; 

if (Zero = True) 
  then 
   begin 
    textcolor(5); 
	writexy(24,25,'Zero   Solutions');
   end;
   

 if (unique2 = False) and (zero = false)
  then 
   begin 
    textcolor(5); 
	writexy(24,25,'               ');
   end;   
   
textcolor(col2); 
	  
end;