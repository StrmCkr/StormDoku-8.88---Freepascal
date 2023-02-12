{local 2 wing }
Procedure L2wing(K:integer);
var
xn,a,xn2,b,xn3,c,n,u,g,h:integer;
begin
links;
if k = 1 then begin u:=0; setlength(techwrite,u+1,23);  end;

for g in [1..9] do 
for a in[1,3] do
 for xn:= low(linkset[g][a]) to high(linkset[g][a]) do  
 for h in (linkset[g,a,xn,7]) do  
 for b in[1,2] do 
    for xn2:= low(linkset[h][b]) to high(linkset[h][b]) do	
		if (linkset[h,b,xn2,6] * linkset[g,a,xn,7] <> [] )   { cell can overlap}
		and (linkset[h,b,xn2,4] * linkset[g,a,xn,5] <> [] )  { a & b share sector }
        and (linkset[h,b,xn2,1] = linkset[g,a,xn,2] )		{a end, b start share exact cell}
        and (linkset[h,b,xn2,2] * linkset[g,a,xn,1] = [] ) // a & b cant be duplicates 		
	  then 
       for c in [1,2,3,5] do 
		 for xn3:=low(linkset[h][c]) to high(linkset[h][c]) do 
		  if (linkset[h,c,xn3,4] * linkset[h,b,xn2,5] <> []) { end and start share sectors} 
		  and ((linkset[h,c,xn3,1] + linkset[h,c,xn3,2])*(linkset[h,b,xn2,1] + linkset[h,b,xn2,2]) =[]){cant contain a duplicate} 
		  and ((linkset[h,c,xn3,1] + linkset[h,c,xn3,2])*(linkset[g,a,xn,1] + linkset[g,a,xn,2]) =[]){cant contain a duplicate} 
		  and ((linkset[h,c,xn3,5] * linkset[g,a,xn,4] <> []) {share  a sector}
		    {or (linkset[h,c,xn3,9] * linkset[g,a,xn,8] <> [])})  {eliminations are common} // probably removable
			   {end point of c and start of a must share sector} 	
                  then 
			
				   begin
                							
				active:=true; 	
				
			   if h in linkset[g][a,xn,6] 
			    then 
				 for n in linkset[h][c,xn3,3] do
				   begin 
				   covered2[n]:=covered2[n] + (linkset[g][a,xn,1] ); 
				   if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[g][a,xn,1] );
				   end;
				   
			 if g in linkset[h][c,xn3,7] 
			   then 
				 for n in linkset[g][a,xn,0] do
				  begin 
				   covered2[n]:=covered2[n] + (linkset[h][c,xn3,2] ) ;  				   	
                   if k = 1 then techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[h][c,xn3,2] );
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
	
	techwrite[u,6]:=linkset[h,b][xn2][0];
	techwrite[u,7]:=linkset[h,b][xn2][1];
	techwrite[u,8]:=linkset[h,b][xn2][2];
	techwrite[u,9]:=linkset[h,b][xn2][3];
	
	techwrite[u,10]:=linkset[h,c][xn3][0];
	techwrite[u,11]:=linkset[h,c][xn3][1];
	techwrite[u,12]:=linkset[h,c][xn3][2];
	techwrite[u,13]:=linkset[h,c][xn3][3];	

	u:=u+1;
	setlength(techwrite,u+1,23);   
   
   end;
	
	
				   end; 

if k = 1 then chaindisplay(#136,u);

end;{local 2 wing}