procedure transalsxy(k:integer);
var
q,xn,xn2,xn3,L,l2,l3,J,j2,j3,s,s2,s3,s4,s5,s6,f,f2,f3,f4,f5,f6,yn,yn2,yn3,yn4,yn5,yn6,n,z,x,ACT,ACT2,act3,g,r,q2,z2,t,e,u:integer;

A:nums;
a2:numberset;
B:nums;
B2:numberset;
c:nums;
c2:numberset;
z1:nums;
lx1: rcbpeer;
lx2: rcbpeer;


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

               lx1:= lx1 + peerrcb[Rsec[Rx[secset[xn,n]]]] + peerrcb[Csec[Cy[secset[xn,n]]]] + peerrcb[bsec[bxy[secset[xn,n]]]];
               end;



if  (ACT = L)
 then
   for yn2:= Slist[j] to Flist[j] do
       if A = comboset[yn2]
         then
           begin

             for xn2 in (lx1)   do

                for L2:= 1 to l do
      begin

       J2:= l2+1;

      for yn3:= Slist[l2] to flist[l2] do
      begin
         B:=[];
         B2:=[];
         act2:=0;
          lx2:=[];

         for n:= 0 to 8 do
            if (n in comboset2[yn3])
              AND (sectorRC[xn2,n] <> [])
              then
               begin
               b:= b+ sectorRC[xn2,n];

               inc(act2);

               b2:=b2+ sectorrcb[xn2,n];

               lx2:=lx2+ peerrcb[Rsec[Rx[secset[xn2,n]]]] + peerrcb[Csec[Cy[secset[xn2,n]]]] + peerrcb[bsec[bxy[secset[xn2,n]]]];


             end;

  if
  ( A2 - b2 <> [])
  and ( b2 - a2 <> [])

  and (act2 = l2)
   then
    for yn4:= Slist[j2] to Flist[j2] do
    if (popcnt(dword((comboset2[yn4]*Comboset2[yn2]) ) )   >=1 ) {checks that 2nd set of digits shares >=2 digits with first set}
       then
       if b = comboset[yn4]
         then
           begin

              for q in (peerrcb[xn] + peerrcb[xn2] )  do

                 for z in (comboset[yn4]*comboset[yn2]  ) do

                   if  ( ((digitrcb[xn,z] * a2) * (digitrcb[q,z])) - (a2*b2)  <> []  )
                   and  ( ((digitrcb[xn2,z] * b2) * digitrcb[q,z]) - (a2*b2) <> []  )
                   and   ( ( digitRCB[q,z] * (a2+b2 ) - (a2*b2)  ) = ( (DigitRCB[xn,z]*a2 ) + (Digitrcb[xn2,z]*b2) ) )
                   then
                      begin

                    for xn3 in ( lx2)   do

                for L3:= 1 to 8 do
      begin

       J3:= l3+1;


      for yn5:= Slist[l3] to flist[l3] do
      begin
         C:=[];
         C2:=[];
         act3:=0;

         for n:= 0 to 8 do
            if (n in comboset2[yn5])
              AND (sectorRC[xn3,n] <> [])
              then
               begin
               C:= C+ sectorRC[xn3,n];

               inc(act3);

               C2:=C2+ sectorrcb[xn3,n];

             end;


      if  (( C2 -  b2 ) <> [])
        and (( C2 - A2 ) <> [] )

        and (act3 = l3)
   then
    for yn6:= Slist[j3] to Flist[j3] do
    if  (popcnt(dword((comboset2[yn6]*Comboset2[yn4]) ) )   >=1 ) {checks that 2nd set of digits shares >=2 digits with 2nd set}
	and (popcnt(dword((comboset2[yn6]*Comboset2[yn2]) ) )   >=1 ) {checks that 2nd set of digits shares >=2 digits with 1st set}
       then
       if c = comboset[yn6]
         then
           begin
                             for q2 in (peerrcb[xn2] + peerrcb[xn3])  do

                                 for z2 in (comboset[yn6]*comboset[yn4] - [z] ) do

                   if  ( ((digitrcb[xn3,z2] * C2) * (digitrcb[q2,z2])) - (C2*b2)  <> []  )
                   and  ( ((digitrcb[xn2,z2] * b2) * digitrcb[q2,z2]) - (C2*b2) <> []  )
                   and   ( ( digitRCB[q2,z2] * (C2+b2 ) - (C2*b2)  ) = ( (DigitRCB[xn3,z2]*C2 ) + (Digitrcb[xn2,z2]*b2) ) )
                   then
                      begin

                           for R in ((Comboset[yn2]*comboset[yn6]) -[z2,z] ) do
                             if (DigitRCB[xn,r] * A2 <> []  )
                            and (DigitRCB[xn3,r] * C2 <> [] )
                        then
                         begin
                         active:=true;

                         for x in [0..80] - (A2{+B2}+C2)  do
                          if  (peer[x]  * ( ( DigitRCB[xn,r] + DigitRCB[xn3,r] ) * (A2+C2)) =  (( DigitRCB[xn,r] + DigitRCB[xn3,r] ) * (A2+C2)) )
                          and ( R in pm[x] )
                             then
                              begin
                              active:=true;
                              covered[x]:= covered[x] + [r];
                              end;

							  for t:= 0 to 26 do    {base sector}
                                  if (digitrcb[t,r] * ((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)) = [])
                                    then

                                   for E in peerrcb[t]  do
                                   if (digitrcb[e,r] * ((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)) <> [])
                                   then

                                    for u in (peerrcb[t]-[e]) do
                                      if( DigitRCB[t,r] * (DigitRcb[E,r] + DigitRCB[u,r]) = DigitRCB[t,r] )
                                      and (DigitRCB[t,r] <> [])
                                       then
                                        begin

                                          for g in ([0..80] - (a2+b2+c2 + digitrcb[t,r] ) )  do
                                          if ( peer[g]  * ((digitrcb[t,r]*digitrcb[u,r]) +
                                          ( ((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)) - (digitrcb[e,r]*((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)))) )
                                          = ((digitrcb[t,r]*digitrcb[u,r]) + ( ((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)) - (digitrcb[e,r]*((digitrcb[xn,r]*a2)+(DigitRCB[xn3,r]*c2)))) )  )
                                           and (r in pm[g] )
                                            then
                                             begin
                                              active:=true;
                                             covered[g]:=covered[g] + [r];

                          {                     if g = 39 then
                           begin
                           writexy(2,60,'active:');
                           write(' L =', L,' J =,',j);
                           write(' L2 =', L2,' J2 =,',j2);
                           write(' L3 =', L3,' J3 =,',j3);
                           write(act,act2,act3);

                           writeln;

                           write(xn,' -> ',z,' @ ',Q,' -> ',xn2,' -> ',z2,' @ ',q2,' -> ',xn3);

                           writexy(2,62,'set A: ');
                           For x in a do write(x,' ');
                           write( '@: ');
                           For x in A2 do write(x,' ');

                           writexy(2,63,'set B: ');
                           For x in b do write(x,' ');
                           write( '@: ');
                           for x in B2  do write(x,' ');

                           writexy(2,64,'set c: ');
                           For x in c do write(x,' ');
                           write( '@: ');
                           for x in C2 do write(x,' ');
                           delay(50000);
                          end; }

                                             end;
											 
                                          end;


                         end;

                         end;   {q2 }

                         end; {yn6 }
                        end; {yn5}
                      end; {xn3}

                   end;   {mutiple q sectors for mutiple restircted commons}
                                    end; {yn4}
        end;{yn3}
       end;{xn2}

      end;    {yn2}
   end; {yn}
 end;  {xn}
 if k =0 then techdisplay(#97,u);

end;{als -xy rule}