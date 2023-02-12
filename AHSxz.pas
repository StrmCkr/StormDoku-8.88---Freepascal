{almost hidden set xz } //updated 
procedure ahsxz(k:integer);  {so far this is 100,000% faster}
var
q,xn,xn2,n,z,x,r,u,alsa,alsB,act3,u2,count,count2:integer;

a3,b2,b3,z1,lxl,yn2,yn4,b:numberset;

a2,yn,yn3,g,v:nums; 

begin
//alsfinder;
  ahsfinder;
if k=0 then begin  u:=0; setlength(techwrite,u+1,17); end;

 for alsA:= low(ahs) to (high(ahs)-1) do {als A}
   if (ahs[alsA,1]+1 = ahs[alsA,2]) {digit = cell +1}
   
  // and (sectorrcb[ahs[alsa,0],ahs[alsa,4]] = [0,6,7,8])
  // and (comboset[ahs[alsA,3]] = [1,2,3])
     then
       for ALSB:= alsa+1 to high(ahs)  do {Als B}        
          if (ahs[alsb,1]+1 = ahs[alsb,2] ) {cell = digit +1}
		 
		//  and (sectorrcb[ahs[alsb,0],ahs[alsb,4]] = [60,61,69,79,80])
		 // and  (comboset[ahs[alsb,3]] = [1,2,3])
           
			 then
			   begin			   

			    xn:=ahs[alsa,0]; {sector a}
			    xn2:=ahs[alsb,0]; {sector b}

				yn:=comboset[ahs[alsA,3]]; {digits a}
				yn3:=comboset[ahs[alsB,3]]; {digits b}
				
				yn2:=sectorrcb[xn,ahs[alsa,4]]; {cells a}
				yn4:=sectorrcb[xn2,ahs[alsb,4]]; {cells b}
				
				a2:=yn*yn3;// identifies  shared Digits 
				z1:=yn2*yn4; // overlapping cells 
								
				lxl:=[]; // shared cells with shared digits {z}			
				
				a3:=[]; //  shared cell with no shared digits {x}
				
				b2:=[]; // cells of a that have no other digits
				b3:=[]; // cells of b that have no other digits    
                g:=[];  // stores temp digit for checking; 
				v:=[];  // sector digits locking.
				
				if (z1 <> []) and (a2 <> [] ) 
				  then 
				    for n in a2 do 
					  lxl:=lxl + (Digitcell[n]* z1); 
				       a3:=z1 - lxl;  
					 
	count:=0;  
   for n in a3 do
     inc(count);
	 
	// type 2 stuff 
	if  (a3 = []) and (lxl = [])
	then
	 begin			
		
			for n in yn2 do {cycles the cells of yn2}
			   begin 
                g:= (pm[n] * yn);   {down scales it to digits of yn}			   
                
				if popcnt(dword(g)) = 1
  				 then 
				for x in a2 do  {checks mutal digits of a&b}
				  if g *[x] = [x] { checks that g contains that value}
                  then 
                     b2:=b2+[n]; {stores said cells}				  
                end; 
				
			 g:=[];  // stores temp digit for checking;	
		  for n in yn4 do {cycles the cells of b}
			   begin 
                g:= (pm[n] * yn3);   {down scales it to digits of b}	
				
                if popcnt(dword(g)) = 1 // checks the pm's is only 1 digit.
				 then 
				for x in a2 do  {checks mutal digits of a&b}
				  if g*[x] = [x] { checks that g contains that value}
                  then 
                     b3:=b3+[n]; {stores said cells}				  
                end; 
				
	     v:=[]; // stores the digits locked to a sector 
		 for n in a2 do 
		 if (digitcell[n]* b2 <> [])  // both a & b must contain values of mutal digits)
		 and (digitcell[n] * b3 <> [])
		  then 
		   begin
		    b:=[0..26];
			
			for q in  (digitcell[n] *(b2+b3)) do 
		     b:= b * cellsec[q];
			 
			 count2:= 0;			 
              for q in b do 
                inc(count2);	
			  
			 if count2 >= 1 then 
			   v:=v+[n];
              end; 			 
		  
		end; 	
{gotoxy(2,60); 
	   
write('set a: ');	   
 for n in yn do 
 write(n, ' '); 
 write('@ ');
for n in yn2 do 
  write(n, ' '); 
  
gotoxy(2,61); 
write('set B: ');	   
 for n in yn3 do 
 write(n, ' '); 
 write('@ ');
for n in yn4 do 
  write(n, ' ');
  
gotoxy(2,62); 
write('overlapping cells: ');  
  for n in z1 do 
    write(n,' '); 	
	
gotoxy(2,63);
write(' x:');
  for n in a3 do 
    write(n,' '); 
	
gotoxy(2,64);
write(' z:');
  for n in lxl do 
    write(n,' '); 
	
gotoxy(2,65);
write(' b2:');
  for n in b2 do 
    write(n,' '); 

gotoxy(2,66);
write(' b3:');
  for n in b3 do 
    write(n,' '); 	

gotoxy(2,67);
write(' v:');
  for n in v do 
    write(n,' '); }
	
	//delay(1500);
	{basic elimination}  {lxl is restricted to only using digits from both sets}
	 if ((a3 <> []) and (lxl <> []))  	
	      then 
		     begin 
			                             			  
			  for n in [1..9] -(yn+yn3) do
			    begin 
				active:=true; 
			      covered2[n]:=covered2[n] + (digitcell[n] *(lxl));
				  
                  if k= 0 
                    then 
                  techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n]*(lxl));
				end;					
		end; 
			
				
	{double linked} 	
         if  (count > 1 ) // type 1
 		  or (popcnt(dword(v)) > 1)// type2 
		    then
              begin 			
			 // writexy(2,65,'double linked'); 
			  
			{all non rcc are locked to a}  
			  for n in [1..9] - yn do
			   begin 
			     active:= true; 
			    covered2[n]:= covered2[n] + (digitcell[n]*(yn2-(a3+b2))); 
			     if k= 0 
                    then 
                        techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n]*(yn2-(a3+b2)));
				 end;
			{all non rcc are locked to b} 	 
			  for n in [1..9] - yn3 do
			   begin 
			     active:= true; 
			    covered2[n]:= covered2[n] + (digitcell[n]*(yn4-(a3+b3))); 
			     if k= 0 
                    then 
                        techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n]*(yn4-(a3+b3)));
				 end;	
				 
			{RCC can only hold digits from both sets} 	 
			for n in [1..9] - (yn3+yn) do
			   begin 
			     active:= true; 
			    covered2[n]:= covered2[n] + (digitcell[n]*(a3)); 
			     if k= 0 
                    then 
                        techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n]*(a3));
				 end;
				
       {sector based RCC cells can only hold the digit thats restricted}           
       if (popcnt(dword(v)) > 1)// type2
	    then 
		 for n in v do 
           begin
             for q in digitcell[n] do 
			  if ((peer[q]*(digitcell[n]*(b2+b3)) ) = (digitcell[n]*(b2+b3))) 
                and ((digitcell[n]*(b2+b3)) <> [])                			
                   then
				    begin
					active:=true; 
					  covered2[n]:= covered2[n] + [q];	
					  
					if k= 0 
                    then 
                        techwrite[u,n+7]:=techwrite[u,n+7] + [q];
					end; 
				    
          end;		   
						
			  end; 
			  
if (k= 0)
and ((techwrite[u,1+7]+ techwrite[u,2+7] + techwrite[u,3+7] 
+techwrite[u,4+7]+techwrite[u,5+7]+techwrite[u,6+7]
+techwrite[u,7+7]+techwrite[u,8+7]+techwrite[u,9+7]) <> [])
then 
begin
techwrite[u,0]:=[6];
techwrite[u,1]:=[4];
techwrite[u,2]:=yn2;
techwrite[u,3]:=yn;
techwrite[u,4]:=yn4;
techwrite[u,5]:=yn3;
techwrite[u,6]:=a3; 
techwrite[u,7]:=lxl;
if count >1 then techwrite[u,6]:= a3;
if popcnt(dword(v))>1 then techwrite[u,6]:= b2+b3;
 if popcnt(dword(v))>1 then techwrite[u,6]:= b2+b3; 

 inc(u); 
 setlength(techwrite,u+1,17);
 end;

end;
			
  	if k=0 then Chaindisplay(#104,u);//techdisplay(#104,u);	
	
end;{ahs-xz rule }	