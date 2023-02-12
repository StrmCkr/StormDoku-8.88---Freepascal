{moves the cursers n screen in the givens box & displays some info on the cell active}
procedure Curser(A,c,d:integer);
var
xr,yr,i:integer;
begin

  xr:=LEFT + (Cy[a]+1)*4 -2;
  yr:=UP + (Rx[a]+1)*2 -1;

  gotoxy(xr,yr);

  textbackground(c);

  if( S[a]=[] )
  then
     write( SPACE )
  else
     for i in (S[a]) do
         write(i);

if D = 1 then Location(a);
gotoxy(xr,yr);
end;