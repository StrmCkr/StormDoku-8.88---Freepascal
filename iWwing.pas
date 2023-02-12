{invertered W-wing}  
procedure iWWing(K:integer);
var
G,a,xn,h,b,xn2,c,xn3,d,xn4,u,n,r:integer;
begin
  if k = 1 then begin u:=0; setlength(techwrite,u+1,30); end;
  
  For g in [1..9] do 
   for a in [1,3] do 
     for xn:= low(linkset[g][a]) to high(linkset[g][a]) do	  
	     
		 for h in (linkset[g][a][xn,7]) do
		  for b in [1,2] do 
		    for xn2:= low(linkset[h][b]) to high(linkset[h][b]) do
			  if (linkset[h][b][xn2,1] = linkset[g,a,xn,2]) 
			  and (linkset[h][b][xn2,4] * linkset[g,a,xn,5] <> []) 
			  and (linkset[h][b][xn2,2] * linkset[g,a,xn,1] = [])			  
			  
			   then 
			     for C in [1,3] do 
				   for xn3:=low(linkset[h][c]) to high(linkset[h][c]) do 
				    if ((C = b) and (xn3>xn2)) or (c>b)then 
					  
					   if (linkset[h,c,xn3,4] * linkset[h,b,xn2,5] <> []) 
					   and ((linkset[h,c,xn3,1]+linkset[h,c,xn3,2]) 
					      * (linkset[h,b,xn2,1]+linkset[h,b,xn2,2]) = [])
					     then
					for D in [1,2] do 
					    for xn4:= low(linkset[g][d]) to high(linkset[g][d]) do 
					      if ((d = a) and (xn4 > xn))then
                           if (linkset[h,c,xn3,2] = linkset[g,d,xn4,1]) 
						  and (linkset[h,c,xn3,5] * linkset[g,d,xn4,4] <> [])
						  and ((linkset[g,d,xn4,1]+linkset[g,d,xn4,2]) * (linkset[g,a,xn,1]+linkset[g,a,xn,2]) = [])
						  and ((linkset[g,d,xn4,2]) * (linkset[h,c,xn3,1]+linkset[h,c,xn3,2]) = [])
						  and ( (linkset[g,d,xn4,1] + linkset[g,d,xn4,2]) * (linkset[h,b,xn2,1]+linkset[h,b,xn2,2]) = []) 
					 
			  then
			  begin
			  
			  if (linkset[g,a,xn,8] * linkset[g,d,xn4,9]) <> []
			   then
   			    begin
			     active:=true;			      
			  
			       for n in (linkset[g,a,xn,0] * linkset[g,d,xn4,3]) do
				    begin 
			         covered2[n]:=covered2[n] + (linkset[g,a,xn,8] * linkset[g,d,xn4,9]) ;
					 if k = 1 
					   then 
					     techwrite[u,n+19]:=techwrite[u,n+19] + (linkset[g,a,xn,8] * linkset[g,d,xn4,9]) ;
						end;  
			      end; 
				 
			if (linkset[g,d,xn4,5] * linkset[g,a,xn,4] <> []) then
			   begin
			    active:=true; 		       			   
                   				
				for n in (linkset[h,b,xn2,3] * linkset[h,c,xn3,0]) do 
				 begin 
				 covered2[n]:=covered2[n]  + (linkset[h,b,xn2,9] * linkset[h,c,xn3,8]);
				 if k = 1 
					   then 
					     techwrite[u,n+19]:=techwrite[u,n+19] +  (linkset[h,b,xn2,9] * linkset[h,c,xn3,8]);
						end; 
				 
				 for n in (linkset[h,b,xn2,1] * linkset[g,a,xn,2]) do 
				  begin 
				    covered[n]:=covered[n] + (pm[n] - [g,h]);
					if k = 1 then 
					for r in (pm[n] - [g,h]) do
					  techwrite[u,r+19]:=techwrite[u,r+19] + [n];
					end; 
				
				 for n in (linkset[h,c,xn3,2] + linkset[g,d,xn4,1]) do 
				  begin 
				   covered[n]:= covered[n] + (pm[n] - [g,h]);
				   if k = 1 then 
					for r in (pm[n] - [g,h]) do
					  techwrite[u,r+19]:=techwrite[u,r+19] + [n];
					end; 
				 
			    end; 
if (k = 1) and (techwrite[u,1+19]+ (techwrite[u,2+19])+ (techwrite[u,3+19] )
+ (techwrite[u,4+19] ) + (techwrite[u,5+19])+ (techwrite[u,6+19] )
+ (techwrite[u,7+19] ) + (techwrite[u,8+19])+ (techwrite[u,9+19] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[16];
	
	techwrite[u,2]:=linkset[g,a][xn][0];
	techwrite[u,3]:=linkset[g,a][xn][1];
	techwrite[u,4]:=linkset[g,a][xn][2];
	techwrite[u,5]:=linkset[g,a][xn][3];
	
	techwrite[u,6]:=linkset[h,b][xn2][0];
	techwrite[u,7]:=linkset[h,b][xn2][1];
	techwrite[u,8]:=linkset[h,b][xn2][2];
	techwrite[u,9]:=linkset[h,b][xn2][3];
	
	techwrite[u,10]:=linkset[h,c][xn3][0];
	techwrite[u,11]:=linkset[h,c][xn3][1];
	techwrite[u,12]:=linkset[h,c][xn3][2];
	techwrite[u,13]:=linkset[h,c][xn3][3];
	
	techwrite[u,14]:=linkset[g,d][xn4][0];
	techwrite[u,15]:=linkset[g,d][xn4][1];
	techwrite[u,16]:=linkset[g,d][xn4][2];
	techwrite[u,17]:=linkset[g,d][xn4][3];
	

	u:=u+1;
	setlength(techwrite,u+1,30);   
   
   end;				
				
				
				 
			  end; 	
  
  
  if k = 1 then chaindisplay(#137,u);
end; {inverted w-wing}
  