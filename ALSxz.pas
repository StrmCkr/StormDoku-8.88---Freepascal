procedure alsxz(k:integer);  {so far this is 100,000% faster}
type
almostlockedset2= array of array of integer;
var
q,xn,xn2,yn,yn2,yn3,yn4,n,z,x,r,u,alsa,alsB,a,b:integer;

A3:numberset;
A4:numberset;

z1:nums;

lx1: rcbpeer;
lx2: rcbpeer;
als2:almostlockedset2;
begin
alsfinder;
  //ahsfinder;
b:=0;
setlength(als2,b,5);

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


if k=0 then begin  u:=0; setlength(techwrite,u+1,18); end;

 for alsA:= low(als2) to (high(als2)-1) do {als A}
   if (als2[alsA,1]+1 = als2[alsA,2]) {cell = digit +1}
     then
       for ALSB:= alsa+1 to high(als2) do {Als B}
          if (als2[alsb,1]+1 = als2[alsb,2] ) {cell = digit +1}
           	and (popcnt(dword((comboset2[als2[alsa,4]]*Comboset2[als2[alsb,4]]) ) )   >1 )   {set a & B must share 2 digits}
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

			{restricted common chcek}
			   for z in (comboset[yn4] * comboset[yn2]) do
			      if ((Digitcell[z] * combosets[xn,yn])  - (combosets[xn2,yn3] * combosets[xn,yn]) <> [] ) {checks that the sector for z digit has cells out side the overlap}
			       and ((Digitcell[z] * combosets[xn2,yn3])  - (combosets[xn2,yn3] * combosets[xn,yn]) <> [] ) {checks that the sector for z dgit has cells out side the overlap}
                               and (digitcell[z] *( combosets[xn,yn] * combosets[xn2,yn3]) = [])    {resticted commons cannot be found in an overlap cell}
                       then
					       begin
                                                    lx2:=[0..26];

							for q in (combosets[xn,yn]+combosets[xn2,yn3]) *digitcell[z] do  {combine common cells in both a&b for common sectors amongts those cells}
							 lx2:= lx2 * cellsec[q];



                         if (popcnt(dword(lx2)) >0) and (popcnt(dword(lx2)) < 3)  {check that those cells only existing in 1 or 2 sectors to be restircted}
							  then
							  z1:=z1 + [z]; {saves the resticted commons}

						   end;

					  if   popcnt(dword(z1)) =1  {single restricted common eliminations}
                        then
						  begin

                                                   for R in ((comboset[yn4]  * comboset[yn2] ) -z1) do   {search for common digit to both, and active in both}
                                                      if ((Digitcell[R]* combosets[xn,yn] )<> [] )
                                                      and(( Digitcell[R] * combosets[xn2,yn3])<> [])
                                                       then
                                                        begin
                                                        active:=true;

                                                        a3:=(([0..80] * digitcell[R]));  {valid eliminations must contain R and cannot be in the sets a&b}

                                                          for q in ((combosets[xn,yn] + combosets[xn2,yn3]) * digitcell[R] )  do { a combined peer search for R with in the sets, A&B}
                                                           a3:=peer[q] * a3 - (combosets[xn,yn] + combosets[xn2,yn3]);

                                                         if (a3 <> (([0..80] * digitcell[R]) )) and (a3 <> [])  {safty checks}
                                                           then
                                                           covered2[R]:=covered2[r] + a3;   {elimination trigger}

                                                         if (k= 0 ) and (a3<> [0..80]) and (a3 <> [])
                                                           then
                                                            begin
                                                            techwrite[u,r+7]:= techwrite[u,r+7] + a3;
                                                            techwrite[u,7]:=techwrite[u,7]+[R];
                                                           end;
                                                        end;



if (k= 0)
 and (techwrite[u,7] <> [])
 then
begin
techwrite[u,0]:=[3];
techwrite[u,1]:=[4];
techwrite[u,2]:=techwrite[u,2]+comboset[yn2];
techwrite[u,3]:=techwrite[u,3]+Combosets[xn,yn];
techwrite[u,4]:=techwrite[u,4]+comboset[yn4];
techwrite[u,5]:=techwrite[u,5]+combosets[xn2,yn3];
techwrite[u,6]:=techwrite[u,6]+ z1;

end;

if u = 32767    {max array size error code safty exit}
 then
 begin
  if k = 0 then
     techdisplay(#97,u);
	
	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,17)
	
 //exit;
end;


if (k=0) and (techwrite[u,0] <> []) then begin  u:=U+1; setlength(techwrite,u+1,18); end;

                          end;   {normal eliminations}

					 if   popcnt(dword(z1)) >1  {doubly linked rules }
                        then
						  begin
                          active:=true;
						
                                                      active:=true;

                                                     {set A&b is now a locked set removal peers cells visable to all copies of each digit in  both sets}
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
                                                             techwrite[u,r+7]:= techwrite[u,r+7] + [q];
                                                             techwrite[u,7]:=techwrite[u,7]+[R];
                                                           end;

														  end;
														  {cells in set b for digits exclusivly to b  their peers cannot contain r}
														if (R in (Comboset[yn2] - z1)) 
														and  (peer[q] * Digitcell[R] * Combosets[xn,yn] = combosets[xn,yn] * Digitcell[R])
														and ([q] * combosets[xn,yn] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+7]:= techwrite[u,r+7] + [q];
                                                             techwrite[u,7]:=techwrite[u,7]+[R];
                                                           end;
														   end;
														   {cells in set A for digits exclusivly to A  their peers cannot contain r}
														if (R in (Comboset[yn4]  -  z1))
														and  (peer[q] * Digitcell[R] * Combosets[xn2,yn3] = combosets[xn2,yn3]* Digitcell[R])
														and ([q] * combosets[xn2,yn3] = [])
														  then
														   begin
														   covered2[R]:=Covered2[R] + [q];
														   if k =0 then
															begin
                                                             techwrite[u,r+7]:= techwrite[u,r+7] + [q];
                                                             techwrite[u,7]:=techwrite[u,7]+[R];
                                                           end;
														   end;


													  end; {R/Q elimiantion search}

if (k= 0)
 and (techwrite[u,7] <> [])
 then
begin
techwrite[u,0]:=[3];
techwrite[u,1]:=[4];
techwrite[u,2]:=techwrite[u,2]+comboset[yn2];
techwrite[u,3]:=techwrite[u,3]+Combosets[xn,yn];
techwrite[u,4]:=techwrite[u,4]+comboset[yn4];
techwrite[u,5]:=techwrite[u,5]+combosets[xn2,yn3];
techwrite[u,6]:=techwrite[u,6]+ z1;

end;

if u = 32767    {max array size error code safty exit}
 then
 begin
  if k = 0 then
     techdisplay(#97,u);
	
	 setlength(techwrite,0,0);
	 u:=0; setlength(techwrite,u+1,18)

 //exit;
end;
if (k=0) and (techwrite[u,0] <> []) then begin  u:=U+1; setlength(techwrite,u+1,18); end;



						   end;  {doubly linked}
		   end; {yn4}


if k = 0 then
     chaindisplay(#97,u);

end;{als -xz rule}