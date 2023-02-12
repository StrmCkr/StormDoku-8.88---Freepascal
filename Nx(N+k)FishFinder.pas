{fish finder}
procedure fishfinder(R1,E1,t:integer);
type
 hold = array of integer;
 hold2 = array of integer;
 hold3 = array of integer;

 base2 = array of numberset;
 base3 = array of numberset;
 base4 = array of numberset;

 base5 = array of numberset;
 base6 = array of numberset;
 base7 = array of numberset;

 Rcover2 = array of numberset;
 Bcover2 = array of numberset;
 Ccover2 = array of numberset;

 Cover2 = array of numberset;

 used2 = array of rcbpeer;
 used3 = array of rcbpeer;

 peered = array of rcbpeer;

var
 a1,b1,a2,b2,z,n,w,w2,p,p2,q,q2,x,s,s2,f,f2,k,l,m,g,v,u,j,d:integer;
 output:text;
 E,R:integer; 

h:hold;
h2:hold2;
h3:hold3;

use:used2;
use2:used3;

use3:rcbpeer;
use4:rcbpeer;

Base: base2;

Bbase:base5;
Rbase:base6;
Cbase:base7;

basei: base3;
pbasei: base4;

Cover:cover2;
Rcover:rcover2;
Ccover:Ccover2;
Bcover:bcover2;

scover:numberset;
srcover:numberset;
sccover:numberset;
sbcover:numberset;

peers:peered;

sector:rcbpeer;
sector2: array [0..26] of rcbpeer;

begin

 setlength(h3,0);
 setlength(use,0);
 setlength(h,0);
 setlength(base,0);
 setlength(Bbase,0);
 setlength(Cbase,0);
 setlength(Rbase,0);

 setlength(basei,0);
 setlength(pbasei,0);
 setlength(peers,0);
 setlength(use2,0);
 setlength(h2,0);
 setlength(cover,0);
 setlength(Rcover,(0));
 setlength(Ccover,(0));
 setlength(Bcover,(0));


setlength(h,(8));      { stores the active sectors }
setlength(use,8);
setlength(base,8);
setlength(basei,8);
setlength(pbasei,8);
setlength(peers,8);

setlength(Bbase,8);
setlength(Cbase,8);
setlength(Rbase,8);

setlength(h3,27);
setlength(h2,10);
setlength(use2,10);
setlength(cover,10);    {cover area's}
setlength(Rcover,10);   {specific cover area's }
setlength(Ccover,10);
setlength(Bcover,10);

 if R1 = 0 then  
 begin 
writexy(2,28,'minimal Fish size to search?');
R:=ord(readkey)-48;
write(': ',R);
 end
   else R:=R1; 
  
 if E1 = 0 then  
 begin 
writexy(2,29,'Maximum Fish size to search?');
E:=ord(readkey)-48;
write(': ',E);
 end
   else E:=E1; 

if t=0 then begin  u:=0; setlength(techwrite,u+1,16); end;

for n:= 1 to 9 do    {digits 1 - 9}
 for z:= R to E  do  {sector size}
  begin

     sector:=[];

      for s:= 0 to 26 do
       sector2[s]:=[];

       F2:=0;
       A1:=0;
       b1:=0;

        for s:= 26 downto 0 do
         begin

          if (digitRCB[s,n] <> [])   {makes sure the sector actually has active cells}
          and (sec[s,n] < z+5)
          then
            begin

              for s2:= 26 downto 0 do
               if  (s2 in peerRCB[s])
               and (digitRCB[s2,n] <> [])
               and ((digitRCB[s2,n] * digitRCB[s,n]) <> [] )
                 then
                   begin
                     include(sector,s);
                     include(sector2[s],s2);
                   end;
            end;

          if (s in sector) and (sector2[s] <> [])
           then
            begin
             inc(f2);

             if s > a1 then
              A1:=s;

              B1:=s;


            end;
    end;


  if (f2 >= z )
   then
    for s:= a1 downto b1+(z-1) do
     if ( s in  (sector ) )
        and (f2 >=z-1)
        then
          begin { first base untit}

           w:=0;    {sector count}

           dec(f2);

           q:=f2;

           h[w]:= s;  {sets the inial base sector}

               repeat

                   for p:= h[w] downto b1 do     {iterate from starting base down to 0}

                     if
                        (DigitRCB[p,n] - base[w] <> []) {makes sure the newly selected base sector actually has active cells to add}
                        and (q >= (z-1-w))
                        and  ( p in ( (sector ) - use[w]))

                         then

                          begin {Activate nth unit used}

                             inc(w);   {increases sector count}

                             dec(q);

                             h[w]:= p-1;     {sets the next sector value}

                             use[w]:= use[w-1] + [p];                    {set the used values}
                             base[w]:= base[w-1] + digitRCB[p,n];        {sets the base value}
                             peers[w]:=peers[w-1] + sector2[p];

                             basei[w]:= basei[w-1] + (base[w-1] * digitrcb[p,n]);

                             if p in [0..8]
                              then
                               Rbase[w]:= Rbase[w-1] +digitRCB[p,n]
                              else
                                Rbase[w]:= Rbase[w-1];

                             if p in [9..17]
                              then
                               Cbase[w]:= Cbase[w-1] + digitRCB[p,n]
                              else
                                Cbase[w]:= Cbase[w-1];

                             if p in [18..26]
                              then
                               Bbase[w]:= Bbase[w-1] + digitRCB[p,n]
                              else
                               Bbase[w]:= Bbase[w-1];


                              if (base[w-1] * digitRCB[p,n])  <> []
                                then
                                  begin
                                   for x:= 0 to 80 do
                                    if peer[x] * basei[w] = basei[w]
                                     then
                                       include(pbasei[w],x);
                                  end
                                 else
                                   pbasei[w]:= pbasei[w-1];


                             break;  {exit from loop to iterate forward from the new H[w] value}

                          end {end finding nth unit}
                          else
                           begin
                           if w > 0
                             then
                                dec(h[w]);  { if we are in new starting sector and above logic is false advance the step couny}

                            if( w > 0) and (Q < (z-1-w))
                              then
                                h[w]:=-1;
                            end;



if( w = z)  and  ((Rbase[w] * Cbase[w] * Bbase[w] ) * Base[w] = [] )
 {smallest recursion function starting}

and ( ( basei[w] = [] )
  or  ( ( basei[w] <> [] ) and  ( ( pbasei[w] - base[w] ) <> [] ) ) )

then
 begin
 k:=0;

 repeat

  l:=0;


   if (w = z)
     then
        begin

       F:=0;
       A2:=0;
       B2:=0;
       m:=0;
       setlength(h3,0);
       setlength(h3,27);

          for x:=  26 downto 0 do
            if (x in (( peers[w]) - use[w])  )
                and (digitrcb[x,n] * base[w] <> [] )

               then
                begin

                 inc(f);

                 if  ( ((Rbase[w] * Cbase[w]) + (Rbase[w] * Bbase[w]) +(Bbase[w] * Cbase[w])) *  DigitRCB[x,n]  <> [] )
                  then
                    begin
                     inc(m);
                     h3[m]:=x;
                     end;

                 if (X > a2 )
                   then
                    a2:=x;

                    b2:=x;

                end;


      end;

   if (w = z) and (F >= (z+k)) and (m <= (n+k))  {find cover set}
       then


        for s2:= a2 downto (b2+(z+k-1)) do
          if (digitRCB[s2,n] * base[w]  <> [] )
          and (S2 in( ( peers[w] ) - use[w] ))
           and(f>=(z+k)-1)
           and (s2 >= h3[1] )
        then

          begin { first base unit }

           w2:=0;
           dec(f);

           h2[w2]:= s2;
           q2:=(f);

               repeat

                   for p2:= h2[w2] downto b2 do

                     if (digitRCB[p2,n] * (base[w] - cover[w2]) <> [])
                       and (p2 in ( ( peers[w])  - use[w] - use2[w2]  )  )
                        and (q2 >= ((z+k)-1-w2))
                        and (p2 >= h3[w2+1])
                         then

                          begin {Activate nth unit used}

                             inc(w2);
                             dec(q2);

                             h2[w2]:= p2-1;

                             use2[w2]:= use2[w2-1] + [p2];
                             cover[w2]:= cover[w2-1] + digitRCB[p2,n];

                             if p2 in [0..8]
                              then
                               Rcover[w2]:= Rcover[w2-1] +digitRCB[p2,n]
                              else
                                Rcover[w2]:= Rcover[w2-1];

                             if p2 in [9..17]
                              then
                               Ccover[w2]:= Ccover[w2-1] + digitRCB[p2,n]
                              else
                                Ccover[w2]:= Ccover[w2-1];

                             if p2 in [18..26]
                              then
                               Bcover[w2]:= Bcover[w2-1] + digitRCB[p2,n]
                              else
                               Bcover[w2]:= Bcover[w2-1];

                             break;

                          end {end finding nth unit}
                         else
                          begin

                           if w2 > 0
                             then
                                dec(h2[w2]);

                             if( w2 > 0) and (Q2 < ((z+k)-1-w2))
                              then
                                h2[w2]:=-1;

                           end;


                  if (w2 = z+k) and  (basei[w] = [])
                    and ( ( cover[w2] * base[w] ) = base[w] )    {checks that base cells out side the cover*base has no candidates}
                    and (  ( ( cover[w2] - base[w] <> [] ) and (w2 = z))

                     or     (   ( w2 <= z+1 )
                       and  ( (  ( ( Rcover[w2] * Ccover[w2] )  + ( Rcover[w2] * Bcover[w2] ) + ( Ccover[w2] * Bcover[w2] ) )  - base[w] ) <> [] ) )
					
                     or     (   ( w2 > z+1 )
                       and  ( ( ( Rcover[w2] * Ccover[w2] * Bcover[w2] ) - base[w] ) <> [] ) )

                    	)
                   then
                     begin

                       active:=true;

                       l:=1;
									
					   use3:=[];
					   scover:=[];
					   srcover:=[];
					   sccover:=[];
					   sbcover:=[];
					
					   {checks for overlaping cover sectors that can swap 1 for 1}
					   for j in use2[w2] do
					     for d in (peerRCB[j] - (use[w]+use2[w2])) do
						  if (base[w] * digitRCB[d,n] =  base[w] * digitrcb[j,n] )
						   and (base[w] * digitrcb[d,n] <> [])
						    then
							 begin
							 // writexy(2,60,'found ');							
							
							  use3:= use3 + [D];
							  Scover:=Scover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							 if d in [0..8]
							  then							
							  Srcover:=srcover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							  if d in [9..17]
							   then
							  Sccover:=sccover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							  if d in [18..26]
							  then
							  sbcover:=sbcover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							end;
			
                    if (w2 = z)
                        then
                         covered2[n]:= covered2[n] + ((cover[w2]+scover) - base[w]);

                    if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
                      then
                       covered2[n]:= covered2[n] +  (( (Rcover[w2] * Ccover[w2]) + (Rcover[w2] * Bcover[w2]) + ( Ccover[w2] * Bcover[w2]) ) - base[w]) ;
					
					  if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
                      then
                       covered2[n]:= covered2[n] +  (( ((Rcover[w2]+Srcover) * (Ccover[w2]+sccover)) + ((Rcover[w2]+srcover) * (Bcover[w2]+sbcover)) + ( (Ccover[w2]+sccover) * (Bcover[w2]+sbcover)) ) - base[w]) ;
					
                    if (w2 = z+2)  { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                      then
                         covered2[n]:=COvered2[n] + ((Rcover[w2] * Bcover[w2] * Ccover[w2])- base[w]);
						
					if (w2 = z+2)  { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                      then
                         covered2[n]:=COvered2[n] + (((Rcover[w2]+SRcover) * (Bcover[w2]+Sbcover) * (Ccover[w2]+Sccover))- base[w]);	
					
				
					

 if t = 0
	    then
		 begin
		 techwrite[u,0]:=[7];
		 techwrite[u,1]:=[2];		 
		 techwrite[u,2]:=[n];    // digit n 
		 techwrite[u,3]:= use[w] ;// base
		 techwrite[u,4]:= use2[w2]; //cover
		 techwrite[u,5]:= use3; // extra cover
		
		{if (w2 = z) and (use3 <> [])
         then
		techwrite[u,n]:=techwrite[u,n] + (scover	- base[w]);}
		
		if (w2 = z)
         then
		techwrite[u,n+5]:=techwrite[u,n+5] + ((cover[w2]+scover) - base[w]);
		
		if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
        then
		techwrite[u,n+5]:=techwrite[u,n+5] + (( (Rcover[w2] * Ccover[w2]) + (Rcover[w2] * Bcover[w2]) + ( Ccover[w2] * Bcover[w2]) ) - base[w]) ;
		
		if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
        then
		techwrite[u,n+5]:=techwrite[u,n+5] + (( ((Rcover[w2]+Srcover) * (Ccover[w2]+sccover)) + ((Rcover[w2]+srcover) * (Bcover[w2]+sbcover)) + ( (Ccover[w2]+sccover) * (Bcover[w2]+sbcover)) ) - base[w]) ;
					
		
		if (w2 = z+2)  { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                      then
		techwrite[u,n+5]:= techwrite[u,n+5] + ((Rcover[w2] * Bcover[w2] * Ccover[w2])- base[w]);
	
	   if (w2 = z+2)  { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                      then
                         techwrite[u,n+5]:= techwrite[u,n+5] + (((Rcover[w2]+SRcover) * (Bcover[w2]+Sbcover) * (Ccover[w2]+Sccover))- base[w]);	
	
	
		
	if techwrite[u,n+5]  <> []
		then
		 begin
		   u:= u+1;
		   setlength(techwrite,u+1,16);
		  end; 	
		
if u = 32767    {max array size error code safty exit}
 then
 begin
  if t = 0 then
     chaindisplay(#102,u);
	
	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,16)
	
 //exit;
end;		
				
		
		end;	
						 		


end;

                  if (w2 =z+k) and (basei[w] <> [])
                     and (  (cover[w2] * base[w])  = base[w])

                     and (  (  (pbasei[w] * ( cover[w2] - base[w]) <> [] ) and (w2 = z))

                     or     (   ( w2 <= z+1 )
                       and  ( ( pbasei[w] * ( (Rcover[w2] * Ccover[w2]) + (Rcover[w2] * Bcover[w2]) + ( Ccover[w2] * Bcover[w2] ) ) - base[w] ) <> [] ) )

                     or     (   (w2 > z+1)
                     and ( ( ( pbasei[w] * (Rcover[w2] * Ccover[w2] * Bcover[w2]) ) - base[w] ) <> []) )
                    )

                      then
                         begin
                          active:= true;
                          l:=1;
					   use3:=[];
					   scover:=[];
					   srcover:=[];
					   sccover:=[];
					   sbcover:=[];
					
					   {checks for overlaping cover sectors that can swap 1 for 1}
					   for j in use2[w2] do
					     for d in (peerRCB[j] - (use[w]+use2[w2])) do
						  if (base[w] * digitRCB[d,n] =  base[w] * digitrcb[j,n] )
						   and (base[w] * digitrcb[d,n] <> [])
						    then
							 begin
							 // writexy(2,60,'found ');							
							
							  use3:= use3 + [D];
							  Scover:=Scover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							 if d in [0..8]
							  then							
							  Srcover:=srcover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							  if d in [9..17]
							   then
							  Sccover:=sccover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							
							  if d in [18..26]
							  then
							  sbcover:=sbcover + (digitrcb[d,n] - (digitrcb[d,n]*digitrcb[j,n]));
							  							  			
							
							end;



                      if (w2=z)
                       then
                         covered2[n]:=covered2[n] +(  (pbasei[w] * cover[w2]* scover) - base[w]);

                      if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
                         then
                           covered2[n]:=covered2[n] +( (pbasei[w] * (((Rcover[w2]+srcover) * (Ccover[w2]+sccover)) + ((Rcover[w2]+srcover) * (Bcover[w2]+sbcover)) + ( (Ccover[w2]+sccover) * (Bcover[w2]+sbcover)))) - base[w]);

                      if (w2 = z+2)     { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                         then
                          covered2[n]:=covered2[n] +((pbasei[w] * ((Rcover[w2]+srcover)*(Bcover[w2]+sbcover)*(Ccover[w2]+sccover))) - base[w]);
						
					
						
		
 if t = 0
	    then
		 begin
		 techwrite[u,0]:=[7];
		 techwrite[u,1]:=[2];		 
		 techwrite[u,2]:=[n];    // digit n 
		 techwrite[u,3]:= use[w] ;// base
		 techwrite[u,4]:= use2[w2]; //cover
		 techwrite[u,5]:= use3; // extra cover
		
		if (w2 = z)
         then
		techwrite[u,n+5]:=techwrite[u,n+5] + (  (pbasei[w] * cover[w2]* scover) - base[w]);
		if  ((w2 = z+1) or ( w2 = z))  { 1 or 0 fin sectors - elimiantions in overlaps of cover sectors not in base }
                      then
		techwrite[u,n+5]:=techwrite[u,n+5] + ( (pbasei[w] * (((Rcover[w2]+srcover) * (Ccover[w2]+sccover)) + ((Rcover[w2]+srcover) * (Bcover[w2]+sbcover)) + ( (Ccover[w2]+sccover) * (Bcover[w2]+sbcover)))) - base[w]);

		if (w2 = z+2)  { 2 fin sector - elimiantions in overlaps of cover sectors not in base }
                      then
		techwrite[u,n+5]:= techwrite[u,n+5] + ((pbasei[w] * ((Rcover[w2]+srcover)*(Bcover[w2]+sbcover)*(Ccover[w2]+sccover))) - base[w]);
		
	if techwrite[u,n+5]  <> []
		then
		 begin
		   u:= u+1;
		   setlength(techwrite,u+1,16);
		  end;
		
if u = 32767    {max array size error code safty exit}
 then
 begin
  if t = 0 then
     chaindisplay(#102,u);
	
	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,16)
	
 //exit;
end;	
				
		
		end;	

end;





                 if   ( (h2[w2] < b2 ) and (w2 > 0 ) )      {if any of the follow conditioins are true, then backtrack to previous W2}
                   or    ( ( cover[w2] * base[w] )  = base[w])

                   or ( (w2 = z+1) and (basei[w] = []) and  ( ( ( Rcover[w2] * Bcover[w2] ) + ( Ccover[w2] * Bcover[w2]) + ( Ccover[w2] * Rcover[w2] ) - base[w] )=[] )  )
                   or ( (w2 = z+2) and (basei[w] = []) and  ( ( ( Rcover[w2] * Bcover[w2] * Ccover[w2] ) - base[w]) = [] )  )

                  or ( (w2 = z+1) and (basei[w] <> []) and  ( (pbasei[w]* ( ( Rcover[w2] * Bcover[w2] ) + ( Ccover[w2] * Bcover[w2]) + ( Ccover[w2] * Rcover[w2] )) - base[w] )=[] )  )
                  or ( (w2 = z+2) and (basei[w] <> []) and  ( ( ( pbasei[w] * ( Rcover[w2] * Bcover[w2] * Ccover[w2] )) - base[w]) = [] )  )

                   or (w2 = z+k)
                   or (( q2 < ((z+k)-1-w2)) and (w2 > 0 ))


                    then

                      repeat
                        begin
                         dec(w2);
                         inc(q2);

                         use2[w2+1]:=[];
                         Cover[w2+1]:=[];
                         rcover[w2+1]:=[];
                         Ccover[w2+1]:=[];
                         bcover[w2+1]:=[];

                         if w2 > 0
                           then
                             dec(h2[w2]);

                         end;

                      until ( (Q2) >= ((z+k) - 1 - w2)) or (w2 = 0)


               until  (w2 = 0)


         end;{starting cover untis}

 if L = 0
  then
   inc(k);

 until  (k>2) or (l=1); {smallest recursion function end}


 end;

              if ( ( h[w] < b1 ) and (w > 0 ))    {if any of the follow conditioins are true, then backtrack to previous W}
                   or (w = z)
                   or ( ( q < ( z-1-w) ) and (w > 0)  )
                   or (( basei[w] <> []) and (pbasei[w] = []))
                   or ((Rbase[w] * Cbase[w] * Bbase[w] ) * Base[w] <> [] )
                     then
                      repeat
                      begin

                         dec(w);
                         inc(q);

                         base[w+1]:=[];

                         Rbase[w+1]:=[];
                         Cbase[w+1]:=[];
                         Bbase[w+1]:=[];

                         basei[w+1]:=[];
                         pbasei[w+1]:=[];
                         use[w+1]:=[];
                         peers[w+1]:=[];


                         if w > 0
                           then
                             dec(h[w]);
                      end;
                     until ( q >=  (z - 1 - w)) or (w = 0)

               until  (w = 0)

      end;{starting base untis}


 end;
 

 if t = 0 then chaindisplay(#102,u);
 
  if R1 = 0 then   
writexy(2,28,'                                   ');
   
 if E1 = 0 then  
 writexy(2,29,'                                   ');
 

end; {fish finder}