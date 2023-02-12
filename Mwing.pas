procedure Mwing(k:integer);
var
xn,xn2,xn3,a,b,u,n,g,h,r:integer; 
begin
links; 
if k = 1 then begin  u:=0; setlength(techwrite,u+1,23)	end; 	

for g in [1..9] do 
for xn:= low(linkset[g][0]) to high(linkset[g][0] ) do
  for h in linkset[g][0,xn,7] do 
   for a in [1,2,3] do 
    for xn2:= low(linkset[h][a]) to high(linkset[h][a]) do 
	
    if  (linkset[h][a,xn2,1] * linkset[g][0,xn,2] = []) 
	and (linkset[g][0,xn,3] * linkset[h][a,xn2,0] <> [])    
	and (linkset[h][a,xn2,4] * linkset[g][0,xn,5] <> [])	
	and (linkset[h][a,xn2,2] * linkset[g][0,xn,2] = []) { linking 2nd cells cant land on the first cell} 
	  then 
		 for b in [1,2,3] do
		   for xn3:= low(linkset[g][b]) to high(linkset[g][b]) do 
		    
		       if (linkset[g][b,xn3,1] = linkset[h][a,xn2,2] )			   
			    and (linkset[g][b,xn3,2] * linkset[g][0,xn,1] = []) 
				and (linkset[g][b,xn3,6] <> [0] )  // links must be linkable
			  then
			   begin
			  	   
			    if  (linkset[g][0,xn,8] * linkset[g][b,xn3,8] <> [] )
				 then 
				  begin 
				  active:=true;	
				  
			        For n in (linkset[g][0,xn,0] * linkset[g][b,xn3,3])  do	
                         begin 					
				      covered2[n]:=covered2[n]  + (linkset[g][0,xn,8] * linkset[g][b,xn3,9]);
					if k = 1 then   techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[g][0,xn,8] * linkset[g][b,xn3,9]);
	                     end; 				 
				
				if (linkset[g][0,xn,4] * linkset[g][b,xn3,5] <> [])
                  then
                    begin       					
						active:=true; 
						
						for n in (linkset[g][0,xn,3] * linkset[h][a,xn2,0]) do
						   begin 
						  covered2[n]:=covered2[n] + (linkset[g][0,xn,9] * linkset[h][a,xn2,8]); 
						  if k = 1 then   techwrite[u,n+13]:=techwrite[u,n+13]  + (linkset[g][0,xn,9] * linkset[h][a,xn2,8]);
						   end; 
						
                        for n in (linkset[h][a,xn2,2] * linkset[g][b,xn3,1]) do 
						  begin 
                         covered[n]:= covered[n] + (pm[n] - (linkset[h][a,xn2,3] + linkset[g][b,xn3,0]) );
                          if k = 1 then 
						   begin
						    for r in (pm[n] - (linkset[h][a,xn2,3] + linkset[g][b,xn3,0]) ) do
							  techwrite[u,r+13]:=techwrite[u,r+13] + [N]; 
						    end; 
						 end; 
						 
						  
					end; 	
                  					
				end;

if (k = 1) and (techwrite[u,1+13]+ (techwrite[u,2+13])+ (techwrite[u,3+13] )
+ (techwrite[u,4+13] ) + (techwrite[u,5+13])+ (techwrite[u,6+13] )
+ (techwrite[u,7+13] ) + (techwrite[u,8+13])+ (techwrite[u,9+13] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[10];
	
	techwrite[u,2]:=linkset[g,0][xn][0];
	techwrite[u,3]:=linkset[g,0][xn][1];
	techwrite[u,4]:=linkset[g,0][xn][2];
	techwrite[u,5]:=linkset[g,0][xn][3];
	
	techwrite[u,6]:=linkset[h,a][xn2][0];
	techwrite[u,7]:=linkset[h,a][xn2][1];
	techwrite[u,8]:=linkset[h,a][xn2][2];
	techwrite[u,9]:=linkset[h,a][xn2][3];
	
	techwrite[u,10]:=linkset[g,b][xn3][0];
	techwrite[u,11]:=linkset[g,b][xn3][1];
	techwrite[u,12]:=linkset[g,b][xn3][2];
	techwrite[u,13]:=linkset[g,b][xn3][3];	

	u:=u+1;
	setlength(techwrite,u+1,23);   
   
   end;  
			  end; 
			  
			
	if k = 1 then chaindisplay(#135,u);	 
end; 