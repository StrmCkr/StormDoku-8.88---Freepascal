procedure Wwing(K:integer); {rebuilt to issolate N}
var 
xn,xn2,xn3,xn4,n,u,a,b,g,h,i:integer;
used:numberset; 
begin
//u:=0; 
links;
if k=1 then begin  u:=0; setlength(techwrite,u+1,27); end;

for g in [1..9] do 
for xn:= low(linkset[g][0]) to high(linkset[g][0]) do   
   {basic code} 
   for h in linkset[g,0,xn,7] do  
    for a in [1..5] do
     for xn2:= low(linkset[h][a]) to high(linkset[h][a]) do          
		   if (linkset[g][0,xn,3] = linkset[h][a,xn2,0]	)
		  and ( (linkset[g][0,xn,5] * linkset[h][a,xn2,4] )<> [])
		   and ( (linkset[g][0,xn,2] * linkset[h][a,xn2,1])  = [])
		   and ( (linkset[g][0,xn,2] * linkset[h][a,xn2,2])  = []) {cant have cells from the first spot}
		  then		  
		   for xn3:= low(linkset[h][0]) to high(linkset[h][0]) do 		     
		     if  (linkset[h][a,xn2,3] = linkset[h][0,xn3,0]) 
			  and (linkset[g][0,xn,0] = linkset[h][0,xn3,3])
			   and (linkset[h][a,xn2,3] = linkset[h][0,xn3,0])
			  and ( linkset[h][a,xn2,5] * linkset[h][0,xn3,4] <> [] )
			  and ( (linkset[h][a,xn2,2] * linkset[h][0,xn3,1])  = [])
			  and ( (linkset[h][a,xn2,1] * linkset[h][0,xn3,1])  = []){cant have cells from the previous link}
			              
            then		  
             begin
			 
			    if  (linkset[g][0,xn,8] * linkset[h][0,xn3,8] <> [] )
				then 
				 begin {eliminations} 
                    active:= true;
					
					 For n in (linkset[g][0,xn,0] * linkset[h][0,xn3,3])  do
                        begin 					 
					  covered2[n]:=covered2[n]  + (linkset[g][0,xn,8] * linkset[h][0,xn3,9]);
                          if k = 1 
                            then 
                              techwrite[u,n+13]:=techwrite[u,n+13] + (linkset[g][0,xn,8] * linkset[h][0,xn3,9]);							
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
	
	techwrite[u,10]:=linkset[h,0][xn3][0];
	techwrite[u,11]:=linkset[h,0][xn3][1];
	techwrite[u,12]:=linkset[h,0][xn3][2];
	techwrite[u,13]:=linkset[h,0][xn3][3];

	u:=u+1;
	setlength(techwrite,u+1,27);   
   
   end;		
					
		         end; 
				

    for b in [1..5] do	
		for xn4:= low(linkset[g][b]) to high(linkset[g][b]) do     	
          if   
          {first link of xn4 to xn3 cell}		  
		   (linkset[g][b,xn4,0]  = linkset[h][0,xn3,3] )  {have the same digit}
          and (linkset[g][b,xn4,4] * linkset[h][0,xn3,5]  <> [])   {be visible peers}
          and ((linkset[g][b,xn4,1] + linkset[g][b,xn4,2] )  *	(linkset[h][0,xn3,1]+linkset[h][0,xn3,2])  = []	)  {no overlaping cells}
		  {2nd link of xn4 to xn cell}	
		  and (linkset[g][b,xn4,3]  = linkset[g][0,xn,0] )
		  and (linkset[g][b,xn4,5] * linkset[g][0,xn,4] <> [])
		 and ((linkset[g][b,xn4,1] + linkset[g][b,xn4,2] )  *	(linkset[g][0,xn,1]+linkset[g][0,xn,2])  = []	)
		  		  
		      then
 			  begin
							
			  active:= true;			 
			  used:= ( linkset[g][0,xn,1]+linkset[g][0,xn,2] 
			         + linkset[h][a,xn2,1]+linkset[h][a,xn2,2] 
					 +  linkset[h][0,xn3,1]+linkset[h][0,xn3,2]
 					 +  linkset[g][b,xn4,1]+linkset[g][b,xn4,2] );
			       
				   //basic
					 For n in (linkset[g][0,xn,3] * linkset[h][0,xn3,0])  do
					  begin 
					  covered2[n]:=covered2[n]  +( (linkset[g][0,xn,8] * linkset[h][0,xn3,9]) );
					   if k= 1
					      then 
						  techwrite[u,n+17]:=techwrite[u,n+17] +( (linkset[g][0,xn,8] * linkset[h][0,xn3,9]) );
						  
					  end; 
					
                    // ring  					
					  for n in linkset[g][0,xn,3] * linkset[h][a,xn2,0] do
					   begin 
					  covered2[n]:= covered2[n] + ( (linkset[g][0,xn,9] * linkset[h][a,xn2,8])-used ); 
					    if k= 1
					      then 
						  techwrite[u,n+17]:=techwrite[u,n+17] +( (linkset[g][0,xn,9] * linkset[h][a,xn2,8])-used );
						  
					  end; 
					  
					  for n in linkset[h][a,xn2,3] * linkset[h][0,xn3,0] do
					   begin 
					  covered2[n]:= covered2[n] + ( (linkset[h][a,xn2,9] * linkset[h][0,xn3,8])-used); 
					   if k= 1
					      then 
						  techwrite[u,n+17]:=techwrite[u,n+17] +( (linkset[h][a,xn2,9] * linkset[h][0,xn3,8])-used); 
					   end; 
					  
					  for n in linkset[h][0,xn3,3] * linkset[g][b,xn4,0] do
					   begin 
					  covered2[n]:= covered2[n] + ( (linkset[h][0,xn3,9] * linkset[g][b,xn4,8])-used);
					   if k= 1
					      then 
						  techwrite[u,n+17]:=techwrite[u,n+17] +( (linkset[h][0,xn3,9] * linkset[g][b,xn4,8])-used);
					   end; 
					  
					   for n in linkset[g][b,xn4,3] * linkset[g][0,xn,0] do
					    begin 
					  covered2[n]:= covered2[n] + ( (linkset[g][b,xn4,9] * linkset[g][0,xn,8])-used);
					   if k= 1
					      then 
						  techwrite[u,n+17]:=techwrite[u,n+17] + ( (linkset[g][b,xn4,9] * linkset[g][0,xn,8])-used);
	
	                   end; 
if (k = 1) and (techwrite[u,1+17]+ (techwrite[u,2+17])+ (techwrite[u,3+17] )
+ (techwrite[u,4+17] ) + (techwrite[u,5+17])+ (techwrite[u,6+17] )
+ (techwrite[u,7+17] ) + (techwrite[u,8+17])+ (techwrite[u,9+17] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[14];
	
	techwrite[u,2]:=linkset[g,0][xn][0];
	techwrite[u,3]:=linkset[g,0][xn][1];
	techwrite[u,4]:=linkset[g,0][xn][2];
	techwrite[u,5]:=linkset[g,0][xn][3];
	
	techwrite[u,6]:=linkset[h,a][xn2][0];
	techwrite[u,7]:=linkset[h,a][xn2][1];
	techwrite[u,8]:=linkset[h,a][xn2][2];
	techwrite[u,9]:=linkset[h,a][xn2][3];
	
	techwrite[u,10]:=linkset[h,0][xn3][0];
	techwrite[u,11]:=linkset[h,0][xn3][1];
	techwrite[u,12]:=linkset[h,0][xn3][2];
	techwrite[u,13]:=linkset[h,0][xn3][3];
	
	techwrite[u,14]:=linkset[g,b][xn4][0];
	techwrite[u,15]:=linkset[g,b][xn4][1];
	techwrite[u,16]:=linkset[g,b][xn4][2];
	techwrite[u,17]:=linkset[g,b][xn4][3];

	u:=u+1;
	setlength(techwrite,u+1,27);   
   
   end;						   
					   
					   
                  
				end; {ring finder} 
				
              end;
		  
  if k = 1 then chaindisplay(#133,u); 
 
end; {w-wing/rings} 