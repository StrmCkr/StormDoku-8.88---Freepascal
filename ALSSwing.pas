{Swing expaned so the bivavle is an almost locked set} 
Procedure alsSwing(K:integer);
var
q,xn,xn5,j,j2,xn2,yn,yn2,yn3,yn4,yn5,yn6,n,n2,z,z2,x,r,r2,g,count,count2,alsa:integer;

A3:numberset;
z1:nums;

lx1: numberset;
lx2: numberset;
lx3: numberset;

lx4: numberset;
lx5: numberset;

begin
alsfinder;
  //ahsfinder;
if k=0 then begin  g:=0; setlength(techwrite,g+1,16); end;

for alsA:= low(als) to (high(als)) do {als A}
   if (als[alsA,1]+1 = als[alsA,2]) {cell = digit +1}
    then
			   begin

			    xn5:=als[alsa,0];
			   	yn5:=als[alsA,3];			
				yn4:= als[alsa,4];	

   for n in  (comboset[yn4] ) do
      for n2 in (comboset[yn4] - [n])  do
	  begin
	  lx1:=[0..80];

for x in (digitcell[n] * combosets[xn5,yn5]) do
lx1:=lx1 * peer[x];
lx2:=[0..80];

for x in (digitcell[n2] * combosets[xn5,yn5]) do
lx2:=lx2 * peer[x];

   for J in [0..26] do
          if (digitrcb[j,n] <> [])
           and ((digitcell[n]*combosets[xn5,yn5]) * digitrcb[j,n]=(digitcell[n]*combosets[xn5,yn5]))
            then

              for yn in peerrcb[j] do
               if  (digitrcb[yn,n] <> [])
                and not ((digitcell[n]*combosets[xn5,yn5])* digitrcb[yn,n]= (digitcell[n]*combosets[xn5,yn5]))
                and (digitrcb[yn,n] * digitrcb[j,n] <> [])
                and ( (Digitrcb[yn,n] * digitrcb[j,n])  = ( lx1 * digitrcb[yn,n] ) )
                 then

                  for z in peerrcb[yn] do
                   if  (digitrcb[z,n] <> [] )
                    and not ((digitcell[n]* combosets[xn5,yn5]) * digitrcb[z,n]= (digitcell[n]*combosets[xn5,yn5]))
                    and (digitrcb[z,n] * digitrcb[yn,n] <> [])
                    and ((digitrcb[z,n] * digitrcb[yn,n]) + (digitrcb[yn,n] * digitrcb[j,n] ) = digitrcb[yn,n])
                    then

         for J2 in ([0..26]) do
          if (digitrcb[j2,n2] <> [])
           and ((digitcell[n2]*combosets[xn5,yn5]) * digitrcb[j2,n2]=(digitcell[n2]*combosets[xn5,yn5]))
            then

              for yn2 in peerrcb[j2] - [yn] do
               if  (digitrcb[yn2,n2] <> [])
                and not ( (digitcell[n2] * combosets[xn5,yn5]) * digitrcb[yn2,n2]=(digitcell[n2] * combosets[xn5,yn5]))
                and (digitrcb[yn2,n2] * digitrcb[j2,n2] <> [])
                and ( (Digitrcb[yn2,n2] * digitrcb[j2,n2])  = ( lx2 * digitrcb[yn2,n2] ) )
                 then

                  for z2 in (peerrcb[z]  * peerrcb[yn2]) do
                   if  (digitrcb[z2,n2] <> [] )
                    and not ((digitcell[n2]*combosets[xn5,yn5]) * digitrcb[z2,n2]=(digitcell[n2]*combosets[xn5,yn5]))
                    and (digitrcb[z2,n2] * digitrcb[yn2,n2] <> [])
                    and ((digitrcb[z2,n2] * digitrcb[yn2,n2]) + (digitrcb[yn2,n2] * digitrcb[j2,n2] ) = digitrcb[yn2,n2])
                    then

                    if  ( (digitrcb[yn,n2] * digitrcb[z2,n2] ) = (digitrcb[yn,n2] * digitrcb[z2,n2]) )
                     and ( (digitrcb[yn2,n] * digitrcb[z,n] ) = (digitrcb[yn2,n] * digitrcb[z,n]) )
                     and (( digitrcb[yn,n] * digitrcb[z,n] ) * (digitrcb[yn2,n2] * digitrcb[z2,n2] ) = [])

                     then

         begin
          Count:=0;
          count2:=0;

          
           for q in (digitrcb[yn,n] * digitrcb[z,n]) do
              inc(count);

              for q in (digitrcb[yn2,n2] * digitrcb[z2,n2]) do               
                inc(count2);           

          if ((count in [1])  and ((digitrcb[yn,n2] * Digitrcb[z,n2]) * (digitrcb[yn,n] * Digitrcb[z,n]) <> []) )
          or ((count2 in [1])  and ((digitrcb[yn2,n] * Digitrcb[z2,n]) * (digitrcb[yn2,n2] * Digitrcb[z2,n2]) <> []))

          then
           begin

             active:=true;
			
			 if k = 0 then begin
			 techwrite[g,0]:=combosets[xn5,yn5];
			 techwrite[g,10]:= [n];
			 techwrite[g,11]:=[n2];
			 techwrite[g,12]:= digitrcb[yn,n] * digitrcb[z,n];			
			 techwrite[g,13]:= digitrcb[yn,n] - (digitrcb[yn,n] * digitrcb[z,n]);
			 techwrite[g,14]:= (digitrcb[yn2,n2] * digitrcb[z2,n2]);
			 techwrite[g,15]:= digitrcb[yn2,n2] - (digitrcb[yn2,n2] * digitrcb[z2,n2]);
			 end;

if  (count in [1])
and  ((digitrcb[yn,n2] * Digitrcb[z,n2]) * (digitrcb[yn,n] * Digitrcb[z,n]) <> [] )
 then 
            for q in ( digitrcb[yn,n] * digitrcb[z,n]) do 
             if  (peer[q] * (digitrcb[yn2,n2] * digitrcb[z2,n2])  =  (digitrcb[yn2,n2] * digitrcb[z2,n2]))
               then
			    begin
                covered2[n2]:= covered2[n2] +(digitrcb[yn,n] * Digitrcb[z,n]);
				if k = 0
				 then techwrite[g,n2]:=(digitrcb[yn,n] * Digitrcb[z,n]);
				 end;
             

if (count2 in [1])
 and ((digitrcb[yn2,n] * Digitrcb[z2,n]) * (digitrcb[yn2,n2] * Digitrcb[z2,n2]) <> [])
	then               
			  for q in ( digitrcb[yn2,n2] * digitrcb[z2,n2]) do 			   
               if (peer[q] * (digitrcb[yn,n] * digitrcb[z,n])  =  (digitrcb[yn,n] * digitrcb[z,n]))
               then
			    begin
                covered2[n]:= covered2[n] +(digitrcb[yn2,n2] * Digitrcb[z2,n2]);				
				if k = 0
				 then techwrite[g,n]:=(digitrcb[yn2,n2] * Digitrcb[z2,n2]);
				 end;

if (k = 0) and (techwrite[g,n] + techwrite[g,n2] <> [])
  then
  begin
  g:=g+1;
  setlength(techwrite,g+1,16);
  end;


          end;
         end;

		

		 end;
		 end;
		

if k= 0 then techdisplay(#4,g);

end;{alsswing}