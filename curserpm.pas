{moves the curser on screen in the pm's box}
procedure curserpm(A,c,d:integer);
var
xr,yr:integer;

begin

 xr:= (Cy[a]+1)*12 - 9;
 yr:= up+31 +(Rx[a]+1)*2 -2;

  textbackground(c);

if d=1 then location(a);
  gotoxy(xr,yr);

end;