procedure viewspace;
var
n,xn,q:integer;
begin
textcolor(67);
writexy(1,66,' Extension Tables: ');
textcolor(darkgray);
write('updates while out of PM grid');
textcolor(6);
writexy(50,68,'Row - # x Col');
textcolor(19);
writexy( 1 , 69, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1,70+xn); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in Rnsector[xn,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1 , 71+xn,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;
textcolor(6);
writexy(50,68+12,'Col - # x Row');
textcolor(19);
writexy( 1, 69+12, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1,70+xn+12);
write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then write(' | ');

    textcolor(8);
  for q:= 0 to 8 do
   if q in Rnsector[xn+9,n]  then
       write(q)
	   else
	   write(space);
	textcolor(19);
	if n = 9 then write(' บ');
	end;
	if xn = 8 then writexy( 1 , 71+xn+12,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

textcolor(6);
writexy(50,68+24,'Box - # x square');
textcolor(19);
writexy( 1 , 69+24, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1,70+xn+24); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in Rnsector[xn+18,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1 , 71+xn+24,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

textcolor(6);
writexy(50,68+36,'Mini Row - # x Col');
textcolor(19);
writexy( 1 , 69+36, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1,70+xn+36); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in BnR[xn,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1 , 71+xn+36,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

textcolor(6);
writexy(50+110,68,'Mini Col - # x Row');
textcolor(19);
writexy( 1+110 , 69, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1+110,70+xn); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in BnC[xn,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1+110 , 71+xn,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;
textcolor(6);
writexy(50+110,68+12,'Mini Row - # x Box');
textcolor(19);
writexy( 1+110 , 69+12, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1+110,70+xn+12); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in RnB[xn,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1+110 , 71+xn+12,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

textcolor(6);
writexy(50+110,68+24,'Mini Col - # x Box');
textcolor(19);
writexy( 1 +110, 69+24, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1+110,70+xn+24); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in CnB[xn,n]  then
       write(q)
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1+110 , 71+xn+24,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

textcolor(6);
writexy(50+110,68+36,'ERI(Box) - # x position');
 write('                    Note:'); textcolor(red); write(' pseudo eri');
textcolor(19);
writexy( 1+110 , 69+36, 'ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');

for xn:= 0 to 8 do  begin
gotoxy(1+110,70+xn+36); write('บ ');
for n:= 1 to 9 do
 begin
  if n <> 1 then  write(' | ');

  textcolor(8);
  for q:= 0 to 8 do
   if q in ERI[xn,n]
    then
     begin
	  if pm[secset[xn+18,q]] * [N] = [] then textcolor(red) else textcolor(8);
       write(q);
	   end
	   else
	   write(space);

textcolor(19);
	if n = 9 then write(' บ');

	end;
	if xn = 8 then  writexy( 1+110 , 71+xn+36,'ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

end;

   textcolor(col2);
   Gotoxy(1,1);
end;



