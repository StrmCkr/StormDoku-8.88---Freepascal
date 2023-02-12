{A.I.C w A.L.S }
procedure AICWaLS(K:integer);
type
xsets = array of array of numberset;
steps = array of array of numberset; 
used2 = array of numberset; 
hold = array of integer; 
acts = array of array of integer; 
acts2 = array of array of integer; 
var
h:hold; 
xset: xsets;
step:steps; 
use2: used2;
act: acts; 
act2: acts2; 
n,a,b,c,d,e,f,g,j,u,m,r,max:integer;

begin

alsfinder; 
links; 

setlength(xset,0,0);
if k = 1 then begin u:=0; setlength(techwrite,u+1,0); end; 
 b:=-1;
for n in[1..9] do
 for a in [0..5,7] do
    for c:=  low(linkset[n][a]) to high(linkset[n][a]) do
        begin
		 b:=b+1;
		 setlength(xset,b+1,12);
		 xset[b]:=linkset[n,a,c];		
		end;
		
//finds the arrays that are the same data points 

 max:= high(xset); 
 setlength(act2,0,0);
 setlength(act2,max+1);

for b:= 0 to max do 
begin 
 g:=0;
 setlength(act2[b],0);
for e:= 0 to max do
   begin   
 	           {same set} {reversed } 
if      (xset[b][0] = xset[e][0])    //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3])  //first and last are the same digit
	and ((xset[b][1] * xset[e][2]) = (xset[b][1] ) )// first cells match
	and ((xset[b][2] * xset[e][1]) = (xset[b][2] ) )// last cells match 
	
	     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 	
			
         {same set diffrent sector} 
{if      (xset[b][0] = xset[e][0])    //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3])  //first and last are the same digit
	and ((xset[b][1] * xset[e][1]) = (xset[b][1] ) )// first cells match
	and ((xset[b][2] * xset[e][2]) = (xset[b][2] ) )// last cells match 
	
	     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end;} 

         {same starting  digit diffrent starting cells 2nd cells cannot be reused.} 
if      (xset[b][0] = xset[e][0])    //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3])  //first and last are the same digit
	//and ((xset[b][1] * xset[e][1]) <> (xset[b][1] ) )// first cells match
	and (((xset[b][1] * xset[e][1]) <> [] )// first cells match	
	   or 
	   ((xset[b][2] * xset[e][2]) <> [] ))// last cells match 
	
	     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 	
			
 if  (xset[b][10] = xset[e][10])    //  first set is the same as 2nd set 
    and (xset[b][10] <> []) //  sets arent empty 
	and (xset[b][11] = xset[e][11])  //	digits are identical 
    	then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 
			
	 end; 
{
gotoxy(2,60);
 write(max,' ');
if b= 3 then begin 
write('Cells A: ');
for r in xset[b][1] do
write(' ',r);

writeln;
write('Cells B: ');
for r in xset[b][2] do
write(' ',r);

writeln; 
write('Digit A: ');
for r in xset[b][0] do
write(' ',r);

writeln; 
write('Digit b: ');
for r in xset[b][3] do
write(' ',r);

writeln; 
write(' shared with: ');
for r in act2[b] do
 write(r,' ');
 
 writeln;
delay(150);
	end;}
	
end;

 for a:= max downto 0  do  
     begin
   setlength(act,0,0);
   b:=0;  
   setlength(act,b+1,max+2); 
   act[b][a+1]:=a+1;   
  
   for R in act2[a] do
       begin          	   
		 act[b][R+1]:=R+1;			 
	end;   
		 
   setlength(use2,b+1);    
   use2[b]:= xset[a][2]+ xset[a][1] ; //used cells;
   setlength(h,b+1); 
   h[b]:=max;    
   setlength(step,b+1,12);
   step[b]:=xset[a];
	{gotoxy(2,60);
	write(max,' ',a,'  ');}
repeat
   for c:= h[b] downto 0 do          
     if (act[b][c+1] <> C+1 ) //array wasnt used befor 	
	and (step[b][5]  * xset[c][4] <> [])  // sectors must shared at the link 	
	and (
	(
	// C shares end digit with B,  
	// can be any strong link or a bivavle { this is stricktly non - overlappy}  
	(step[b][3] * xset[c][0] = xset[c][0])  // last digit of b is same as 1  of C	
	and (step[b][9] * xset[c][1]  = xset[c][1]) // first step of C must see last step of B
	and (xset[c][2] * step[b][1] = [] )  // step c cannot over lap B's end point. 
	)
	
	
or	 (
	// ( 3-1 | [1 -1 or 1-3 ] transfer digit when c is not a bivavle  	
	 (xset[c][0] = xset[c][3]) // same digit at link
and  (step[b][0] = step[b][3]) // same digit at link
// found an error fixing it
and  (xset[c][0] <> step[b][3]) //  b and c dont share a digit 
and (xset[c][6] * step[b][3] = step[b][3])   // checks the cells of B is able to transfer digits to C
and (step[b][7] * xset[c][0] = xset[c][0])   // checks the cells of C is able to transfer digits to B
and (xset[c][1] * step[b][2] = xset[c][1]) // the cells of C & B overlap.   
  )
	or (  
    // cell b is a bivavle then cell C <> be an overlapping bivavle and c is a  1-1 |1-3 link 
	 (step[b][1] = step[b][2] ) 	// one cell
and  (xset[c][2] <> xset[c][1] )   // cannot be a bivavle 
and (step[b][3] = xset[c][0] )  // cell must transfer digit to C 
and (xset[c][6] * step[b][3] = step[b][3])   // checks the cells of B is able to transfer digits to C
and (step[b][7] * xset[c][0] = xset[c][0])   // checks the cells of C is able to transfer digits to B
and (xset[c][1] * step[b][2] = xset[c][1])   // checks that c[1] cells are exclusivly in step[b]
and (xset[c][2] * step[b][1] = []) // checks that cells of c[2] are not in step b
)	
or (  
    // cell b is a 1-1|3-1 link then cell C can be a bivavle 
	 (step[b][1] <> step[b][2] ) 	// not a bivavle
and  (xset[c][2] = xset[c][1] )   // is a bivavle
and (step[b][3] = xset[c][0] )  // cell must transfer digit to C 
and (xset[c][6] * step[b][3] = step[b][3])   // checks the cells of B is able to transfer digits to C
and (step[b][7] * xset[c][0] = xset[c][0])   // checks the cells of C is able to transfer digits to B
and (xset[c][1] * step[b][2] = xset[c][1])   // checks that c[1] cells are exclusivly in step[b]
and (xset[c][2] * step[b][1] = []) // checks that cells of c[2] are not in step b
)	
 )
	 then
	  begin
	   {h[b]:=h[b] - 1;}
	   b:=b+1; 	  
	   setlength(act,b+1);
       act[b]:=act[b-1]; 
       act[b][c+1]:=C+1;	   
      
     for R in act2[c] do
       begin 	     
		 act[b][R+1]:=R+1;		 
		end; 
 	
	   setlength(h,b+1);
	   setlength(use2,b+1);    
       use2[b]:= use2[b-1]+xset[c][1]+xset[c][2] ; 	   
	   h[b]:=max;
	      setlength(step,b+1,12);
		  step[b]:=xset[c]; 
		  
  {  gotoxy(2,61);
	
	write(B,': ( ');
	if b > 2 then 
	for r:= 0 to b do  
	begin 
	  	  
	 for n in step[r][0] do 
       write(n,')');
	   
	 for n in step[r][1] do 
       write(n,' '); 
	   write(' = ');
	   
	   for n in step[r][2] do 
       write(n,' ');  
	   write(' ( ');	   
	   for n in step[r][3] do 
       write(n, ' ) - ');
	   
	   writeln;
	   delay(1500);
	   end; }
	

    	  {break;}  

	if k = 1 
		  then  
           begin 		  
	       m:=((b+1)*4);
		   setlength(techwrite[u],0); 
		   setlength(techwrite[u],m+13); 
		   end;
 
{end points visible to each other same digits} 	 
if (b > 0) and (xset[a][0] = xset[c,3])
 and (xset[c][5] * xset[a][4] = [])and (((xset[a][8]*xset[c][9]) -(use2[b])) <> [])//normal 
 then
    begin
	 active:=true; 
 
	 for n in (xset[a][0] + xset[c,3] )  do 
	   begin 
       	  covered2[n]:=covered2[n] + ((xset[a][8]*xset[c][9]) -(use2[b])); 
		  if k = 1 then 
		   techwrite[u,n+m+3]:=techwrite[u,n+m+3] + (digitcell[n] *((xset[a][8]*xset[c][9]) -(use2[b])));
		 end;  

{chain loop? }	
			 
   end; 

{end points visible to each other diffrent digits} 
if (b > 0) and (xset[a][0] <> xset[c,3]) {and (xset[c][5] * xset[a][4] <> [])}
 and (xset[c][9] * xset[a][1] = xset[a][1])  
and ( xset[c][2] * xset[a][1] =[])//and dont use the same cells at start and end
  then 
     begin	 
	 active:=true; 
  
      for n in xset[a][0] do 
	   if N in xset[C][7]  then 
	    begin
	    covered2[n]:=covered2[n] + (xset[c][2]);
		
		if k = 1 then techwrite[u,n+m+3]:=techwrite[u,n+m+3]  + (digitcell[n]*(xset[c][2]));
		
		end; 
		 
      for n in xset[c][3] do 
	  if n in xset[a][6] then 
	   begin 
	    covered2[n]:=covered2[n] + (xset[a][1]);
		
		if k = 1 then techwrite[u,n+m+3]:=techwrite[u,n+m+3] + (digitcell[n]*(xset[a][1]));
		
       end; 	
 
 {chain walk to see if 2 points are the same digits}

	 end;  
 
 
 //end points overlap = loop    
if (b > 0) //bi local over lap specifically 
and (((xset[a][0] <> xset[c,3]) and (xset[c][5] * xset[a][4] <> [])
and ( xset[c][2] = xset[a][1])  and (xset[c][7] * xset[a][6] <> [0]))
// bivalve intial digit is seen by the end point 
or ((xset[a][0] = xset[c][3]) and (xset[c][5] * xset[a][4] <> [])
and (xset[c][2] * xset[a][1] = [])) )

 then 
   begin   	
	
	 for e:= (0) to (b-1) do
		 for d:= e+1 to (b) do 
	     begin
		  active:=true; 
		  
		  //overlapping weaklinks are locked                           //below verifies the the step befor can be overlaped by next digit
		 	 if (step[e][2] * step[d][1] = step[e][2]) and (step[e][3] * step[d][6] <> [])
              then 	
			   for n in step[e][2]*step[d][1] do
			    begin 
                covered[n]:= covered[n] +( pm[n]-(step[e][3]+step[d][0]));
				
				if k = 1 then 
				 begin 	
				  for r in (pm[n]-(step[e][3]+step[d][0])) do 
				       techwrite[u,r+m+3]:=techwrite[u,r+m+3]+[n];
					end;    
				end; 
				
			if (step[e][1] * step[d][2] = step[e][1]) and (step[e][0] * step[d][7] <> [])
              then 	
			   for n in step[e][1]*step[d][2] do 
                begin 			   
                covered[n]:= covered[n] +( pm[n]-(step[e][0]+step[d][3]));	
				
				if k = 1 then 
				 begin 	
				  for r in (pm[n]-(step[e][0]+step[d][3])) do 
				       techwrite[u,r+m+3]:=techwrite[u,r+m+3]+[n]; 
		
				end;
			
				end; 
			
//peers of weaklinks are removed if they share the same digit. 			
             if step[d][0] = step[e][3] 
               then 
			    for n in step[d][0] do 
				begin 
                covered2[n]:=covered2[n] + ((step[d][8] * step[e][9]) - use2[b]);
				
				if k = 1 then techwrite[u,n+m+3]:=techwrite[u,n+m+3] + (digitcell[n]*((step[d][8] * step[e][9]) - use2[b]));
				end; 
			 end; 
 end; 
  
 if (k = 1) and (techwrite[u,1+m+3]+ (techwrite[u,2+m+3])+ (techwrite[u,3+m+3] )
+ (techwrite[u,4+m+3] ) + (techwrite[u,5+m+3])+ (techwrite[u,6+m+3] )
+ (techwrite[u,7+m+3] ) + (techwrite[u,8+m+3])+ (techwrite[u,9+m+3] ) <> [])
and (b > 0)

 then  
   begin
   	techwrite[u,0]:=[4];
	techwrite[u,1]:=[b];
	
for e:= 0 to b do 
 begin 
 
  if step[e,10] = [] 
   then 
     begin  
  techwrite[u,(e*4)+2]:=step[e,0]; 
  techwrite[u,(e*4)+3]:=step[e,1];
  techwrite[u,(e*4)+4]:=step[e,2]; 
  techwrite[u,(e*4)+5]:=step[e,3];	
      end; 
 
   if step[e,10] <> [] 
   then 
     begin  
  techwrite[u,(e*4)+2]:=step[e,0]; 
  techwrite[u,(e*4)+3]:=step[e,1];
  techwrite[u,(e*4)+4]:=step[e,10];
  techwrite[u,(e*4)+5]:=(step[e,11]-step[e,0]);	
      end;
  
  
end;

if  u = 32767  
 then 
   begin
   chaindisplay(#13,u);
   
   setlength(techwrite,0,0);    
   u:=0; 
   end;  
   
	u:=u+1;	
	 setlength(techwrite,u+1);
	 setlength(techwrite[u],m+13);	 
 
   end;  

		{ break;} 
	  end
	 
	   
	  else
	   h[b]:= h[b] - 1;   
	   
if (h[b] < 0) and (b > 0)  
 then 
  begin
  b:=b-1;   	
	   setlength(use2,b+1);
       setlength(h,b+1);
	   setlength(step,b+1,12);
	   setlength(act,b+1);
	  { h[b]:=h[b]-1;} 
  end;  
  
until (h[b] < a) and (b = 0)	  
	  	  
   end; 
   if k = 1 then chaindisplay(#13,u); 
end; {A.I.C w als}