procedure Transxychain(K:integer);  {also hits remote pairs}

type
hold = array of integer;
base = array of integer;
digit = array of integer;
act2 = array of numberset;

var
xn,w,p,p2,n,n2,t,e,u,g:integer;

a2:act2;
h:hold;

step: base;
z:digit;

begin


for xn:= 80 downto 0 do    {startin cell}
 if (nm[xn] = 2)
  then
     for n:= 1 to 9 do
       if  N in pm[xn]
         then

 begin

  w:=0;    {step count}

  setlength(z,(w+1));

  z[w]:=n;

  setlength(h,(w+1));  {set the array size to w}

  h[w]:=19;        {keeps track of what peer is being used for step W }

  setlength(step,(w+1));   {set the array size to w}

  step[w]:=xn;  { keeps track of what cells are used at each step W }

   setlength(a2,w+1);
   a2[w]:=[xn];

   repeat

    for p:= h[w] downto 0 do    {iteration of peers}

      if
      not (peer2[step[w],p] in a2[w] )
      and (nm[peer2[step[w],p]]=2)        { if grid digit is not used }
      and ( Z[w] in pm[peer2[step[w],p]] )
       then

         begin

           n2:=0;
           repeat
             n2:=n2+1;
           until ((n2 <> z[w]) and (N2 in pm[peer2[step[w],p]]));


          h[w]:=h[w]-1;    { advance the peer count for step w}

          inc(w);        {increase the step count}

          setlength(z,(w+1));
          z[w]:=n2;

          setlength(h,(w+1));
          setlength(step,(w+1));     {increse the array size  to w}
          setlength(a2,w+1);
          a2[w]:=a2[w-1]+ [peer2[step[w-1],p]];
          step[w]:=peer2[step[(w-1)],p];   {set the step cell active for the newly created step w}

          h[w]:=19;  {set the peer count for the new step w as 19}

          break;

        end


       else

         h[w]:=h[w]-1;  {if the above is fasle then advance the peer number}


    if ((h[w] < 0 ) and (w > 0))       {applies eliminations}
      and (z[w] in pm[xn] )  and (z[w] <> n)

         then
                 if (peer[xn]*peer[step[w]]) - a2[w] <> []
                  then
                   begin

                    active:=true;

                    covered2[z[w]]:= covered2[z[w]]  - ((peer[xn] * peer[step[w]]) - a2[w]);

                  for t:= 0 to 26 do    {base sector}
                                  if (digitrcb[t,z[w]] * ([xn]+[step[w]]) = [])
                                    then

                                   for E in peerrcb[t]  do
                                   if (digitrcb[e,z[w]] * ([xn]+[step[w]]) <> [])
                                   then

                                    for u in (peerrcb[t]-[e]) do
                                      if( DigitRCB[t,z[w]] * (DigitRcb[E,z[w]] + DigitRCB[u,z[w]]) = DigitRCB[t,z[w]] )
                                      and (DigitRCB[t,z[w]] <> [])
                                       then
                                        begin

                                          for g in ([0..80] - ([xn,step[w]] + digitrcb[t,z[w]] ) )  do
                                          if ( (peer[g]  *  ((digitrcb[t,z[w]]*digitrcb[u,z[w]])    +  ([xn]+[step[w]]) - (digitrcb[e,z[w]] *  ([xn]+[step[w]])) ))
                                          = ((digitrcb[t,z[w]] * digitrcb[u,z[w]])
                                          +  (([xn]+[step[w]]) - (digitrcb[e,z[w]]  *   ([xn]+[step[w]] )  ) ) ) )
                                           and (x in pm[g] )
                                            then
                                             begin
                                              active:=true;
                                             covered[g]:=covered[g] + [z[w]];
                                             end;

                                               if ((digitrcb[u,n]*([xn]+[step[w]])) + (digitrcb[e,n] * ([xn]+[step[w]])) = ([xn]+[step[w]]) )
                                              then
                                                begin

                                                   for p2:= w-1 downto 1 do
                                                      begin
                                                         active:=true;
                                                         covered2[z[p2]]:= covered2[z[p2]] +  ((peer[step[p2+1]] * peer[step[p2]] ) - a2[w])
                                                       end;


                                              end; {ring}


                                             end;	{fin eliminations}


                   end;

   if ((h[w] < 0 ) and (w > 0))
      and (z[w] in pm[xn])  and (z[w] <> n) and (step[w] in peer[xn] )
            then
             begin

                for p2:= w-1 downto 1 do
                  begin
                    active:=true;
                   covered2[z[p2]]:= covered2[z[p2]] +  ((peer[step[p2+1]] * peer[step[p2]] ) - a2[w])
                  end;

                {determins if the found chains is actually a loop
                elimination code  is  added  however
                  it is covered by succesive runs of the chain code as is:   }


             end;


    if ((h[w] < 0 )  and (w > 0 ))  {the following resets the step to the previous state}
     then
      begin

       w:=(w-1);

       setlength(z,(w+1));

       setlength(h,(w+1));

       setlength(step,(w+1));

       setlength(a2,w+1);

      end;

    until (w = 0) and (h[w] < 0)

 end;

end;  {trans xy-chain}