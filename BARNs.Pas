procedure Barns(K,M,Q,v:integer);     { k is writting function M is starting size v is ending size,q selectins inital cell size v is end size}
type

hold = array of integer;
base = array of numberset;
hold2 = array of RCBpeer;

var
p,S,F,C,w,j,a,b,z,lx,x,g,l,r,act:integer;

xs:nums;
z1:nums;

p2:numberset;

lx1:numberset;

h: hold;
step: base;
List: hold2;

begin

cellcombo;

 If M = 0
  then
   L:= 2
  else
  L:=M;

repeat


  begin

  for C:= slist[l] to flist[l] do

   if (combocell[c] <> [])
    then
     begin
      act:=0;

  for p in combocell[c]do
     begin
      inc(act);
      if act >=L then
       break;
       end;


  if act >=L then

   for p in combocell[c] do
    if (peer[p] * combocell[c] <> []  )
     and ( ( (q = 1) and (nm[p] = 2))
     or ((q = 2) and (nm[p] = 3))
     or ((q = 0) and (nm[p] <=L))    )

     then

      begin

        w:=0; { step count}

        setlength(h,w+1);

        H[w]:=19;   {starting cell position}

        setlength(step,(w+1));   {set the array size to w}
        setlength(list,(W+1));    {sets the array size to w}

       list[w]:=[Rx[p]] + [(Cy[p]+9)] + [(Bxy[P]+18)] ; {records active sectors}
       step[w]:=[p];  { keeps track of what cells are used at each step W }


           repeat

            for J:= h[w] downto 0 do
             begin
               if  not (peer2[p,j] in step[w])
               and ( peer2[p,j] in combocell[c])
               and  ( (peer[p] * (combocell[c] - step[w])  <> [] ) or (w+2 = l) )
                  then
                   begin

                   inc(w);  {increase step count}

                   setlength(h,w+1);   {increase lenght of step starting point array}

                   setlength(list,(W+1));
                   list[w]:=list[w-1] + [Rx[peer2[p,j]]] + [Cy[peer2[p,j]]+9] + [BXY[peer2[p,j]]+18];
                   H[w]:= j-1;

                   setlength(step,(w+1));   {set the array size to w}
                   step[w]:=step[w-1] + [ peer2[p,j] ] ;  { keeps track of what cells are used at each step W }

                   end

                  else
                   dec(H[w]);

               if W = (l-1)
                then
                 begin

                     for a in list[w] do
                      if (RCBnum[a]*step[w] <> [] )

                        then
                         begin
                         for B in list[w] do

                           if  ( RCBnum[B] * step[w] <> [])
                           and (( (RCBnum[b]  + RCBnum[a] ) * step[w]) = step[w])
                           and ( (RCBnum[a] - RCBnum[b]) * step[w] <> [] )
                           and ( (RCBnum[b] - RCBnum[a]) * step[w] <> [] )
                            then
                             begin

                               lx1:=[];
                               z1:=[];

                              for Z in comboset[c]  do
                              if  ( ( (digitrcb[a,z] * step[w] ) <> [])
                                 or ( (digitrcb[b,z] * step[w] ) <> [])      )
                                   then
                                     for  lx in ( LIST[W] ) do
                                      if
                                         ( ( (digitRCB[a,z] * digitRCB[lx,z] * step[w]) <> [])
                                         or
                                           ( (digitRCB[b,z] * digitRCB[lx,z] * step[w]) <> []) )

                                      and ( (( DigitRCB[b,z] + DigitRCB[a,z]) * digitrcb[lx,z] * step[w])   =  ( (digitrcb[a,z] + digitrcb[b,z]) * step[w] ) )
                                        then
                                          begin
                                           lx1:=lx1+[lx];
                                           z1:=z1+[z];
                                          end;

                                       if (L - (popcnt(dword(z1)) )  = 1  )
                                        then
                                        begin

                                          xs:=[];
                                          p2:=[];

                                         for x in (comboset[c]  - z1)  do
                                         if  ( (digitrcb[a,x] * step[w] ) <> [])
                                           and  ( (digitrcb[b,x] * step[w] ) <> [])
                                            then
                                             begin
                                             xs:=xs+[x];
                                             p2:= p2 + (( DigitRCB[a,x] + digitrcb[b,x] )*step[w]) ;
                                             end;

                                         if (p2  <> [] ) and (xs <> [])  and (z1 <> [])      {rule 1, peer cells visbile to all + candidates may be elimianted}
                                          then
                                          begin

                                        for g in (ocell - step[w] ) do
                                         if ( peer[g] * p2 = p2)
                                          and (pm[g] * xs <> [])
                                          then
                                           begin
                                             active:=true;
                                            covered[g]:=covered[g] + xs;
																						
                                           end;

                                           end;

                                           {rule 2
                                            when  any cell that contains a RCC and contains only  the + candidate and it directly sees all + candidtes; then
                                             all cells visible to all the RCC of that number may be excluded for that number. }

                                           if (p2 <> []) and (xs <> [])
                                           then
                                             for G in (p2) do
                                               for x in z1 do
                                                  if (pm[g]= xs + [x])
                                                   and( (peer[g] * p2 ) + [g] = p2  )
                                                   then
                                                    begin
                                                     for  r in ([0..80] - step[w] ) do
                                                      if (peer[r] * ((digitRcb[a,x] + digitrcb[b,x]) * (step[w] ) ) =  ((digitRcb[a,x] + digitrcb[b,x]) * (step[w] ) ))
                                                     and (x in pm[r]  )
                                                      then
                                                      begin
                                                       active:= true;
                                                       covered[r]:= covered[r] + [x];
                                                      end;

                                                    end;

                                       end;  {end count =1}


                       if (popcnt(dword(z1))  = L )  and (Z1  = comboset[c])
                             then
                                begin
                                    active:=true;

                                        for G in (z1*comboset[c]) do
                                           begin
                                           { write(G,'  @: '); }
                                            p2:=(digitrcb[a,g]+digitrcb[b,g])*step[w];

                                            for x in  (ocell - step[w]) do
                                               if (peer[x] * p2  = p2  )
                                              and  (g in pm[x] )
                                              then
                                               begin
                                                covered[x]:= covered[x] + [g];

                                               end;

                                              end;

                                  end; {count = 0 }
								  
                                 end; {b}
								
                              end;  {a}


                 end;

               if (W = (L-1)) or (( W>0) and (H[w]= -1))   {back track sequence}
                 then
                 begin

                   repeat
                   Dec(w);  {decrese step count}
                   setlength(h,w+1);   {reduce lenght of step starting point array}
                   setlength(list,(w+1));
                   dec(h[w]);
                   setlength(step,(w+1));   {set the array size to w}

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

 until (L = m) or (L > v);

end;
