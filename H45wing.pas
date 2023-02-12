{hybrid wing types: 4 & 5} 
procedure h45wing(w:integer);
  var
xn,xn2,n,n2,yn,yn2,yn3,g,count,count2,F,s,k:integer;
l:nums;
begin

if w = 0 then begin k:=0; setlength(techwrite,k+1,17); end;
for xn in ocell do
 if (nm[xn] = 2)
  then
   for xn2  in (ocell -[xn] )do
     if (nm[xn2] = 2 )
      and (pm[xn2] * pm[xn] <> [] )   and (pm[xn2] - pm[xn] <> [] )
       then

         for n in pm[xn]*pm[xn2] do
          for n2 in (pm[xn2] - [n]) do

            for yn in ((peerrcb[rsec[rx[xn]]] + peerrcb[Csec[Cy[xn]]]+ peerrcb[Bsec[Bxy[xn]]]) - ([rsec[rx[xn2]]] + [Csec[Cy[xn2]]]+ [Bsec[Bxy[xn2]]])  )  do
             if (Digitrcb[yn,n] * [xn]   = [xn] )
             and (Digitrcb[yn,n] * [xn2] = [])
              then

             for yn2 in ((peerrcb[rsec[rx[xn2]]] + peerrcb[Csec[Cy[xn2]]]+ peerrcb[Bsec[Bxy[xn2]]]) - ([rsec[rx[xn]]] + [Csec[Cy[xn]]]+ [Bsec[Bxy[xn]]])) do
                if (Digitrcb[yn2,n2] * [xn2]   = [xn2]  )
                 and (digitrcb[yn2,n2] *[xn] = [])
                  then

              for yn3 in (peerrcb[yn] * peerrcb[yn2])  do
              begin

               {h 4 wing}
              if ((digitrcb[yn,n] * Digitrcb[yn3,n]) + [xn] = Digitrcb[yn,n])
              and ((digitrcb[yn2,n2] * Digitrcb[yn3,n2]) + [xn2] = Digitrcb[yn2,n2])
              and  (digitrcb[yn3,n2] * digitrcb[yn2,n2] <> [])
               and (digitrcb[yn3,n] * digitrcb[yn,n] <> [])
               and ((digitrcb[yn3,n] * Digitrcb[yn2,n] ) *(digitrcb[yn3,n2] * digitrcb[yn2,n2]  )<> [])

               then
                begin

                  count:=0;
                  count2:=0;
                  l:=[];

                  For g in ((digitrcb[yn,n] * digitrcb[yn3,n]) + (Digitrcb[yn2,n2] * Digitrcb[yn3,n2]) - [xn,xn2]) do
                   begin

                   inc(count);
                   L:= l + pm[g];
                   end;

                   for g in l do
                    inc(count2);

                        if (count = (count2 - 1) )  and (xn in peer[xn2]) {h4 wing}
                         then
                        for g:= slist[count] to flist[count] do
                         if (L - [n2] = comboset[g])
						  and (comboset[g] * pm[xn] -[n]  = [])
                          then
                            begin
                               active:=true;
                               covered2[n]:=covered2[n] + (Digitrcb[yn3,n]  - (Digitrcb[yn,n] + digitrcb[yn2,n2]));

                       if w = 0
                             then
                              begin
                               techwrite[k,0]:=[xn];
                               techwrite[k,10]:=[xn2];
                               techwrite[k,11]:=[n];
                               techwrite[k,12]:=[n2];
                               techwrite[k,13]:=pm[xn] -[n];
                               techwrite[k,14]:=(digitrcb[yn,n] * Digitrcb[yn3,n]);
                               techwrite[k,15]:= (digitrcb[yn2,n2] * Digitrcb[yn3,n2]);
                               techwrite[k,16]:= comboset[g];
                               techwrite[k,n]:= techwrite[k,n]+ (Digitrcb[yn3,n]  - (Digitrcb[yn,n] + digitrcb[yn2,n2]));

                               end;
                              end;

                   if (w=0 ) and (techwrite[k,1] + techwrite[k,2] + techwrite[k,3] + techwrite[k,4] + techwrite[k,5] + techwrite[k,6] + techwrite[k,7] + techwrite[k,8] + techwrite[k,9]  <> [] )
                   then
                      begin
                       k:=k+1;
                       setlength(techwrite,k+1,17);

                      end;

               end; {h4 wing}

           {h5 wing}
            if ((peer[xn] * digitrcb[yn2,n2]) + [xn2] = digitrcb[yn2,n2])
            and (( peer[xn2] * digitrcb[yn,n]) + [xn] = digitrcb[yn,n])
            and ((digitrcb[yn3,n] * digitrcb[yn,n]) + (digitrcb[yn3,n2] * digitrcb[yn2,n2])  = [xn] + (peer[xn] * digitrcb[yn2,n2] )  )
             then
              begin

                 count:=0;
                 count2:=0;

                 L:=[];

                 for g in ((digitrcb[yn3,n] * digitrcb[yn,n] ) + (digitrcb[yn3,n2] * digitrcb[yn2,n2]))   do
                  begin
                   L:= L + pm[g];
                   inc(count);
                  end;

                  for G in l do
                   inc(count2);


                 if (count = (count2 - 1) )
                         then
                        for g:= slist[count] to Flist[count] do
                         if L - [n2] = comboset[g]
                          then
                            begin
                               active:=true;
                               covered2[n]:=covered2[n] + (Digitrcb[yn3,n]  - (Digitrcb[yn,n] + digitrcb[yn2,n2]));

                        if w = 0
                             then
                              begin
                               techwrite[k,0]:=[xn];
                               techwrite[k,10]:=[xn2];
                               techwrite[k,11]:=[n];
                               techwrite[k,12]:=[n2];
                               techwrite[k,13]:=pm[xn] -[n];
                               techwrite[k,14]:=(digitrcb[yn,n] * Digitrcb[yn3,n]);
                               techwrite[k,15]:= (digitrcb[yn2,n2] * Digitrcb[yn3,n2]);
                               techwrite[k,16]:= comboset[g];
                               techwrite[k,n]:= techwrite[k,n]+ (Digitrcb[yn3,n]  - (Digitrcb[yn,n] + digitrcb[yn2,n2]));

                               end;

                            end;

                 if (w=0 ) and (techwrite[k,1] + techwrite[k,2] + techwrite[k,3] + techwrite[k,4] + techwrite[k,5] + techwrite[k,6] + techwrite[k,7] + techwrite[k,8] + techwrite[k,9]  <> [] )
                   then
                      begin
                       k:=k+1;
                       setlength(techwrite,k+1,17);

                      end;

               end; {h5 wing}

          end; {yn3}

if w = 0 then techdisplay(#14,k);

end;{h45 wing}