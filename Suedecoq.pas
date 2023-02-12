procedure Suedecoq(K,l,v:integer); { http://forum.enjoysudoku.com/two-sector-disjoint-subsets-t2033.html}
type
hold = array of integer;
Nuse = array of integer;
base = array of integer;
rcc = array of  array of nums;

RCDs = array of nums;
TRCC = array of nums;
usednum= array of nums;
usednum2= array of nums;

used = array of numberset;
used2 = array of numberset;

cellused=array of numberset; 

almostlockedset3= array of array of integer;
RCSTORE= array of array of nums;
var

xn,w,p,p2,n,n2,a,m,z,xn2,yn,yn3,yn2,yn4,xn3,yn5,yn6,xn4,q,r,u,b,b2,B3,max,size,f,count,g:integer;

h:hold;
nouse: nuse;
step: base;
rc:rcc;
RCD:RCDs;
TRC:TRCC;

als3: almostlockedset3;

store: RCSTORE;

A3:numberset;

z1:nums;
z2:nums; 

lx1: rcbpeer;
lx2: rcbpeer;

use:used;
use2:used;

usenum : usednum;
 usenum2 : usednum2; 
celluse : cellused;

begin
alsfinder;
  //ahsfinder;
setlength(als3,high(als)+1);
setlength(store,high(als)+1);

for a:= high(als) downto 0 do    {startin array}
 begin
 w:=-1;
 for p:= high(als) downto 0 do    {iteration of peers}
   if (als[p,1]+1 = als[p,2] ) then
     if (popcnt(dword((comboset2[als[a,4]]*Comboset2[als[p,4]]) ) )   >=1 )   {set a & B must share >=1 digits}
               and (combosets[als[a,0],als[a,3]]  - combosets[als[p,0],als[p,3]] <> [] )  { sectors can over lap, however cells cannot overlap in full}
	         and (combosets[als[p,0],als[p,3]] - combosets[als[a,0],als[a,3]] <> [] ) { sectors can over lap, however cells cannot overlap in full}

       then

         begin

		 xn:=als[a,0];
		 xn2:=als[p,0];

		yn:=als[a,3];
		yn3:=als[p,3];

		yn2:=als[a,4];
		yn4:= als[p,4];
		z1:=[];

					{restricted common chcek}
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


	if   ( ( popcnt(dword(z1)) >=1 ) )
        then
		begin
w:=w+1;
setlength(als3[a],w+1);
setlength(store[a],w+1);
als3[a,w]:=p;
store[a,w]:=z1;
end;

end;
end;

if k=1 then begin  u:=0; setlength(techwrite,u+1,0); end;

 for a:= high(als) downto 0 do    {startin array}
 if (high(als3[a]) +1 >= (als[a,2] - als[a,1]))
and (als[a,2] - als[a,1] >L) and (als[a,2] - als[a,1] <=v)

 then
 begin
  w:=0;
  setlength(h,w+1);
  h[w]:=high(als3[a]);

  		 setlength(TRC,(w+1));   {set the array size to w}

  		 TRC[w]:= []; {{stores the RC between A and all steps}} 
		 
		 setlength(RCD,(w+1));   {set the array size to w}

  		 RCD[w]:= []; {{stores the RC between A and current steps}} 
		 
		 setlength(usenum,w+1);		 
		 usenum[w]:=comboset[als[a,4]];  {digits used in the  step} 
		 
		 setlength(celluse,w+1);
		 celluse[w]:=combosets[als[a,0],als[a,3]]; 		{cells used in step}  	

setlength(use,(w+1));  {set the array size to w}
use[w]:=[0..80] - combosets[als[a,0],als[a,3]]; {cells unused to choose from} 

 size:= (als[a,2] - als[a,1]); {stes the number of added sets to search for is equal to the missing space size of A } 
 
  h[w]:= high(als3[a]);       {keeps track of what array is the next stop used for step W }
  
 setlength(use2,(w+1));  {set the array size to w}
 use2[w]:=combosets[als[a,0],als[a,3]]; {all cells used} 
      
 
  setlength(usenum2,w+1);	 
		 usenum2[w]:=comboset[als[a,4]];  {all digits used} 

   repeat
    for p:= h[w] downto 0 do
	  if  ((use[w] * combosets[als[als3[a,p],0],als[als3[a,p],3]]) <> [])	{checks the new set selected adds cells}  
	       and (( store[a,p] - TRC[w] <>[]) {checks that a new RC is added} 
		   or (w=1) )		 
		   
        then	
	     begin
	      h[w]:=h[w]-1;
		  inc(w);
		  
		   setlength(h,w+1);
           h[w]:=p-1;
		   
	       setlength(step,w+1);
		   step[w]:=p;
		  
		 setlength(usenum,w+1); {stores digits used at step} 
		
	     usenum[w]:=Comboset[als[als3[a,p],4]]; 
		 
		 setlength(celluse,w+1); {stores the cells used at step} 
		 celluse[w]:=combosets[als[als3[a,p],0],als[als3[a,p],3]]; 
		 		 
		 setlength(TRC,(w+1));   
  		 TRC[w]:= store[a,p]+TRC[w-1]; {stores the RC between A and all steps}
		 
		 setlength(RCD,(w+1));   
  		 RCD[w]:= store[a,p]; {stores the RC between A and current steps} 
		
           setlength(use,(w+1));  {removes the cells from the unused list}		  
           use[w]:= use[w-1] -  combosets[als[als3[a,p],0],als[als3[a,p],3]];
		   
		   setlength(use2,(w+1));  {all cells used} 		   
           use2[w]:=use2[w-1] + combosets[als[als3[a,p],0],als[als3[a,p],3]]; 
  
  setlength(usenum2,w+1);	{all digits used}  
		 usenum2[w]:=usenum2[w-1]+Comboset[als[als3[a,p],4]];  
		 
count:=0;
 for g in use2[w] do 
     inc(count);
	 
{removes the common RC if its used in muti sets} 	 
{z1:=[]; 
	for R:= 1 to w-1 do
	 for q:= (R+1) to w do 
	  z1:=Z1 + (RCD[r] * RCD[Q]); }	

z2:=usenum2[w];	  
if (size = w) and (count = popcnt(dword(usenum2[w] ))) then 
   {begin // removed  version faster rendition is below
 for R in usenum2[w] do  //numbers
  for q in [ 0..26] do  //sector
    if (combosetS[q,510]) * (use2[w] * Digitcell[R] ) = (use2[w] * Digitcell[R] )
     then 
       z2:=z2 - [r];  //identifies digits not in 1 sector 
end;  }
  
for R in usenum2[w] do
 begin 
  for q in (use2[w] * Digitcell[r]) do 
    for g in CellSec[q] do 
	   if  combosets[g,510] * (use2[w]*digitcell[r] )  =  (use2[w]*digitcell[r] )
	      then 
             begin 
               z2:=z2 - [r];
			     break; 
             end; 			 
  
 end;   

//type 1: N cells with N digits where each of the N digits is locked to 1 sector exactly ie N sectors.

if (size = w) and (count = popcnt(dword(usenum2[w]-z2 ))) 	
then
begin		   
	
if k = 1 
 then 
 begin 
 
 if u = 32765    {max array size error code safty exit}
 then
 begin
    chaindisplay(#22,u);
	 setlength(techwrite,0,0);
	 u:=0;
	 setlength(techwrite,u+1,0)
	 	 //exit;
end;
 
 f:=((w+1)*2);
setlength(techwrite[u],0);
setlength(techwrite[u],((f+13)+1)); 
end; 	
		  
// elimnations for als parts back to the first one. 	
 {	for R:= w downto 1 do 
	  For B in RCD[R] -z1 do 
	    for Q in (digitcell[b] - (use2[w]*digitcell[b])) do
           if ((peer[q] * (digitcell[b] * ((celluse[r] + celluse[0])*digitcell[b]))) 
		   = 	((celluse[r] + celluse[0])*digitcell[b])	) 
and ( ((celluse[r] + celluse[0])*digitcell[b])	<> [])	   
		   then 
		   begin 
		  Active:=true;
		  covered2[B]:=covered2[B] + [Q];
		  
		  if k = 1 
		    then 
			begin 
			 techwrite[u,(b+F+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
		  end; }	
		  
// elliminations for RC's as z1 digits common to all als
	{  For B in z1 do 
	    for Q in (digitcell[b] - (use2[w]*digitcell[b])) do
           if ((peer[q] * (digitcell[b] * ((use2[w])*digitcell[b]))) 
		   = 	((use2[w])*digitcell[b])	) 
          and ( ((use2[w])*digitcell[b])	<> [])	   
		   then 
		   begin 
		  Active:=true;
		  covered2[B]:=covered2[B] + [Q];
		  
		  if k = 1 
		    then 
			begin 
			 techwrite[u,(b+F+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
		  end; }
		  
// elliminations for all digits  since each digit is only in 1 sector we can use all cells and all digits. 
 
	  For B in usenum2[w] {- (RCD[W] + Z1)}  do 
	    for Q in (digitcell[b] - (use2[w]*digitcell[b])) do
           if ((peer[q] * (digitcell[b] * (use2[w]))) 
		   = 	((use2[w])*digitcell[b])	) 
          and ( ((use2[w])*digitcell[b])	<> [])	   
		   then 
		   begin 
		  Active:=true;
		  covered2[B]:=covered2[B] + [Q];
		  
		  if k = 1 
		    then 
			begin 
			 techwrite[u,(b+F+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
		  end; 		  		  

if (k=1) and (techwrite[u,(f+3)] <> []) 
 then
  begin
   techwrite[u,0]:=[3];
   techwrite[u,1]:=[f];
   
   techwrite[u,(f+3-1)]:=trc[w]; 
   //techwrite[u,(f+3)]:=z1; 
   
   techwrite[u,2]:=comboset[als[a,4]]; 
   techwrite[u,3]:=combosets[als[a,0],als[a,3]];
   
   for b:= 1 to w do 
    begin 
     techwrite[u,(b*2)+2]:=techwrite[u,(b*2)+2] + comboset[als[als3[a,step[b]],4]];
	 techwrite[u,(b*2)+3]:=techwrite[u,(b*2)+3]+ combosets[als[als3[a,step[b]],0],als[als3[a,step[b]],3]];
	 end; 

	 u:=u+1; 	 
	 setlength(techwrite,u+1);
  end; 
					

end ;{ case 1} 
					
			break;
	     end
	   else
	    h[w]:=h[w] -1;
	
	
	if ((h[w] < 0) and (w >0)) or (w = size) 
      then
        begin	
dec(w);		//set the array size to w
setlength(h,w+1);
setlength(use,(w+1));
setlength(TRC,(w+1)); 
setlength(RCD,(w+1)); 
setlength(usenum,w+1);
setlength(celluse,w+1);

setlength(usenum2,w+1);
setlength(use2,(w+1));
        end;		
		
   until (w = 0) and (h[w] < 0)

 end;
chaindisplay(#100,u);
end; {sue de coq}