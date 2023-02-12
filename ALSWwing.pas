{w -wing technique expanded from bivavle cells into als sets} 

procedure alswwing(k:integer);
var
q,xn,xn2,yn,yn2,yn3,yn4,yn5,yn6,n,n2,z,x,r,r2,u,alsa,alsb:integer;

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
if k=0 then begin  u:=0; setlength(techwrite,u+1,21); end;

 for alsA:= low(als) to (high(als)-1) do {als A}
   if (als[alsA,1]+1 = als[alsA,2]) {cell = digit +1}
     then
       for ALSB:= alsa+1 to high(als) do {Als B}
          if (als[alsb,1]+1 = als[alsb,2] ) {cell = digit +1}
           	and (popcnt(dword((comboset2[als[alsa,4]]*Comboset2[als[alsb,4]]) ) )   >1 )   {set a & B must share 2 digits}
               and (combosets[als[alsa,0],als[alsa,3]]  - combosets[als[alsb,0],als[alsb,3]] <> [] )  { sectors can over lap, however cells cannot overlap in full}
	         and (combosets[als[alsb,0],als[alsb,3]] - combosets[als[alsa,0],als[alsa,3]] <> [] ) { sectors can over lap, however cells cannot overlap in full}
			 then
			   begin

			    xn:=als[alsa,0];
			    xn2:=als[alsb,0];

				yn:=als[alsA,3];
				yn3:=als[alsB,3];
				
				yn2:=als[alsa,4];
				yn4:= als[alsb,4];

			
for N in (comboset[yn4] * comboset[yn2]) do
		     if  (digitcell[n] *( combosets[xn,yn] * combosets[xn2,yn3]) = []){sectors cannot have overlapping shared linked digit}
			    then
                  begin

lx1:=[0..80];
lx2:=[0..80];

for x in (digitcell[n] * combosets[xn,yn]) do
lx1:=lx1 * peer[x];

for x in (digitcell[n] * combosets[xn2,yn3]) do
lx2:=lx2 * peer[x];

for yn5 in  [0..26]  do
    if (Digitrcb[yn5,n] <> [] )  and (Sec[yn5,n] < 7)
                and ( (digitrcb[yn5,n] * lx1) + (digitrcb[yn5,n] * lx2 )  = digitrcb[yn5,n] )
               // and (lx1 * lx2 <> []) { not as simple as a 1 direction elimination}
                and (digitrcb[yn5,n] * (digitcell[n] * (combosets[xn,yn] + combosets[xn2,yn3])) = [] ) { active N sets cannot overlap the strong link}
				and (lx2 * digitrcb[yn5,n] <> []) {peers cant be blank}
				and ( lx1 * digitrcb[yn5,n] <> []) {peers cant be blank}
			
                 then
                  begin
if k=0 then
begin
techwrite[u,0]:= comboset[yn2];
techwrite[u,10]:= comboset[yn4];
techwrite[u,11]:= (combosets[xn,yn] ) ;
techwrite[u,12]:=(combosets[xn2,yn3] );
techwrite[u,13]:=digitrcb[yn5,n] * lx1;
techwrite[u,14]:=  digitrcb[yn5,n] * lx2;
techwrite[u,15]:= [n];
techwrite[u,16]:=[];
techwrite[u,17]:=[0];
end;

					   for R in ((comboset[yn4] * comboset[yn2]) - [n]) do
					     begin
						   lx3:=[0..80];

						   for x in digitcell[r] * (combosets[xn2,yn3] + combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

                         if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R] *lx3);

if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

							   end;
						 end;

						 {self contained Ring - mimics als-doubly linked}
						 // - restricted common to A & B that is not N and not in the overlap of sets a & B
					for R2 in ((comboset[yn4] * comboset[yn2]) - [n]) do
					 if  (digitcell[r2] * combosets[xn,yn] * combosets[xn2,yn3] = [] )  {overlaping cells must not contain r}
					  then
					     begin
						   lx3:=[0..80];

						   for x in digitcell[r2] * (combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

							   if (lx3 * digitcell[r2]*combosets[xn2,yn3] = digitcell[r2]*combosets[xn2,yn3] )
							   and (lx3 <> [])
							      then
								  begin

if k=0 then
begin
techwrite[u,16]:=techwrite[u,16] +[x];
end;

 for R in comboset[yn2] + comboset[yn4] do
													 for q in ([0..80] * digitcell[R]) do
													  begin {R/Q elimiantion search}

													  if (R in (comboset[yn2] * Comboset[yn4]) ){search for common digit to both, and active in both}
													  and ((digitcell[R] * combosets[xn,yn])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn2,yn3])  <> [])
													  and (Peer[q] * ((Combosets[xn,yn]+Combosets[xn2,yn3])*digitcell[R]) = ((Combosets[xn,yn] + Combosets[xn2,yn3])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * (Combosets[xn,yn] + combosets[xn2,yn3]) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];
 if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *[q]);
end;

														  end;

														  {cells in set A for digits exclusivly to A  their peers cannot contain r}
														if (R in (Comboset[yn2] - Comboset[yn4]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn,yn] = combosets[xn,yn] * Digitcell[R])
														and ([q] * combosets[xn,yn] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *[q]);
end;
														   end;

														   {cells in set B for digits exclusivly to B  their peers cannot contain r}
														if (R in (Comboset[yn4]  -  Comboset[yn2]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn2,yn3] = combosets[xn2,yn3]* Digitcell[R])
														and ([q] * combosets[xn2,yn3] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *[q]);
end;
														   end;


													  end; {R/Q elimiantion search}

								   		end;
								   end; {self contained doubly linked als-xz thanks to y5 link}



For n2 in (comboset[yn4]*comboset[yn2])- [n] do
  begin

lx4:=[0..80];
lx5:=[0..80];

for x in (digitcell[n2] * combosets[xn,yn]) do
lx4:=lx4 * peer[x];

for x in (digitcell[n2] * combosets[xn2,yn3]) do
lx5:=lx5 * peer[x];


{rings}
for yn6 in  [0..26]   do
    if (Digitrcb[yn6,n2] <> [] )  and (Sec[yn6,n2] < 7)
                and ( (digitrcb[yn6,n2] * lx4) + (digitrcb[yn6,n2] * lx5 )  = digitrcb[yn6,n2] )
               // and (lx1 * lx2 <> []) { not as simple as a 1 direction elimination}
                and (digitrcb[yn6,n2] * (digitcell[n2] * (combosets[xn,yn] + combosets[xn2,yn3])) = [] ) { active N sets cannot overlap the strong link}
                and (lx4 * digitrcb[yn6,n2] <> []) {peers cant be blank}
				and ( lx5 * digitrcb[yn6,n2] <> []) {peers cant be blank}
		
				
				 then
                  begin
                            {regular eliminations}
					   for R in ((comboset[yn4] * comboset[yn2]) - [n2]) do
					     begin
						   lx3:=[0..80];

						   for x in digitcell[r] * (combosets[xn2,yn3] + combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

						   if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

                                              end;{regular eliminations}
                                             end;

							      {regular eliminations}
					   for R in ((comboset[yn4] * comboset[yn2]) - [n]) do
					     begin
						   lx3:=[0..80];

						   for x in digitcell[r] * (combosets[xn2,yn3] + combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

						   if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;
                                              end;{regular eliminations}
                                             end;

				{all digits common to a & b are locked to a & b remove peers }
				 for R in ((comboset[yn4] * comboset[yn2]) ) do
					     begin
						   lx3:=[0..80] - ((digitrcb[yn6,n2]+ digitrcb[yn5,n]) + (combosets[xn2,yn3] + combosets[xn,yn]) );

						   for x in digitcell[r] * (combosets[xn2,yn3] + combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

						   if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
 if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

                                              end;{peers of set a & B common digits eliminations}
                                             end;

					{B non n,n2 digits are locked to set b }
                         for R in (comboset[yn4] -[n,n2] ) do
                            begin
							lx3:=[0..80] - (combosets[xn,yn] + combosets[xn2,yn3]);
							for x in digitcell[r] * (combosets[xn2,yn3]) do
						    lx3:=lx3 * peer[x];

						if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;


                                              end;
                                             end;

						{A non n,n2 digits are locked to set A }
                         for R in (comboset[yn2] -[n,n2] ) do
                            begin
							lx3:=[0..80] - (combosets[xn,yn] + combosets[xn2,yn3]);
						for x in digitcell[r] * (combosets[xn,yn]) do
						    lx3:=lx3 * peer[x];

						if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
 if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

                                              end;
                                             end;


                          {eliminates n2 from b + part y6  sector  in cells that are peers }
						  For R in [n2] do
						    begin
							   lx3:= [0..80] - (combosets[xn,yn] + combosets[xn2,yn3] + (digitrcb[yn6,n2]));
							   for x in digitcell[r] * (combosets[xn2,yn3] + (lx5 * digitrcb[yn6,n2])) do
						         lx3:=lx3 * peer[x];
					      if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] +(digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

							   end;
							   end;

						 {eliminates n2 from A + part of y6 sector cells that are peers }
					  For R in [n2] do
						    begin
							   lx3:= [0..80] - (combosets[xn,yn] + combosets[xn2,yn3] + (digitrcb[yn6,n2]));
							   for x in digitcell[r] * (combosets[xn,yn] + (lx4 * digitrcb[yn6,n2])) do
						         lx3:=lx3 * peer[x];
					      if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

							   end;
							   end;
		                          {eliminates n from b + part y5  sector  in cells that are peers }
						  For R in [n] do
						    begin
							   lx3:= [0..80] - (combosets[xn,yn] + combosets[xn2,yn3] + (digitrcb[yn5,n]));
							   for x in digitcell[r] * (combosets[xn2,yn3] + (lx2 * digitrcb[yn5,n])) do
						         lx3:=lx3 * peer[x];
					      if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] + (digitcell[R]*lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

							   end;
							   end;

						 {eliminates n from A + part of y5 sector cells that are peers }
					  For R in [n] do
						    begin
							   lx3:= [0..80] - (combosets[xn,yn] + combosets[xn2,yn3] + (digitrcb[yn5,n]));
							   for x in digitcell[r] * (combosets[xn,yn] + (lx1 * digitrcb[yn5,n])) do
						         lx3:=lx3 * peer[x];
					      if (digitcell[R] * lx3 <> []) and (lx3 <> [0..80])
						     then
							  begin
							   active:=true;
							   covered2[r]:=covered2[r] +(digitcell[R]* lx3);
if k=0 then
begin
techwrite[u,r]:=techwrite[u,r] +(digitcell[R] *lx3);
end;

							   end;
							   end;
if k=0 then
begin
techwrite[u,0]:= comboset[yn2];
techwrite[u,10]:= comboset[yn4];
techwrite[u,11]:= (combosets[xn,yn] ) ;
techwrite[u,12]:=(combosets[xn2,yn3] );
techwrite[u,13]:=digitrcb[yn5,n] * lx1;
techwrite[u,14]:=  digitrcb[yn5,n] * lx2;
techwrite[u,15]:= [n];
techwrite[u,19]:= [n2];
techwrite[u,17]:=[0,1];
techwrite[u,18]:=digitrcb[yn6,n2] * lx4;
techwrite[u,20]:=digitrcb[yn6,n2] * lx5;
end;


if (k = 0)  and  ((techwrite[u,1] <> []) or (techwrite[u,2] <> []) or (techwrite[u,3] <> [])or (techwrite[u,4] <> [])or (techwrite[u,5] <> [])or (techwrite[u,6] <> [])or (techwrite[u,7] <> [])or (techwrite[u,8] <> [])or (techwrite[u,9] <> []))
					  then
					   begin
					   u:=u+1;
					   setlength(techwrite,u+1,21);
					   end;
				
                        end; {yn6}	
				
	
                      end; {n2 restictions check}
					
if (k = 0)  and  ((techwrite[u,1] <> []) or (techwrite[u,2] <> []) or (techwrite[u,3] <> [])or (techwrite[u,4] <> [])or (techwrite[u,5] <> [])or (techwrite[u,6] <> [])or (techwrite[u,7] <> [])or (techwrite[u,8] <> [])or (techwrite[u,9] <> []))
					  then
					   begin
					   u:=u+1;
					   setlength(techwrite,u+1,21);
					   end;

                   end;


              end; {y5 N directional search};

            end; { completed a & b set search}


 if k = 0 then techdisplay(#23,u);

end; {als-w-wing}