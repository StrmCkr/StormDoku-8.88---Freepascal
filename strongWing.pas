Procedure StrongWing(K:integer);{strong wing/rings} 
var
xn,xn2,xn3,xn4,c,n,u,g,h,i,j,r:integer;
begin
links; 
   if k = 1 then begin u:=0; setlength(techwrite,u+1,27);  end;
   
 for g in [1..9] do 
 for xn:= low(linkset[g][1]) to high(linkset[g][1]) do   
   for h in linkset[g,1,xn,7]-[g] do
    for xn2:= low(linkset[h][1]) to high(linkset[h][1]) do	
     if (linkset[g][1,xn,2] = linkset[h][1,xn2,1] )
	  and (linkset[g][1,xn,5] * linkset[h][1,xn2,4] <> []) 
	  and(linkset[g][1,xn,1] * linkset[h][1,xn2,1] = [])
	  and (linkset[g][1,xn,1] * linkset[h][1,xn2,2] = [])   
	   then 
	     for I in (linkset[h,1,xn2,7] -[g,h]) do         
		  for xn3:=low(linkset[i][1]) to high(linkset[i][1]) do 		   
	   
			 if (linkset[i][1,xn3,1] = linkset[h][1,xn2,2]) 
				 and (linkset[i][1,xn3,4] * linkset[h][1,xn2,5] <> [])
                 and (linkset[i][1,xn3,5] * linkset[g][1,xn,4] <> []) 
				 
				 and (linkset[i][1,xn3,2] * linkset[h][1,xn2,2] = []) 
				 
				 and (linkset[i][1,xn3,2] * linkset[g][1,xn,1] = [])
                 and (linkset[i][1,xn3,2] * linkset[g][1,xn,2] = []) 
				 
				 and (linkset[i][1,xn3,1] * linkset[g][1,xn,1] = [])
                 and (linkset[i][1,xn3,1] * linkset[g][1,xn,2] = []) 
				 				 				 
                  then 
			       for j in (linkset[i][1,xn3,7]) do 
				    for xn4:=low(linkset[j][1]) to high(linkset[j][1]) do 
					 if (linkset[j,1,xn4,1] = linkset[i,1,xn3,2] )
					 and (linkset[j,1,xn4,2] = linkset[g,1,xn,1] ) 
					   then 		
			
				   begin                
				 				
				 if J = g  then
				    begin
					
                   active:= true; 
                      covered2[j]:= covered2[j] + linkset[g,1,xn,8]; 
					  
					  if k = 1 then 
					    techwrite[u,j+17]:=techwrite[u,j+17] + linkset[g,1,xn,8]; 
                      
                       for n in linkset[g,1,xn,1] do 
					      begin 
                          covered[n]:=covered[n] + (pm[n] - [j]);
                          if k = 1 then 
						     for r in pm[n] - [j] do
							  techwrite[u,j+17]:=techwrite[u,j+17] + [r]; 
						  end; 
         						  
			 		end;
					
					if j <> g then 
					    begin 						
						 active:= true;
						 
					for n in linkset[g,1,xn,1] do 
					      begin 
                          covered[n]:=covered[n] + (pm[n] - [j,g]); 
						   if k = 1 then 
						     for r in pm[n] - [j,g] do
							  techwrite[u,j+17]:=techwrite[u,j+17] + [r]; 
						  end; 
						  
						  
					for n in linkset[h,1,xn2,1] do 
					      begin 
                          covered[n]:=covered[n] + (pm[n] - [g,h]); 
						   if k = 1 then 
						     for r in pm[n] - [g,h] do
							  techwrite[u,j+17]:=techwrite[u,j+17] + [r]; 
						  end; 
						  
						  
					for n in linkset[i,1,xn3,1] do 
					    begin 
                          covered[n]:=covered[n] + (pm[n] - [i,h]);	
						   if k = 1 then 
						     for r in pm[n] - [i,h] do
							  techwrite[u,j+17]:=techwrite[u,j+17] + [r]; 
						  end; 
						  
					for n in linkset[j,1,xn4,1] do 
					   begin 
                          covered[n]:=covered[n] + (pm[n] - [i,j]);
						   if k = 1 then 
						     for r in pm[n] - [i,j] do
							  techwrite[u,j+17]:=techwrite[u,j+17] + [r]; 
						  end; 
						  
					    end; 
if (k = 1) and (techwrite[u,1+17]+ (techwrite[u,2+17])+ (techwrite[u,3+17] )
+ (techwrite[u,4+17] ) + (techwrite[u,5+17])+ (techwrite[u,6+17] )
+ (techwrite[u,7+17] ) + (techwrite[u,8+17])+ (techwrite[u,9+17] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[14];
	
	techwrite[u,2]:=linkset[g,1][xn][0];
	techwrite[u,3]:=linkset[g,1][xn][1];
	techwrite[u,4]:=linkset[g,1][xn][2];
	techwrite[u,5]:=linkset[g,1][xn][3];
	
	techwrite[u,6]:=linkset[h,1][xn2][0];
	techwrite[u,7]:=linkset[h,1][xn2][1];
	techwrite[u,8]:=linkset[h,1][xn2][2];
	techwrite[u,9]:=linkset[h,1][xn2][3];
	
	techwrite[u,10]:=linkset[i,1][xn3][0];
	techwrite[u,11]:=linkset[i,1][xn3][1];
	techwrite[u,12]:=linkset[i,1][xn3][2];
	techwrite[u,13]:=linkset[i,1][xn3][3];

	techwrite[u,14]:=linkset[j,1][xn4][0];
	techwrite[u,15]:=linkset[j,1][xn4][1];
	techwrite[u,16]:=linkset[j,1][xn4][2];
	techwrite[u,17]:=linkset[j,1][xn4][3];	

	u:=u+1;
	setlength(techwrite,u+1,27);   
   
   end;						
						
				   end;   
if k = 1 then chaindisplay(#94,u);
  end;{strong wing}