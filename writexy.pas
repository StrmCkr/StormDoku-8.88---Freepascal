//writing functions grid layout.
procedure writexy(x,y:integer; s:string);
begin
  gotoxy(x,y);
  write(s);
end;