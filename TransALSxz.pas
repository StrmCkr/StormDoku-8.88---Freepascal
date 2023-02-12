procedure transalsxz(k:integer);
var
q,xn,xn2,L,l2,J,j2,s,s2,s3,s4,f,f2,f3,f4,yn,yn2,yn3,yn4,n,z,x,ACT,ACT2,g,r,t,e,u,h:integer;

A:nums;
a2:numberset;
B:nums;
B2:numberset;
z1:nums;
lx1: rcbpeer;
p3:numberset;

begin

 for xn:= 0 to 26 do
    for L:= 1 to 8 do
      begin

       J:= l+1;



      for yn:= Slist[l] to flist[l] do
       begin
         A:=[];
         a2:=[];
         ACT:=0;
         lx1:=[];

         for n:= 0 to 8 do
          if (n in comboset2[yn] )
             and (Sectorrc[xn,n] <> [])
              then
               begin
               A:= a+ sectorRC[xn,n]; {#'s}
               INC(ACT);

               a2:=a2+ sectorrcb[xn,n]; {cell's}

               lx1:= lx1 + peerrcb[Rsec[Rx[secset[xn,n]]]] + peerrcb[Csec[Cy[secset[xn,n]]]] + peerrcb[Bsec[Bxy[secset[xn,n]]]];
               end;


if  (ACT = L)
 then
   for yn2:= Slist[j] to Flist[j] do
       if A = comboset[yn2]
         then
           begin

             for xn2 in ( lx1)   do

                for L2:= 1 to l do
      begin

       J2:= l2+1;


      for yn3:= Slist[l2] to flist[l2] do
      begin
         B:=[];
         B2:=[];
         act2:=0;

         for n:= 0 to 8 do
            if (n in comboset2[yn3])
              AND (sectorRC[xn2,n] <> [])
              then
               begin
               b:= b+ sectorRC[xn2,n];

               inc(act2);

               b2:=b2+ sectorrcb[xn2,n];
             end;

  if
  ( A2 - b2 <> [])
  and ( b2 - a2 <> [])

  and (act2 = l2)
   then
    for yn4:= Slist[j2] to Flist[j2] do
    if  (popcnt(dword((comboset2[yn4]*Comboset2[yn2]) ) )   >1 ) {checks that 2nd set of digits shares >=2 digits with first set}
       then
       if b = comboset[yn4]
         then
           begin
            z1:=[];

              for q in (peerrcb[xn] + peerrcb[xn2] )  do

                 for z in (comboset[yn4]*comboset[yn2]  ) do

                   if  ( ((digitrcb[xn,z] * a2) * (digitrcb[q,z])) - (a2*b2)  <> []  )
                   and  ( ((digitrcb[xn2,z] * b2) * digitrcb[q,z]) - (a2*b2) <> []  )
                   and   ( ( digitRCB[q,z] * (a2+b2 ) - (a2*b2)  ) = ( (DigitRCB[xn,z]*a2 ) + (Digitrcb[xn2,z]*b2) ) )
                   then
                      begin
                        z1:=z1+[z];

                      for R in ((comboset[yn4] * comboset[yn2])  - [z]) do
                       if (DigitRCB[xn,r] *A2 <> []  )
                       and (DigitRCB[xn2,r] * B2 <> [] )
                        then
                         begin
                         active:=true;


                         for x in [0..80] - (A2+B2)  do
                          if  (peer[x]  * ( ( DigitRCB[xn,r] + DigitRCB[xn2,r] ) * (A2+B2)) =  (( DigitRCB[xn,r] + DigitRCB[xn2,r] ) * (A2+B2)) )
                          and ( R in pm[x] )
                             then
                              begin
                              active:=true;
                              covered[x]:= covered[x] + [r];
                              end;

                               for t:= 0 to 26 do    {base sector}
                                  if (digitrcb[t,r] * ((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)) = [])
                                    then

                                   for E in peerrcb[t]  do
                                   if (digitrcb[e,r] * ((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)) <> [])
                                   then

                                    for u in (peerrcb[t]-[e]) do
                                      if( DigitRCB[t,r] * (DigitRcb[E,r] + DigitRCB[u,r]) = DigitRCB[t,r] )
                                      and (DigitRCB[t,r] <> [])
                                       then
                                        begin

                                          for g in ([0..80] - (a2+b2 + digitrcb[t,r] ) )  do
                                          if ( peer[g]  * ((digitrcb[t,r]*digitrcb[u,r]) +
                                          ( ((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)) - (digitrcb[e,r]*((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)))) )
                                          = ((digitrcb[t,r]*digitrcb[u,r]) + ( ((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)) - (digitrcb[e,r]*((digitrcb[xn,r]*a2)+(DigitRCB[xn2,r]*b2)))) )  )
                                           and (r in pm[g] )
                                            then
                                             begin
                                              active:=true;
                                             covered[g]:=covered[g] + [r];

                                             end;

                  // missing ring class for T-alsxz

                            end; { eliminations}

                         end;
                   end;   {mutiple q sectors for mutiple restircted commons}

          if popcnt(dword(z1)) >1      //doubly linked
          then
           begin

              for R in ((comboset[yn4] + comboset[yn2])  - z1) do
                       if (DigitRCB[xn,r] *A2 <> []  )
                       or (DigitRCB[xn2,r] * B2 <> [] )
                        then
                         begin
                         active:=true;

                         for x in [0..80] - (A2+B2)  do
                          begin

                          if  (peer[x]  * ( ( DigitRCB[xn,r] + DigitRCB[xn2,r] ) * (A2+B2)) =  (( DigitRCB[xn,r] + DigitRCB[xn2,r] ) * (A2+B2)) )
                            and ( R in pm[x] )
                             then
                              begin
                              covered[x]:= covered[x] + [r];
                              end;

                          if  (peer[x] *  ( DigitRCB[xn,r]  * A2) =  ( DigitRCB[xn,r]  * A2) )
                            and ( R in pm[x] )
                            and (DigitRCB[xn,r] * A2 <> [])
                             then
                              begin
                              active:=true;
                              covered[x]:= covered[x] + [r];
                              end;

                           if  (peer[x]  *  ( DigitRCB[xn2,r]  * b2) =  ( DigitRCB[xn2,r]  * B2) )
                            and ( R in pm[x] )
                            and (DigitRCB[xn2,r] * B2 <> [])
                             then
                              begin
                              active:=true;
                              covered[x]:= covered[x] + [r];
                              end;

                          end;
                           end;

             end; {dual link elimiantions}

           end; {yn4}
        end;{yn3}
       end;{xn2}

      end;    {yn2}
   end; {yn}
 end;  {xn}

end;{fin transport als -xz rule}