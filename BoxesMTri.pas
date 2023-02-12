procedure boxesMTri;{symetrical placement}
var
xn,n,n2,n3:integer;

S3:  array [cell] of nums;  {solved grid copy}
Dj: array [digits] of nums; { digit exchange listing}
use:nums;

check: boolean;
 begin

 for xn:= 0 to 80 do
   s3[xn]:=s[xn];

{jumping - Diagonals}
  for n:= 49 to 50  do
    begin
     n2:=n+1;
      issomorph2(#98,chr(n),chr(n2));
     end;
	
 for n:= 49 to 50  do
    begin
     n2:=n+1;
      issomorph2(#115,chr(n),chr(n2));
     end;
	
	
For n:= 1 to 9 do
 dj[n]:=[];

check:= True;
for xn:= 0 to 80 do
 begin
  if  ((s3[xn] = []) and (S[xn] <> []) ) or ((s3[xn] <> []) and (S[xn] = []))
   then
    Check:=false;

    if check = false then break;

	if (S3[xn] <> [] ) and (S[xn] <> [] )  and (S3[xn] * s[xn] <> s3[xn])
	 then
           for n in s3[xn] do
            for n2 in s[xn] do
			begin
              dj[n]:= dj[n] + [n2] +[n] ;
			  dj[n2]:= dj[n2] + [n] + [n2];
            end;

 end;

if check = true then begin
writexy(2,64,'Boxes move Triangular: Jumping Diagonal');
use:=[];
gotoxy(2,65);
 For n:= 1 to 9  do
 if [n] *  use = [] then
  begin
  write('( ',n,' ');
   for n2 in Dj[n]-[n] do
   begin
    write(n2,' ');	
	use:=use +[n,n2];
	end;
  write('),');
  end;
end;

{Broken - Cols}
  for n:= 49 to 50  do
    begin
     n2:=n+1 ;
      issomorph2(#114,chr(n),chr(n2));
     end;
	
For n:= 1 to 9 do
 dj[n]:=[];

check:= True;
for xn:= 0 to 80 do
 begin
  if  ((s3[xn] = []) and (S[xn] <> []) ) or ((s3[xn] <> []) and (S[xn] = []))
   then
    Check:=false;

    if check = false then break;

	if (S3[xn] <> [] ) and (S[xn] <> [] )  and (S3[xn] * s[xn] <> s3[xn])
	 then
           for n in s3[xn] do
            for n2 in s[xn] do
			begin
              dj[n]:= dj[n] + [n2] +[n] ;
			  dj[n2]:= dj[n2] + [n] + [n2];
            end;
end;
if check = true then begin
writexy(2,64,'Boxes move Triangular: Broken Cols');
use:=[];
gotoxy(2,65);
 For n:= 1 to 9  do
 if [n] *  use = [] then
  begin
  write('( ',n,' ');
   for n2 in Dj[n]-[n] do
   begin
    write(n2,' ');	
	use:=use +[n,n2];
	end;
  write('),');
  end;
end;

{Full Diagonals}
  for n:= 49 to 50  do
    for n3:= 0 to 0 do
    begin
     n2:=n+1 +(n3*3);
      issomorph2(#99,chr(n+(n3*3)),chr(n2));
     end;
	
For n:= 1 to 9 do
 dj[n]:=[];

check:= True;
for xn:= 0 to 80 do
 begin
  if  ((s3[xn] = []) and (S[xn] <> []) ) or ((s3[xn] <> []) and (S[xn] = []))
   then
    Check:=false;

    if check = false then break;

	if (S3[xn] <> [] ) and (S[xn] <> [] )  and (S3[xn] * s[xn] <> s3[xn])
	 then
           for n in s3[xn] do
            for n2 in s[xn] do
			begin
              dj[n]:= dj[n] + [n2] +[n] ;
			  dj[n2]:= dj[n2] + [n] + [n2];
            end;
end;
if check = true then begin
writexy(2,64,'Boxes move Triangular: Full Diagonal');
use:=[];
gotoxy(2,65);
 For n:= 1 to 9  do
 if [n] *  use = [] then
  begin
  write('( ',n,' ');
   for n2 in Dj[n]-[n] do
   begin
    write(n2,' ');	
	use:=use +[n,n2];
	end;
  write('),');
  end;
end;

{reversion}
 for n:= 50 downto 49  do
     begin
     n2:=n+1 ;
      issomorph2(#99,chr(n),chr(n2));
     end;

 for n:= 50 downto 49  do
    begin
     n2:=n+1 ;
      issomorph2(#114,chr(n),chr(n2));
     end;

 for n:= 50 downto 49  do
    begin
     n2:=n+1 ;
      issomorph2(#115,chr(n),chr(n2));
     end;
	
 for n:= 50 downto 49  do
    begin
     n2:=n+1;
      issomorph2(#98,chr(n),chr(n2));
     end;	

end;