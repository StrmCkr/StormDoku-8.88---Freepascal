{writes the pencil marks to screen}
procedure Wpm(R,D,H:integer);
var
A,Xw,Yw,i:integer;
B:numberset;
begin

 if D = 0 {whole grid}
 then
 B:=[0..80];

 if D = 1 then  {only updates the affected cell + peers}
 B:= peer[h] + [h];

 if D = 2 then  {updates the pm cells directly changed}
   B:= [h];

for a in b do

 begin

  textcolor(col2);

  if (S[a] <> []) or (R=1)
   then
     curser(a,colbg,0);

  xw:= ( (Cy[a])+1) * 12 - 9 ;
  yw:= up + 31 + ((Rx[a])+1)*2-2;

  textcolor(5);
  gotoxy(xw,yw);

 For I:= 1 to 9 do
    if not (I in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + coveredact[a])//* covered[a] * pm[a]  ))
   and not (a in covered2act[i])
  and  (s[a]=[])
    then
       write(I)
      else
       write(space);

 end;
 
textcolor(col2);
writexy(20,23,'   ');
gotoxy(20,23);
write(scount);
writexy(22,24,'   ');
gotoxy(22,24);
write(count);
writexy(17,25,'   ');
gotoxy(17,25);
write(countpm);	
 
if (d<>2) and (table = true) then viewspace; 
// only updates view space when it leaves the pm board


end;