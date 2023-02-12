{All most locket set  version of for the M - wing changing the bivavles to als sets} 
procedure alsMwing(k:integer);
var
q,xn,xn5,xn2,yn,yn2,yn3,yn4,yn5,yn6,n,n2,z,x,r,r2,g,alsa:integer;

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
	
for xn2 in ComboSubset[yn4] do
	
if (popcnt(dword(((comboset[yn4]*pm[xn2])))) >1) and (peer[xn2] * combosets[xn5,yn5] = [])
    then
	
for n  in (comboset[yn4]*pm[xn2]) do
 begin
lx1:=[0..80];

for x in (digitcell[n] * combosets[xn5,yn5]) do
lx1:=lx1 * peer[x];

for yn in [0..26] do
 if (lx1 * digitrcb[yn,n] <> [] )
  and (lx1 * digitrcb[yn,n] <> Digitrcb[yn,n] )
   then

                   {row,box,col}
                   if (digitrcb[yn,n] <> [] ) and (sec[yn,n] <5)
                   and(digitrcb[yn,n] * ( (lx1*digitrcb[yn,n]) + [xn2] )  = digitrcb[yn,n] )
                    then
                      begin

                       for  n2 in ((comboset[yn4]*pm[xn2]) - [n]) do
                              begin

lx2:=[0..80];
for x in (digitcell[n2] * combosets[xn5,yn5]) do
lx2:=lx2 * peer[x];

                              {row}
                               for yn2 in ((peerRCB[Rsec[rx[xn2]]] + peerrcb[Csec[Cy[xn2]]] + peerrcb[bsec[bxy[xn2]]]) ) do
                                begin
                                 if  (digitrcb[yn2,n2] <> [] ) and (sec[yn2,n2] <6)
                                 and ((digitrcb[yn2,n2] * peer[xn2]) + [xn2] = digitrcb[yn2,n2] )

                                  then
                                    begin
                                     active:=true;

                                    for z:= 0 to 80 do
                                     if (peer[z] *  ((digitcell[n2]*combosets[xn5,yn5]) + ( digitrcb[yn2,n2] - [xn2]) )
									 = ((digitcell[n2]*combosets[xn5,yn5]) +( digitrcb[yn2,n2] - [xn2]) ) ) and (z in digitcell[n2])
                                      then
                                         begin
									
                                       covered2[n2]:=covered2[n2] + [z];

                                          if k = 0 then
                                            techwrite[g,n2]:=techwrite[g,n2] + [z];
                                              end;

				            if ((digitrcb[yn2,n2] * lx2)  =  (digitrcb[yn2,n2] -[xn2]) )   {ring code}
                                             then						
											 begin
											
                                                for z:= 0 to 80 do	
												 begin
												
												 if (peer[z] * ([xn2] + (digitrcb[yn,n]  -(digitcell[n]*combosets[xn5,yn5])) )= ([xn2] + (digitrcb[yn,n] - (digitcell[n]*combosets[xn5,yn5])) )) and (z in digitcell[n])
                                                    then
                                                      begin
                                                       covered2[n]:=covered2[n] + [z];
									                      if k = 0 then
									                        techwrite[g,n]:=techwrite[g,n] + [z];
                                					   end;
													
												For R in (comboset[yn4] -[n,n2]) do
													if (peer[z] * (Digitcell[R]*Combosets[xn5,yn5]) = digitcell[r]*Combosets[xn5,yn5])
													   and (R in pm[z])													
													    then
														 begin
														 covered2[r]:=covered2[r] + [z];
														
														 if k = 0 then
									                        techwrite[g,r]:=techwrite[g,r] + [z];
														 end; 	
													
												 end; 	   													 												
													   													
                                                      covered[xn2]:= covered[xn2] + (pm[xn2] - [n,n2] );   {xn2 becomes a locked pair}

                                                        if k= 0
                                                         then
                                                           for z in (pm[xn2] - [n,n2])  do
                                                           techwrite[g,z]:=techwrite[g,z]+[xn2];
														    													
                                                      end; {rings}


  end;
if k =0
 then
begin
techwrite[g,0]:= [n];
techwrite[g,10]:= [n2];
techwrite[g,11]:=combosets[xn5,yn5];
techwrite[g,12]:=[xn2];
techwrite[g,13]:= (digitrcb[yn,n] * lx1);
techwrite[g,14]:= (digitrcb[yn2,n2] * peer[xn2]);
end;									
	 if (k =0) and ( (techwrite[g,n2] <> []) or (techwrite[g,n] <> []) )
  then begin
   g:=g+1;
   setlength(techwrite,g+1,15);
 end;								
                                end;{end row,box,col}

                              end; {end #'s for rows,cols,boxs}
                       end; {end  row,col,box}

            end;

   end; {set A} 		

   if k = 0 then techdisplay(#1,g);
end;{alsMwing}