// combonaton & peer generations

{combination sets}
function next_combination (var v : array of integer; n, k : integer) : boolean;

var i, j : integer;

begin
   if (v[0] = (n - k)) or (k = 0) then
   begin
      next_combination := false;
      exit
   end;

   i := k - 1;

   while (i > 0) and (v[i] = n - k + i) do i := i - 1;

   v[i] := v[i] + 1;
   j := i;

    while (j < k - 1) do
       begin
         v[j+1] := v[j] + 1;
         inc(j);

       end;

   next_combination := true;

end;

procedure combo;
var
vx : array [0..8] of integer;
   n,l,m,count,xn : integer;
begin
count:=0;

For m:= 1 to 9 do
 begin

  for n := 0 to 8 do
   begin
     vx[n] := n;
   end;

  repeat
   begin

    for l:= 0 to (m-1)  do
     begin

      comboset[count]:=comboset[count] + [ (vx[l]+1) ];
      comboset2[count]:=comboset2[count] + [ (vx[l]) ];

      for xn:= 0 to 8 do
       begin
       combosetS[xn,count]:= combosetS[xn,count] + [Rset[xn,(vx[l])]];
       combosetS[xn+9,count]:= combosetS[xn+9,count] + [Cset[xn,(vx[l])]];
       combosetS[xn+18,count]:= combosetS[xn+18,count] + [Bset[xn,(vx[l])]];
       end;

     end;

     inc(count);

    end;
   until (next_combination (vx,9,m) = false);


  end;

end;

{compiles a list of cells each cell can visibly see}

procedure peers;
var
xa,xa2,z:integer;
number1:numberset;
number2:RCBpeer;

begin

for xa:= 0 to 80 do
  begin

     number1:=[];
     number2:=[];

     z:=0;

      For xa2:= 0 to 80 do
       IF (XA <> XA2)
        then
         if   ((Rx[xa])  in [  Rx[xa2] ] )
          or  ((Cy[xa])  in [  Cy[xa2] ] )
          or  ((Bxy[xa]) in [ Bxy[xa2] ] )
            then
             begin
              include(number1,xa2);

              peer2[xa,z]:=xa2;
              number2:=number2 + [Rx[xa2]]+[cY[XA2]+9]+[bXY[XA2]+18];

              inc(z);

             end;

       peer[xa]:=number1;

 end;

end;


procedure RCBpeers;
var
xa,xa2:integer;
number1,number2,number3:numberset;
number4,number5,number6:RcBpeer;

begin

for xa:= 0 to 8 do
  begin

     number1:=[];
     number2:=[];
     number3:=[];

     number4:=[];
     number5:=[];
     number6:=[];

      For xa2:= 0 to 80 do
         begin

            if Rx[xa2] = xa
               then
                begin
                include(number1,xa2);
                include(number4,cy[xa2]+9);
                include(number4,bxy[xa2]+18);
                end;

            if Cy[xa2] = xa
               then
                begin
                include(number2,xa2);
                include(number5,rx[xa2]);
                include(number5,bxy[xa2]+18);
                end;

            if bxy[xa2] = xa
               then
                begin
                include(number3,xa2);
                include(number6,cy[xa2]+9);
                include(number6,rx[xa2]);
                end;

         end;


         RCBnum[xa]:=number1;
         RCBnum[xa+9]:=number2;
         RCBnum[xa+18]:=number3;

         peerRCB[xa]:=number4;
         peerRCB[xa+9]:=number5;
         peerRCB[xa+18]:=number6;

       end;

end;

procedure lookupSectorRBC;
var
xn,n,r:integer;
a: numberset;
begin

for xn:= 0 to 26 do
for r:= 0 to 510 do
 begin
 a:=[];
  for n in comboset2[r] do
    begin
       if xn in [0..8]
        then
         a:=a+ [Rset[xn,n]];

       if xn in [9..17]
        then
         a:=a+ [Cset[xn-9,n]];

       if xn in [18..26]
        then
         a:=a+ [Bset[xn-18,n]];		
     end;
	SectorRCB[xn,r]:= A;
end;
end;

procedure setCellsec;
var
xn:integer;
begin

for xn:= 0 to 80 do
  cellsec[xn]:= [Rsec[Rx[xn]]] + [Csec[Cy[xn]]] + [Bsec[Bxy[xn]]];

end;

procedure sectoroverlap;{marks the overlaping "positions" within 2 sectors}
var
xn,yn,n,n2:integer;
begin

for xn:=0 to 26 do
  for yn:= 0 to 26 do
   secover[xn,yn]:=[];

for xn:=0 to 26 do
  for yn:= 0 to 26 do

	  for n:= 0 to 8 do
	   for n2:= 0 to 8 do
	
	   if secset[xn,n] = secset[yn,n2]
          then
		    begin

			secOver[xn,yn]:=secOver[xn,yn]+ [n,n2];
						
			end; 	

end; {marks the overlaping "positions" within 2 sectors}