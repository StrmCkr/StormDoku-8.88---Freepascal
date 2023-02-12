{all most locked sets XY Rule : including double and trippled linked rules} 
procedure alsxy(k:integer);  {so far this is 100,000% faster}
type
almostlockedset2= array of array of integer;
var
q,xn,xn2,xn3,yn,yn2,yn3,yn4,YN5,YN6,n,z,x,act3,r,u,alsA,alsB,alsC,a,b:integer;

A3:numberset;
z1:nums;
Z2:nums;
z3:nums;

lx1: rcbpeer;
lx2: rcbpeer;
lx3: rcbpeer;
als2: almostlockedset2;

begin
alsfinder;
  //ahsfinder;
b:=-1;
setlength(als2,b+1,5);

{reduces the als array to the +1 size}
for a:= high(als) downto 0 do    {startin array}
 if (als[a,1]+1 = als[a,2])
  then
   begin
    b:=b+1;
	setlength(als2,b+1,5);
	als2[b,0]:=als[a,0];
	als2[b,1]:=als[a,1];
	als2[b,2]:=als[a,2];
	als2[b,3]:=als[a,3];
	als2[b,4]:=als[a,4];
end;

if k=0 then begin  u:=0; setlength(techwrite,u+1,20); end;

for alsA:= low(als2) to (high(als2)-2) do {als C}
   if (als2[alsA,1]+1 = als2[alsA,2]) {cell = digit +1}
     then
       for ALSB:= alsa+1 to high(als2)-1 do {Als A}
          if (als2[alsb,1]+1 = als2[alsb,2] ) {cell = digit +1}
		  and (popcnt(dword((comboset2[als2[alsa,4]]*Comboset2[als2[alsb,4]]) ) )   >=1 )   {set a & B must share 2 digits}
               and (combosets[als2[alsa,0],als2[alsa,3]]  - combosets[als2[alsb,0],als2[alsb,3]] <> [] )  { sectors can over lap, however cells cannot overlap in full}
	         and (combosets[als2[alsb,0],als2[alsb,3]] - combosets[als2[alsa,0],als2[alsa,3]] <> [] ) { sectors can over lap, however cells cannot overlap in full}
	then
			   begin

			    xn:=als2[alsa,0];
			    xn2:=als2[alsb,0];

				yn:=als2[alsA,3];
				yn3:=als2[alsB,3];
				
				yn2:=als2[alsa,4];
				yn4:= als2[alsb,4];
			  z1:=[];
			
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
				
					
for alsC:= low(als2) to (high(als2)) do {als b}
   if (als2[alsC,1]+1 = als2[alsC,2]) {cell = digit +1}
     and   (popcnt(dword(( comboset2[yn2]*Comboset2[als2[alsC,4]]  ) ) )   >=1 ) {checks that set B and set C share at least 1 digits}
	 	
	  and  (combosets[xn,yn]  - combosets[als2[alsC,0],ALS2[ALSC,3]] <> [] )  { sectors B & C can over lap, however cells cannot overlap in full}
	  and  ( combosets[als2[alsC,0],ALS2[ALSC,3]] - combosets[xn,yn] <> [] )
	   then
		   begin
		      z2:=[];
			  z3:=[];

			  xn3:=als2[alsc,0];
			  yn5:=als2[alsc,3];
		      yn6:= als2[alsc,4];

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

					  if   (popcnt(dword( (comboset2[yn4]*Comboset2[yn6]) ) )   >=1 )
                                     then
                                            for R in ((comboset[yn6]  * comboset[yn4]  )-(z2+z1{+z3})    ) do   {search for common digit to both A & B, thats not the RC of z1,z2,z3}
                                                      if ((Digitcell[R]* combosets[xn2,yn3] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn3,yn5])<> [])
                                                     // and (Digitcell[R] * combosets[xn2,yn3]   = [])
                                                       then
                                                        begin
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]));  {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in ((combosets[xn3,yn5] + combosets[xn2,yn3] {+ combosets[xn,yn]}) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b}
                                                           a3:=peer[q] * a3 - ({combosets[xn,yn] +} combosets[xn2,yn3] + combosets[xn3,yn5]);

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

 {if AC share more then 1 digit perform basic als-xz eliminations}
if   (popcnt(dword( (comboset2[yn4]*Comboset2[yn2]) ) )   >1 )
    then
                                           for R in ((comboset[yn2]  * comboset[yn4]  )-(z1)    ) do   {search for common digit to both A & C, thats not the RC of z1,}
                                                      if ((Digitcell[R]* combosets[xn2,yn3] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn,yn])<> [])
                                                     // and (Digitcell[R] * combosets[xn2,yn3]   = [])
                                                       then
                                                        begin
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]));  {valid eliminations must contain R and cannot be in the sets a&C}

                                                          for q in (({combosets[xn3,yn5] +} combosets[xn2,yn3] + combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b}
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

 {if BC share more then 1 digit perform basic als-xz eliminations}
if   (popcnt(dword( (comboset2[yn6]*Comboset2[yn2]) ) )   >1 )
    then
                                           for R in ((comboset[yn2]  * comboset[yn6]  )-(z2)    ) do   {search for common digit to both B & C, thats not the RC of z2,}
                                                      if ((Digitcell[R]* combosets[xn3,yn5] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn,yn])<> [])
                                                     // and (Digitcell[R] * combosets[xn2,yn3]   = [])
                                                       then
                                                        begin
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]));  {valid eliminations must contain R and cannot be in the sets a&C}

                                                          for q in ((combosets[xn3,yn5] {+ combosets[xn2,yn3] }+ combosets[xn,yn]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&b}
                                                           a3:=peer[q] * a3 - (combosets[xn,yn] {+ combosets[xn2,yn3]} + combosets[xn3,yn5]);

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

														
														
					 if  ( popcnt(dword(z1)) >1 ) {doubly linked rules } {A & C}

                        then
						  begin
                                                      active:=true;

                                                     {set A&C is now a locked set removal peers cells visable to all copies of each digit in  both sets}
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

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;
														  {cells in set C for digits exclusivly to C  their peers cannot contain r}
														if (R in (Comboset[yn2] - z1))//Comboset[yn4]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn,yn] = combosets[xn,yn] * Digitcell[R])
														and ([q] * combosets[xn,yn] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;
														   {cells in set A for digits exclusivly to A  their peers cannot contain r}
														if (R in (Comboset[yn4]  -  z1))//Comboset[yn2]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn2,yn3] = combosets[xn2,yn3]* Digitcell[R])
														and ([q] * combosets[xn2,yn3] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;


													  end; {R/Q elimiantion search}

						   end;  {doubly linked}

 if  ( popcnt(dword(z2)) >1 )  {doubly linked rules } {B & C}
                          then
						  begin
                                                      active:=true;

                                                     {set B&C is now a locked set removal peers cells visable to all copies of each digit in  both sets}
                                                  for R in comboset[yn2] + comboset[yn6] do
													 for q in ([0..80] * digitcell[R]) do
													  begin {R/Q elimiantion search}

													  if (R in (comboset[yn2] * Comboset[yn6]) ){search for common digit to both, and active in both}
													  and ((digitcell[R] * combosets[xn,yn])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn3,yn5])  <> [])
													  and (Peer[q] * ((Combosets[xn,yn]+Combosets[xn3,yn5])*digitcell[R]) = ((Combosets[xn,yn] + Combosets[xn3,yn5])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * (Combosets[xn,yn] + combosets[xn3,yn5]) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;
														  {cells in set C for digits exclusivly to C  their peers cannot contain r}
														if (R in (Comboset[yn2] - z2))//Comboset[yn6]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn,yn] = combosets[xn,yn] * Digitcell[R])
														and ([q] * combosets[xn,yn] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;
														   {cells in set B for digits exclusivly to B  their peers cannot contain r}
														if (R in (Comboset[yn6]  - z2))// Comboset[yn2]) )
														and  (peer[q] * Digitcell[R] * Combosets[xn3,yn5] = combosets[xn3,yn5]* Digitcell[R])
														and ([q] * combosets[xn3,yn5] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;


													  end; {R/Q elimiantion search}

						   end;  {doubly linked}
						
{tripply linked rules } {B & A & C  are all locked sets}
 if  (( popcnt(dword(z3)) >=1)  and(( popcnt(dword(z3+z2+z1)) >=3))) // and(z3 - (z2+z1) <> [] ))   {check that the resticted commons between the three sets are all diffrent}
                        then
						  begin

							   active:=true;

                                                     {set B&C is now a locked set removal peers cells visable to all copies of each digit in  all sets}
                                                  for R in comboset[yn4] + comboset[yn6] +comboset[yn2] do
													 for q in ([0..80] * digitcell[R]) do
													  begin {R/Q elimiantion search}

													  if (R in (comboset[yn4] * Comboset[yn6] * Comboset[yn2]) ){search for common digit to all, and active in all}
													  and ((digitcell[R] * combosets[xn2,yn3])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn3,yn5])  <> [])
													  and ( (Digitcell[R] * combosets[xn,yn])  <> [])
													  and (Peer[q] * ((Combosets[xn2,yn3]+Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R]) = ((Combosets[xn2,yn3] + Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * (Combosets[xn2,yn3] + combosets[xn3,yn5]+combosets[xn,yn]) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                            techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;
           if (R in (comboset[yn4] * Comboset[yn6] )  ){search for common digit to ab, and active in ab}
													  and ((digitcell[R] * combosets[xn2,yn3])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn3,yn5])  <> [])	
													  and	( (Digitcell[R] * combosets[xn,yn])  = [])		{and not in c}																				
													  and (Peer[q] * ((Combosets[xn2,yn3]+Combosets[xn3,yn5]{+combosets[xn,yn]})*digitcell[R]) = ((Combosets[xn2,yn3] + Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * (Combosets[xn2,yn3] + combosets[xn3,yn5]{+combosets[xn,yn]}) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;

           if (R in (comboset[yn2] * Comboset[yn6] ) ){search for common digit to cb, and active in c}
													  and ((digitcell[R] * combosets[xn,yn])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn3,yn5])  <> [])	
													  and	( (Digitcell[R] * combosets[xn2,yn3])  = []) {and not in b}	
													  and (Peer[q] * (({Combosets[xn2,yn3]+}Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R]) = ((Combosets[xn2,yn3] + Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * ({Combosets[xn2,yn3] +} combosets[xn3,yn5]+combosets[xn,yn]) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;
           if (R in (comboset[yn2] * Comboset[yn4] ) ){search for common digit to ca, and active in ca}
													  and ((digitcell[R] * combosets[xn,yn])  <> [] )
                                                      and ( (Digitcell[R] * combosets[xn2,yn3])  <> [])
													  and	( (Digitcell[R] * combosets[xn3,yn5])  = [])	{and not in b}
													  and (Peer[q] * ((Combosets[xn2,yn3]+{Combosets[xn3,yn5]+}combosets[xn,yn])*digitcell[R]) = ((Combosets[xn2,yn3] + Combosets[xn3,yn5]+combosets[xn,yn])*digitcell[R])) {makes sure the peer of q can see all the digits}
													   and ([q] * (Combosets[xn2,yn3] {+ combosets[xn3,yn5]}+combosets[xn,yn]) = []) {q cannot elimiante from a set cell}
													     then
														 begin
														   covered2[R]:=Covered2[R] + [q];

														if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;

														  end;														
														{belive comboset yn6,yn2 can be replaced with z1,z2,z3} //same as i did for the xz-function.
														  {cells in set A for digits exclusivly to A  their peers cannot contain r}
														if (R in (Comboset[yn4] - (Comboset[yn6]+comboset[yn2])) )
														and  (peer[q] * Digitcell[R] * Combosets[xn2,yn3] = combosets[xn2,yn3] * Digitcell[R])
														and ([q] * combosets[xn2,yn3] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;
														   {cells in set B for digits exclusivly to B  their peers cannot contain r}
														if (R in (Comboset[yn6]  - ( Comboset[yn4]+comboset[yn2]) ))
														and  (peer[q] * Digitcell[R] * Combosets[xn3,yn5] = combosets[xn3,yn5]* Digitcell[R])
														and ([q] * combosets[xn3,yn5] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;
                                                         {cells in set C for digits exclusivly to C  their peers cannot contain r}
														if (R in (Comboset[yn2]  - ( Comboset[yn4]+comboset[yn6]) ))
														and  (peer[q] * Digitcell[R] * Combosets[xn,yn] = combosets[xn,yn]* Digitcell[R])
														and ([q] * combosets[xn,yn] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+9]:= techwrite[u,r+9] + [q];
                                                             techwrite[u,9]:=techwrite[u,9]+[R];
                                                           end;
														   end;

													  end; {R/Q elimiantion search}

						   end;  {tripply linked}



if (k= 0)
 and (techwrite[u,9] <> [])
 then
begin
techwrite[u,0]:=techwrite[u,0]+[3];
techwrite[u,1]:=techwrite[u,1]+[6]; 
techwrite[u,2]:=techwrite[u,2]+comboset[yn2];
techwrite[u,3]:=techwrite[u,3]+Combosets[xn,yn];
techwrite[u,4]:=techwrite[u,4]+comboset[yn4];
techwrite[u,5]:=techwrite[u,5]+combosets[xn2,yn3];
techwrite[u,6]:=techwrite[u,6]+comboset[yn6];
techwrite[u,7]:=techwrite[u,7]+combosets[xn3,yn5];
techwrite[u,8]:=techwrite[u,8]+ z1 + z2;

end;


if u = 32767    {max array size error code safty exit}
 then
 begin
  if k = 0 then
     techdisplay(#121,u);

	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,20) 
end;

if (k=0) and (techwrite[u,9] <> []) then begin  u:=U+1; setlength(techwrite,u+1,20); end;
				

					  end; {normal eliminations}

				 end;
				end;            		

if k = 0 then
     chaindisplay(#121,u);
end;{als -xy rule}