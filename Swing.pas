{split wing}
Procedure Swing(K:integer);
var
xn,a,xn2,b,xn3,n,u,g,h:integer;
begin
links; 
if k = 1 then begin  u:=0; setlength(techwrite,u+1,23)	end; 

for g in [1..9] do 
for a in [1..2] do
 for xn:= low(linkset[g][a]) to high(linkset[g][a]) do  
 
    for xn2:= low(linkset[g][0] )to high(linkset[g][0]) do 
      if  (linkset[g][0,xn2,4] * linkset[g][a,xn,5] <> []) 
	  and (linkset[g][0,xn2,1] * linkset[g][a,xn,2] = []) 
	  and (linkset[g][0,xn2,1] * linkset[g][a,xn,1] = [])    
       then 
	    for h in linkset[g,0,xn2,7] do 
		 for b in[1..5] do
		  for xn3:= low(linkset[h][b] ) to high(linkset[h][b]) do           		  
			 if ( linkset[h][b,xn3,4] * linkset[g][0,xn2,5] <> []) 
			 and (linkset[h][b,xn3,5] * linkset[g][a,xn,4] <> [])
			 and (linkset[g][a,xn,1] * linkset[h][b,xn3,2] = []) 
			 and (linkset[h][b,xn3,2] * linkset[g][0,xn2,2] = [])			 
			 and (linkset[h][b,xn3,1] * linkset[g][0,xn2,2] = [])
			 			 			 
			 then 
			  begin 	
			  
			   active:=true; 			   
			   if h in linkset[g][a,xn,6] 
			    then 
				 for n in linkset[h][b,xn3,3] do
				  begin 
				   covered2[n]:=covered2[n] + (linkset[g][a,xn,1] ); 
				   
				   if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[g][a,xn,1] );
				   end;
				   
			 if g in linkset[h][b,xn3,7] 
			   then 
				 for n in linkset[g][a,xn,0] do
				   begin 
				   covered2[n]:=covered2[n] + (linkset[h][b,xn3,2] ) ; 
				   
                      if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[h][b,xn3,2] ) ;
				    end;    
					
if (k = 1) and (techwrite[u,1+13]+ (techwrite[u,2+13])+ (techwrite[u,3+13] )
+ (techwrite[u,4+13] ) + (techwrite[u,5+13])+ (techwrite[u,6+13] )
+ (techwrite[u,7+13] ) + (techwrite[u,8+13])+ (techwrite[u,9+13] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[10];
	
	techwrite[u,2]:=linkset[g,a][xn][0];
	techwrite[u,3]:=linkset[g,a][xn][1];
	techwrite[u,4]:=linkset[g,a][xn][2];
	techwrite[u,5]:=linkset[g,a][xn][3];
	
	techwrite[u,6]:=linkset[g,0][xn2][0];
	techwrite[u,7]:=linkset[g,0][xn2][1];
	techwrite[u,8]:=linkset[g,0][xn2][2];
	techwrite[u,9]:=linkset[g,0][xn2][3];
	
	techwrite[u,10]:=linkset[h,b][xn3][0];
	techwrite[u,11]:=linkset[h,b][xn3][1];
	techwrite[u,12]:=linkset[h,b][xn3][2];
	techwrite[u,13]:=linkset[h,b][xn3][3];	

	u:=u+1;
	setlength(techwrite,u+1,23);   
   
   end;				  
				  
			  end;
              
if k= 1 then chaindisplay(#134,u);
end; 