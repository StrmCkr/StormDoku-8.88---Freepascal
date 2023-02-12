{Almost Almost locked set 2 RC rule}
procedure Aals2RC(k:integer);  {so far this is 100,000% faster}
var
q,xn,xn2,xn3,yn,yn2,yn3,yn4,YN5,YN6,n,z,x,act3,r,u,alsa,alsb,alsc:integer;

A3:numberset;
z1:nums;
Z2:nums;
z3:nums;

lx1: rcbpeer;
lx2: rcbpeer;
lx3: rcbpeer;

begin
alsfinder;
  //ahsfinder;
if k=0 then begin  u:=0; setlength(techwrite,u+1,20); end;

for alsA:= low(als) to (high(als)) do {als C}
   if (als[alsA,1]+2 = als[alsA,2]) {cell = digit +2}
     then	
       for ALSB:= low(als) to high(als)-1 do {Als A}
          if (als[alsb,1]+1 = als[alsb,2] ) {cell = digit +1}
		  and (popcnt(dword((comboset2[als[alsa,4]]*Comboset2[als[alsb,4]]) ) )   >=1 )   {set a & C must share 1 digits}
               and (combosets[als[alsa,0],als[alsa,3]]  - combosets[als[alsb,0],als[alsb,3]] <> [] )  { sectors can over lap, however cells cannot overlap in full}
	         and (combosets[als[alsb,0],als[alsb,3]] - combosets[als[alsa,0],als[alsa,3]] <> [] ) { sectors can over lap, however cells cannot overlap in full}
	then
			   begin
			   z1:=[];
			   	xn:=als[alsa,0];
			    xn2:=als[alsb,0];

				yn:=als[alsA,3];
				yn3:=als[alsB,3];
				
				yn2:=als[alsa,4];
				yn4:= als[alsb,4];
			{restricted common chcek A & C}
			   for z in (comboset[yn4] * comboset[yn2]) do
			      if ((Digitcell[z] * combosets[xn,yn])  - (combosets[xn2,yn3] * combosets[xn,yn]) <> [] ) {checks that the sector for z digit has cells out side the overlap}
			       and ((Digitcell[z] * combosets[xn2,yn3])  - (combosets[xn2,yn3] * combosets[xn,yn]) <> [] ) {checks that the sector for z dgit has cells out side the overlap}
                               and (digitcell[z] *( combosets[xn,yn] * combosets[xn2,yn3]) = [])    {resticted commons cannot be found in an overlap cell}
                       then
					       begin
                             lx2:=[0..26];   { a RC should only exist in the common intersections of the selected sets}

							for q in (combosets[xn,yn]+combosets[xn2,yn3]) *digitcell[z] do  {combine common cells in both a&b for common sectors amongts those cells}
							 lx2:= lx2 * cellsec[q];


                   if (popcnt(dword(lx2)) >0) and (popcnt(dword(lx2)) < 3)  {check that those cells only existing in 1 or 2 sectors to be restircted}
							  then
							  z1:=z1 + [z]; {saves the resticted commons}

						   end;

					  if   popcnt(dword(z1)) >=1  {* single restricted common advance to adding 3rd sector}
                        then						 	
						
for alsC:= alsb+1 to (high(als)) do {als b}
   if (als[alsC,1]+1 = als[alsC,2]) {cell = digit +1}
     and   (popcnt(dword(( comboset2[yn2]*Comboset2[als[alsC,4]]  ) ) )   >=1 ) {checks that set B and set C share at least 1 digits}
	 	
	  and  (combosets[xn,yn]  - combosets[als[alsC,0],ALS[ALSC,3]] <> [] )  { sectors B & C can over lap, however cells cannot overlap in full}
	  and  ( combosets[als[alsC,0],ALS[ALSC,3]] - combosets[xn,yn] <> [] )
	   then
		   begin
		      z2:=[];
			  z3:=[];

			  xn3:=als[alsc,0];
			  yn5:=als[alsc,3];
		      yn6:= als[alsc,4];
			
{restricted common chcek B & C}
			   for z in (comboset[yn6] * comboset[yn2] ) do
			      if ((Digitcell[z] * combosets[xn3,yn5])  - ({(digitcell[z]*COmbosets[xn2,yn3]) + }(combosets[xn,yn] * combosets[xn3,yn5])) <> [] ) {checks that the sector for z digit has cells out side the overlap}
			       and ((Digitcell[z] * combosets[xn,yn])  - ({(digitcell[z]*COmbosets[xn2,yn3]) + }(combosets[xn,yn] * combosets[xn3,yn5])) <> [] ) {checks that the sector for z dgit has cells out side the overlap}
                               and (digitcell[z] *( combosets[xn3,yn5] * combosets[xn,yn]) = [])    {resticted commons cannot be found in an overlap cell}
                               //and (digitcell[z] * Combosets[xn2,yn3] - (combosets[xn3,yn5]+combosets[xn,yn]) = []){resticted commons cannot be found in an overlap cell shared by the 2nd set}
                       then
					       begin
                             lx2:=[0..26];   { a RC should only exist in the common intersections of the selected sets}

							for q in (combosets[xn3,yn5]+combosets[xn,yn]) *digitcell[z] do  {combine common cells in both C&B for common sectors amongts those cells}
							 lx2:= lx2 * cellsec[q];


                   if (popcnt(dword(lx2)) >0) and (popcnt(dword(lx2)) < 3)  {check that those cells only existing in 1 or 2 sectors to be restircted}
							  then
							  z2:=z2 + [z]; {saves the resticted commons}

						   end;		
						
	{restricted common chcek B & A}
			   for z in (comboset[yn6] * comboset[yn4] ) do
			      if ((Digitcell[z] * combosets[xn3,yn5])  - ({(digitcell[z]*COmbosets[xn2,yn3]) + }(combosets[xn2,yn3] * combosets[xn3,yn5])) <> [] ) {checks that the sector for z digit has cells out side the overlap}
			       and ((Digitcell[z] * combosets[xn2,yn3])  - ({(digitcell[z]*COmbosets[xn2,yn3]) + }(combosets[xn2,yn3] * combosets[xn3,yn5])) <> [] ) {checks that the sector for z dgit has cells out side the overlap}
                               and (digitcell[z] *( combosets[xn3,yn5] * combosets[xn2,yn3]) = [])    {resticted commons cannot be found in an overlap cell}
                               //and (digitcell[z] * Combosets[xn2,yn3] - (combosets[xn3,yn5]+combosets[xn,yn]) = []){resticted commons cannot be found in an overlap cell shared by the 2nd set}
                       then
					       begin
                             lx2:=[0..26];   { a RC should only exist in the common intersections of the selected sets}

							for q in (combosets[xn3,yn5]+combosets[xn2,yn3]) *digitcell[z] do  {combine common cells in both C&B for common sectors amongts those cells}
							 lx2:= lx2 * cellsec[q];


                   if (popcnt(dword(lx2)) >0) and (popcnt(dword(lx2)) < 3)  {check that those cells only existing in 1 or 2 sectors to be restircted}
							  then
							  z3:=z3 + [z]; {saves the resticted commons}
						   end;
						
			   if  (( popcnt(dword(z2)) >1 ) and ( popcnt(dword(z1)) >1 )){if the resticted common on a set is more then 1 its an double linked als-xz rule}
			     or (( popcnt(dword(z2)) =1 ) and ( popcnt(dword(z1)) =1 )   and (z1 - z2 <> [] ) and (Z2 - z1 <> []))   {checks that both sectors have at least 1 RC and those numbers are diffrent }
                 or (( popcnt(dword(z2)) =1 ) and ( popcnt(dword(z1)) >1 ))
			     or (( popcnt(dword(z2)) >1 ) and ( popcnt(dword(z1)) =1 ))
               //  and ((comboset[yn4] * Comboset[yn6] - (z2+z1) ) <> [])
					 then
					  begin {Eliminations A & B peer of z}

					  if   (popcnt(dword( (comboset2[yn4]*Comboset2[yn6]*comboset2[yn2]) ) )   >=1 )
                                     then
                                            for R in ((comboset[yn6]  * comboset[yn4] * comboset[yn2]  )   ) do   {search for common digit to both A & B &C, thats not the RC of z1,z2,z3}
                                                      if ((Digitcell[R]* combosets[xn2,yn3] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn3,yn5])<> [])
                                                      and ((Digitcell[R] * combosets[xn,yn]  <> []))
													  and ((z1-z2) - [r] <> [])
													  and ((z2-z1) - [r] <> [])
                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in ((combosets[xn3,yn5] + combosets[xn2,yn3] + combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3 - (combosets[xn,yn] + combosets[xn2,yn3] + combosets[xn3,yn5]);

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;
														
							  if   (popcnt(dword( (z1+z2) ) )   >=4 ) {double linked restriction of links}
                                     then
									   begin
                                            for R in ((comboset[yn6]  * comboset[yn2]  *z2 )   ) do   {search for common digit to both C & B  thats in Z2}
                                                      if ((Digitcell[R]* combosets[xn,yn] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn3,yn5])<> [])
                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in ((combosets[xn3,yn5] {+ combosets[xn2,yn3]} + combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3- (combosets[xn,yn] {+ combosets[xn2,yn3] }+ combosets[xn3,yn5]);

                                                         if (a3 <> (([0..80] * digitcell[R]))) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;	
														
											  for R in ((comboset[yn2]  * comboset[yn4]  *z1 )   ) do   {search for common digit to both C & A  thats in Z1}
                                                      if ((Digitcell[R]* combosets[xn,yn] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn2,yn3])<> [])
                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in (({combosets[xn3,yn5] +} combosets[xn2,yn3] + combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3 - (combosets[xn,yn] + combosets[xn2,yn3] {+ combosets[xn3,yn5]});

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;	
														
										for R in ((comboset[yn2]   ) -(z1+z2)  ) do   {search for  digit in  A  thats left from Z1+z2}
                                                      if ((Digitcell[R]* combosets[xn,yn] )<> [] )

                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in (({combosets[xn3,yn5] + combosets[xn2,yn3] +} combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3- (combosets[xn,yn] {+ combosets[xn2,yn3] + combosets[xn3,yn5]});

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;
														
										for R in ((comboset[yn4]   ) -(z1+z2)  ) do   {search for  digit in  A  thats left from Z1+z2}
                                                      if ((Digitcell[R]* combosets[xn2,yn3] )<> [] )

                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in (({combosets[xn3,yn5] + combosets[xn,yn] +} combosets[xn2,yn3]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3- (combosets[xn2,yn3] {+ combosets[xn2,yn3] + combosets[xn3,yn5]});

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;
										for R in ((comboset[yn6]   ) -(z1+z2)  ) do   {search for  digit in  A  thats left from Z1+z2}
                                                      if ((Digitcell[R]* combosets[xn3,yn5] )<> [] )

                                                       then
                                                        begin
														
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]) ); {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in (({combosets[xn2,yn3] + combosets[xn,yn] +} combosets[xn3,yn5]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b&C}
                                                           a3:=peer[q] * a3- (combosets[xn3,yn5] {+ combosets[xn2,yn3] + combosets[xn,yn]});

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+9]:= techwrite[u,r+9] + a3;
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

                                                        end;
														
							
						             end;
if (k= 0)
 and (techwrite[u,9] <> [])
 then
begin
techwrite[u,0]:=[3];
techwrite[u,1]:=[6]; 

techwrite[u,2]:=techwrite[u,2]+comboset[yn2];
techwrite[u,3]:=techwrite[u,3]+Combosets[xn,yn];

techwrite[u,4]:=techwrite[u,4]+comboset[yn4];
techwrite[u,5]:=techwrite[u,5]+combosets[xn2,yn3];

techwrite[u,6]:=techwrite[u,6]+comboset[yn6];
techwrite[u,7]:=techwrite[u,7]+combosets[xn3,yn5];

techwrite[u,8]:=techwrite[u,8]+ z1+z2;

end;


if u = 32767    {max array size error code safty exit}
 then
 begin
  if k = 0 then
     techdisplay(#25,u);

	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,20)

 //exit;

end;

if (k=0) and (techwrite[u,9] <> []) then begin  u:=U+1; setlength(techwrite,u+1,20); end;


					  end;
                             
				 end;
				end;
            		

if k = 0 then
     chaindisplay(#25,u);
end;{Aals 2RC rule}	
