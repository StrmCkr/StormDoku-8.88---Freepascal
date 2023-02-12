{local 3 wing also known as a hybrid 1 wing}
Procedure L3wing(K:integer);
var
xn,xn2,xn3,c,n,u,g,h,i:integer;
begin
links;
if k = 1 then begin u:=0; setlength(techwrite,u+1,23);  end;

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
         for c in [1..2] do 
		  for xn3:=low(linkset[i][c]) to high(linkset[i][c]) do 		   
	   
			 if (linkset[i][c,xn3,1] = linkset[h][1,xn2,2]) 
				 and (linkset[i][c,xn3,4] * linkset[h][1,xn2,5] <> [])
                 and (linkset[i][c,xn3,5] * linkset[g][1,xn,4] <> []) 
				 
				 and (linkset[i][c,xn3,2] * linkset[h][1,xn2,2] = []) 
				 
				 and (linkset[i][c,xn3,2] * linkset[g][1,xn,1] = [])
                 and (linkset[i][c,xn3,2] * linkset[g][1,xn,2] = []) 
				 
				 and (linkset[i][c,xn3,1] * linkset[g][1,xn,1] = [])
                 and (linkset[i][c,xn3,1] * linkset[g][1,xn,2] = []) 
				 				 				 
                  then 
			
				   begin                
					
				active:=true; 			   
			   if i in linkset[g][1,xn,6] 
			    then 
				 for n in linkset[i][c,xn3,3] do
				 begin 
				   covered2[n]:=covered2[n] + (linkset[g][1,xn,1] ); 
				   if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] +(linkset[g][1,xn,1] );
				   end; 
				   
			 if g in linkset[i][c,xn3,7] 
			   then 
				 for n in linkset[g][1,xn,0] do
				  begin 
				   covered2[n]:=covered2[n] + (linkset[i][c,xn3,2] ) ;
                  if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] +(linkset[i][c,xn3,2] ) ;
				  end;
				   
				   		
if (k = 1) and (techwrite[u,1+13]+ (techwrite[u,2+13])+ (techwrite[u,3+13] )
+ (techwrite[u,4+13] ) + (techwrite[u,5+13])+ (techwrite[u,6+13] )
+ (techwrite[u,7+13] ) + (techwrite[u,8+13])+ (techwrite[u,9+13] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[10];
	
	techwrite[u,2]:=linkset[g,1][xn][0];
	techwrite[u,3]:=linkset[g,1][xn][1];
	techwrite[u,4]:=linkset[g,1][xn][2];
	techwrite[u,5]:=linkset[g,1][xn][3];
	
	techwrite[u,6]:=linkset[h,1][xn2][0];
	techwrite[u,7]:=linkset[h,1][xn2][1];
	techwrite[u,8]:=linkset[h,1][xn2][2];
	techwrite[u,9]:=linkset[h,1][xn2][3];
	
	techwrite[u,10]:=linkset[i,c][xn3][0];
	techwrite[u,11]:=linkset[i,c][xn3][1];
	techwrite[u,12]:=linkset[i,c][xn3][2];
	techwrite[u,13]:=linkset[i,c][xn3][3];	

	u:=u+1;
	setlength(techwrite,u+1,23);   
   
   end;

						
				   end; 

if k = 1 then chaindisplay(#138,u);

end;{local 3 wing}