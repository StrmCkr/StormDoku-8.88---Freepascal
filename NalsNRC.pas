
{N*almost locked set  N* RC rule } // work in progress 

procedure NalsNRC(K:integer);  {mutual exclusion}
type
hold = array of integer;
Nuse = array of integer;
base = array of integer;
rcc = array of  array of nums;

RCDs = array of nums;
TRCC = array of nums;
usednum= array of nums;

used = array of numberset;
used2 = array of numberset;

cellused=array of numberset; 

almostlockedset3= array of array of integer;
RCSTORE= array of array of nums;
var

xn,w,p,p2,n,n2,a,m,z,xn2,yn,yn3,yn2,yn4,xn3,yn5,yn6,xn4,q,r,u,b,b2,B3,max,size,f:integer;

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
     if (popcnt(dword((comboset2[als[a,4]]*Comboset2[als[p,4]]) ) )   >=1 )   {set a & B must share >1 digits}
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
and (als[a,2] - als[a,1] >=1)
//and (comboset[als[a,4]] = [1,2,4])
 then
 begin
  w:=0;
  setlength(h,w+1);
  h[w]:=high(als3[a]);

  		 setlength(TRC,(w+1));   {set the array size to w}

  		 TRC[w]:= [];
		 
		 setlength(usenum,w+1);
		 usenum[w]:=comboset[als[a,4]]; 
		 setlength(celluse,w+1);
		 celluse[w]:=combosets[als[a,0],als[a,3]]; 
		 
		 setlength(rcd,W+1);
		 rcd[W]:=Comboset[als[a,4]];

setlength(use,(w+1));  {set the array size to w}
setlength(use2,(w+1));  {set the array size to w}
use[w]:=[0..80] - combosets[als[a,0],als[a,3]];
use2[w]:=[0..80];

 size:= (als[a,2] - als[a,1]);
 
  h[w]:= high(als3[a]);       {keeps track of what array is the next stop used for step W }

   repeat
    for p:= h[w] downto 0 do
	  if  ((use[w] * combosets[als[als3[a,p],0],als[als3[a,p],3]]) <> [])	  
	       and (( store[a,p] - TRC[w] <>[])
		   or (w=1) )
		  // or (( w< size ) and (popcnt(dword(trc[w]))> size) and (store[a,p]-trc[w] = [])) )
		   
         {  and ((comboset[als[als3[a,p],4]] = [2,4])
		   
		   or  (comboset[als[als3[a,p],4]] = [1,4])) }
		   
        then	
	     begin
	      h[w]:=h[w]-1;
		  inc(w);
		   setlength(h,w+1);
           h[w]:=p-1;
	       setlength(step,w+1);
		   step[w]:=p;
		  
		 setlength(usenum,w+1);
		 usenum[w]:=Comboset[als[als3[a,p],4]]; 
		 setlength(celluse,w+1);
		 celluse[w]:=combosets[als[als3[a,p],0],als[als3[a,p],3]]; 
		 		
		 setlength(rcd,W+1);
		 rcd[W]:=RCD[w-1] * Comboset[als[als3[a,p],4]];
		
		  setlength(TRC,(w+1));   {set the array size to w}

  		 TRC[w]:= store[a,p]+TRC[w-1];
		
           setlength(use,(w+1));  {set the array size to w}
		    setlength(use2,(w+1));  {set the array size to w}
           use[w]:= use[w-1] -  combosets[als[als3[a,p],0],als[als3[a,p],3]];
			use2[w]:= use2[w-1] -  combosets[als[als3[a,p],0],als[als3[a,p],3]];
			
{if (k=1) 
 then
  begin
  f:=((w+1)*2);
setlength(techwrite[u],0);
setlength(techwrite[u],((f+13)+1));
 
   techwrite[u,0]:=[3];
   techwrite[u,1]:=[f];
   
   techwrite[u,(f+3-1)]:=trc[w]; 
   techwrite[u,(f+3)]:=z1; 
   
   techwrite[u,2]:=comboset[als[a,4]]; 
   techwrite[u,3]:=combosets[als[a,0],als[a,3]];
   
   for b:= 1 to w do 
    begin 
     techwrite[u,(b*2)+2]:=techwrite[u,(b*2)+2] + comboset[als[als3[a,step[b]],4]];
	 techwrite[u,(b*2)+3]:=techwrite[u,(b*2)+3]+ combosets[als[als3[a,step[b]],0],als[als3[a,step[b]],3]];
	 end; 

	 u:=u+1; 	 
	 setlength(techwrite,u+1);	
	 writexy(2,60,'size :');
	 write(w,' ',size);
  end; 	}


//type 1: links = correct number 
if ((w) = size)  and (popcnt(dword(TRC[w] )) >= size  ) //and (RCD[w] <> [])
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
	a3:=[];	
	a3:= [0..80] - use[w];	
	
 
 z1:=[]; 
for q:= w downto 1 do 	
	for b:= w downto 1 do
	 begin 
	 if (popcnt(dword(store[a,step[b]]-z1)) =1)
	 	   then
	        Z1:=z1 + (store[a,step[b]]);
	   
	 if (popcnt(dword(store[a,step[b]]-rcd[w])) = 1 )
	   then 
	    z1:= z1 + (store[a,step[b]] - (rcd[w])); 
	 	
	 end; 

 
if  popcnt(dword(trc[w] -z1 )) = (size - popcnt(dword(z1)))
    then 
        z1:=z1 + trc[w] ;
	

	 
// eliminates a common digit thats no listed as a RC when RC = number of links}  	
if popcnt(dword(TRC[w])) = size   
 then
	for b in RCD[w] -( trc[w])  do 
	  for q in digitcell[b] do
       if (peer[q] * (a3 * digitcell[b]) = (a3 * digitcell[b]) ) and (a3 * digitcell[b] <> [])	   
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
		  
// eliminates a common "non" RC when there is more digits then links required 		
 if popcnt(dword(TRC[w])) >= size   
        then
  		 for b in RCD[w] - z1  do 
	       for q in digitcell[b] do
           if( peer[q] * (a3 * digitcell[b]) = (a3 * digitcell[b]) ) and (a3 * digitcell[b] <> [])		    
		    
	          then
			  begin
			  Active:=true;
		         covered2[B]:=covered2[B] + [Q];
		 if k = 1 
		    then 
			 begin 
			 techwrite[u,(b+f+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
			 
		  end; 
		  
 		  
// elimination code for locked sets 		  
if (popcnt(dword(TRC[w])) >= size*2   ) 
        then	  
          begin   
			 for r:= w downto 1 do   
			      for b in usenum[r] - store[a,step[r]] do 
				    for q in (( digitcell[b]) - celluse[r] ) do 
					  if ((peer[q] * digitcell[b] * celluse[r]) = digitcell[b] * celluse[r])
                        and (digitcell[b] * celluse[r] <> [] )
                              
                                then 
								   begin 
											 
			  Active:=true;
		         covered2[B]:=covered2[B] + [Q];
		 if k = 1 
		    then 
			 begin 
			 techwrite[u,(b+f+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
			 
			end;
			
		for b in usenum[0] - trc[w] do 
				    for q in ((digitcell[b] ) - celluse[0] ) do 
					  if ((peer[q] * digitcell[b] * celluse[0]) = digitcell[b] * celluse[0])
                        and (digitcell[b] * celluse[0] <> [] )
                              
                                then 
								   begin 
											 
			  Active:=true;
		         covered2[B]:=covered2[B] + [Q];
		 if k = 1 
		    then 
			 begin 
			 techwrite[u,(b+f+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 	 	
			end;
	
	for r:= w downto 1 do   
			      for b in usenum[r] * store[a,step[r]] do 
				    for q in (([0..80] * digitcell[b] ) - (celluse[r]+celluse[0]) ) do 
					  if ((peer[q] * digitcell[b] * (celluse[r]+celluse[0])) = (digitcell[b] * (celluse[r]+celluse[0])))
                        and (digitcell[b] * (celluse[r]+celluse[0]) <> [] )
                              
                                then 
								   begin 
											 
			  Active:=true;
		         covered2[B]:=covered2[B] + [Q];
		 if k = 1 
		    then 
			 begin 
			 techwrite[u,(b+f+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
			 
			end;				
			
		  end; 
			


if (k=1) and (techwrite[u,(f+3)] <> []) 
 then
  begin
   techwrite[u,0]:=[3];
   techwrite[u,1]:=[w];
   
   techwrite[u,(f+3-1)]:=trc[w]; 
   techwrite[u,(f+3)]:=z1; 
   
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

end;
// temp removed type 2 for the time being to focus on missing eliminations in type 1} 
//type 2 eliminates  when there is  not enough links then required as it locks the first set to empty if they are all false 
if (popcnt(dword(TRC[w] )) > 1+ size  ) and  (w = 1 +size)  
then
begin

if k = 1 
 then 
 begin 
 f:=((w+1)*2);
setlength(techwrite[u],0);
setlength(techwrite[u],((f+13)+1)); 
end; 

a3:=[];
a3:= [0..80] - use2[w];
z1:=[];

for q:= w downto 1 do 	
	for b:= w downto 1 do
	 if popcnt(dword(store[a,step[b]]-z1)) =1
	 then
	   Z1:=z1 + (store[a,step[b]]);
	   
if popcnt(dword(TRC[w])) = 1+size  
 then

	for b in RCD[w] - trc[w]  do 	
	  for q in [0..80] do
       if (peer[q] * (a3 * digitcell[b]) = (a3 * digitcell[b]) ) and (a3 * digitcell[b] <> [])
	   and (q in digitcell[b])
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
		
 if popcnt(dword(TRC[w])) >= 1+ size  
        then
  		 for b in RCD[w] - z1  do 	
	       for q in [0..80] do
           if( peer[q] * (a3 * digitcell[b]) = (a3 * digitcell[b]) ) and (a3 * digitcell[b] <> [])
		    and (q in digitcell[b])
		    
	          then
			  begin
			  Active:=true;
		         covered2[B]:=covered2[B] + [Q];
		 if k = 1 
		    then 
			 begin 
			 techwrite[u,(b+f+3)]:=techwrite[u,(b+f+3)] + [q]; 
			 techwrite[u,(f+3)]:=techwrite[u,(f+3)] + [b]; 
			 end; 
		  end;

if (k=1) and (techwrite[u,(f+3)] <> []) 
 then
  begin
   techwrite[u,0]:=[3];
   techwrite[u,1]:=[w];
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
	
end; //type 2			
			


			break;
	     end
	   else
	    h[w]:=h[w] -1;
	
	
	if ((h[w] < 0) and (w >0)) or (w = size+1) 
      then
        begin	
dec(w);		//set the array size to w
setlength(h,w+1);
setlength(use,(w+1));
setlength(use2,(w+1));
setlength(TRC,(w+1)); 
setlength(rcd,W+1);

setlength(usenum,w+1);
setlength(celluse,w+1);

        end;
		
		
   until (w = 0) and (h[w] < 0)

 end;
chaindisplay(#22,u);
end; {n*a-ls n-RC }