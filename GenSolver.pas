Procedure solve2(K:integer);
var
Count2,Countpm2: integer;
begin
 
repeat

Countpm2:=countpm;
count2:= count;

if count = 81 then break;

if  (countpm2 = countpm)  and (count2 = count)  and (k >0 )
  then
   begin
    BLR(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;
{
if  (countpm2 = countpm)  and (count2 = count)  and (k >8 )
  then
   begin
    hp(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)   and (k >8 )
  then
   begin
    np(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >5 )
  then
   begin
    xwing(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >5 )
  then
   begin
    ht(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)   and (k >5 )
  then
   begin
    nt(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)   and (k >5 )
  then
   begin
    hq(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)   and (k >10 )
  then
   begin
    barns(1,3,1,3);  //xy-wing
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >11 )
  then
   begin
    barns(1,3,2,3);  //xyz-wing
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >5 )
  then
   begin
    nq(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count) and (k >12 )
  then
   begin
    barns(1,4,0,4);  //xyz-wing
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >15 )
  then
   begin
    sky(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >15 )
  then
   begin
    kyte(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count) and (k >16 )
  then
   begin
    er(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >16 )
  then
   begin
    swordfish(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >16 )
  then
   begin
    jellyfish(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)
  then
   begin
    smashi(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count)  and (k >16)
  then
   begin
    smashiswords(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;

if  (countpm2 = countpm)  and (count2 = count) and (k >16)
  then
   begin
    smashijelly(1);
     if active= true
      then
       begin
        sbrc;
       end;
   end;}
until  (countpm2=countpm) or (count = 81)

end;