 procedure Adds(K,M,Q:integer);    { k is writting function M is starting size q is ending size}
type

hold = array of integer;
base = array of numberset;
base2 = array of integer;
hold2 = array of RCBpeer;

base3 =  array of array of numberset;
base4 =  array of  nums;

var
p,S,F,C,w,j,a,b,z,lx,x,g,l,n,act:integer;

z1:nums;
z2:base4;

p2,lx1:numberset;

p3: base3;

h: hold;
step: base;
loc: base2;
List: hold2;

begin

cellcombo; 

 If M = 0
  then
   L:= 2
  else
   L:= M;

repeat

  begin

  for C:= slist[l] to flist[l] do
   if (combocell[c]  <> []) then
    begin
     act:=0;

     for p in combocell[c]do begin
      inc(act);
      if act >=L then
       break;
       end;

   if act >= L then

for  p in combocell[c]  do
 if  (peer[p] * combocell[c]<> [])
    then

      begin

        w:=0; { step count}

        setlength(h,w+1);

        H[w]:=19;   {starting cell position}

        setlength(step,(w+1));   {set the array size to w}
        setlength(list,(W+1));    {sets the array size to w}

        setlength(p3,10,(w+1)); { digits cells}

        setlength(loc,(w+1));  {starting cell}
        setlength(z2,(w+1));  {starting cell}

       list[w]:=  [Rx[p]] + [(Cy[p]+9)]+ [(Bxy[P]+18)] ; {records active sectors}
       step[w]:=[p];  { keeps track of what cells are used at each step W }

        loc[w]:=p;
        z2[w]:=[];

        for n:= 1 to 9 do
          begin

            if n in pm[p]
             then
              p3[n,w]:= [p]
             else
              p3[n,w]:=[];

           if n in pm[p]
            then
             z2[w]:=z2[w]+[n];

          end;


           repeat

            for J:= h[w] downto 0 do
             begin
               if  not (peer2[loc[w],j] in step[w])
               and ( peer2[loc[w],j] in (combocell[c]))
               and (( peer[peer2[loc[w],j]] * (combocell[c]-step[w]) <> [])  or (w+2 = L))
                  then
                   begin

                   inc(w);  {increase step count}

                   setlength(h,w+1);   {increase lenght of step starting point array}

                   setlength(loc,(w+1));  {starting cell}

                   loc[w]:=peer2[loc[w-1],j];

                   setlength(list,(W+1));
                   list[w]:=list[w-1] + [Rx[peer2[loc[w-1],j]]] + [Cy[peer2[loc[w-1],j]]+9] + [BXY[peer2[loc[w-1],j]]+18];

                   H[w]:=19;

                   setlength(step,(w+1));   {set the array size to w}
                   step[w]:=step[w-1] + [peer2[loc[w-1],j]] ;  { keeps track of what cells are used at each step W }

        setlength(p3,10,(w+1)); { digits cells}
         setlength(z2,(w+1)); { digits cells}

         for n:= 1 to 9 do
          begin

            if n in pm[peer2[loc[w-1],j]]
             then
              p3[n,w]:= [peer2[loc[w-1],j]] + p3[n,w-1]
             else
              p3[n,w]:=p3[n,w-1]+p3[n,w];

              if n in pm[peer2[loc[w-1],j]]
               then
                z2[w]:=z2[w-1]+[n] + z2[w]
               else
                z2[w]:=z2[w-1] + z2[w];


          end;

                   end

                  else
                   dec(H[w]);

               if (W = (l-1))  and (comboset[c] = z2[w] )
                then
                 begin

                    lx1:=[];
                    z1:=[];

                     For N in comboset[c] do
                      for z in list[w] do
                       if  (DigitRCB[z,n] * p3[n,w] = p3[n,w] )
                        then
                          begin
                          lx1:=lx1 + [z];
                          z1:=z1+[n];
                          end;

              if ( L - popcnt(dword(z1)) = 1 )     and (z2[w] + z1 = comboset[c])
                  then
                       begin

                    for n in (comboset[c] -z1)  do
                      for z in ([0..80] - p3[n,w] ) do
                      if (peer[z] * p3[n,w] = p3[n,w] )
                        and ( n in pm[z] )
                        then
                         begin
                          active:=true;
                          covered2[n]:= covered2[n] + [z];


                          end;


                   end;

                 end;

               if (W = (L-1)) or (( W>0) and (H[w]= -1))    {back track sequence}
                 then
                 begin

                   repeat

                   Dec(w);  {decrese step count}
                   setlength(h,w+1);   {reduce lenght of step starting point array}
                   setlength(loc,(w+1));  {starting cell}
                   setlength(list,(w+1));
                   dec(h[w]);
                   setlength(step,(w+1));   {set the array size to w}
                   setlength(p3,10,(w+1));
                   setlength(z2,w+1);

                   until   (H[w]> -1) or (w=0)
                 end;

              end;

             until  (h[W] = -1)
       end;
     end;
    end;

 if m = 0
  then
  inc(L);

 until (L = m) or (L > q);    { change the 6 to a range of 2-9 to stop the cycles}

  end; {aDDS}