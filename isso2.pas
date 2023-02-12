procedure issomorph2( K2,b2,f2:Char{b2,f2:char});
var
K:char;
xn,yn,xl,n,n2,b,f:integer;
S5: array [cell] of nums;  {solved grid copy}

c2: array [rcb] of numberset; {col}
r2: array [rcb] of numberset; {row}
d2: array [digits] of numberset; {digits}
temp: numberset; 
begin

 for xn in rcb do
   begin
    r2[xn]:=rcbnum[xn];
    c2[xn]:=rcbnum[xn+9];	
    d2[xn+1]:=[];    
   end;   
   
for xn:= 0 to 80 do
 begin
  for n in s[xn] do 
     include(d2[n],xn);	 
 s5[xn]:=S[xn]; 
 end;
 
initiate;
 
k:=k2;
b:=ord(b2)-49;
f:=ord(f2)-49;

case K of

{R} #114:
 begin
      temp:=r2[b];	  
      r2[b]:=r2[f];
      r2[f]:=temp; 	
 end;  
      {row}

{C} #99:
 begin
      temp:=c2[b];	  
      c2[b]:=c2[f];
      c2[f]:=temp;
 end; 
    {col}

{Band} #98:
 begin
for n:= 0 to 2 do
	 begin 	 
        temp:=r2[((b)*3)+n];	
		 r2[((b)*3)+n]:=r2[((f)*3)+n];
         r2[((f)*3)+n]:=temp; 
      end;
 end;  {Band}

{stack} #115:
 begin
    for n:= 0 to 2 do
	 begin 
        	temp:=c2[((b)*3)+n];	
		 c2[((b)*3)+n]:=c2[((f)*3)+n];
         c2[((f)*3)+n]:=temp; 
      end;
 end; {stack}

{Transpose} #116:
 begin
  if b = 0 
   then   
     for xn:= 0 to 8 do  
      begin
       temp:=r2[xn]; 
       R2[xn]:=C2[xn];
       c2[xn]:=temp;
      end; 
  if b = 1 then
   for xn:= 8 downto 0 do   
    begin
	 n:= (8-xn); 
     temp:=r2[xn]; 
	 r2[xn]:=c2[n]; 
	 c2[n]:=temp;  
    end;
 end; {Transpose}
 
  {Mirror} #109:  
 begin
 temp:=[]; 
  if b = 0 
  then
    begin  
   	 for xn:= 0 to 3 do       
    begin
	 n:=(8 - xn);
     temp:=R2[xn];    	 
	 R2[xn]:=R2[n]; 	
	 R2[n]:=temp;  
    end;
 end;
 
    if b = 1 
  then
    begin  
	  
   for xn:= 0 to 3 do       
    begin
	 n:=(8 - xn);
     temp:=C2[xn];    	 
	 C2[xn]:=C2[n]; 	
	 C2[n]:=temp;  
    end;
 end;	
	
 end; {Mirror}
 
 {Pivot/quater turn} #112:
 begin 
 
   if b = 0 {Left}
  then
    begin  
   	 for xn:= 0 to 8 do       
    begin
	n:=8-xn;
     R2[xn]:=rcbnum[n+9];  	
	 c2[xn]:=rcbnum[xn];
    end;	
 end; 
 
  if b = 1 {right}
  then
    begin  
   	 for xn:= 0 to 8 do       
    begin
	n:=8-xn;
     R2[xn]:=rcbnum[xn+9];  	
	 c2[xn]:=rcbnum[n];
    end;	
 end; 
 
 end;
 
{D} #100:
 begin
     temp:= d2[b+1];
     d2[b+1]:=d2[f+1];
     d2[f+1]:=temp; 
 end;

 end;{cases} 
 
//sets the grid up after changes
 for xn:= 0 to 8 do
  for yn:= 0 to 8 do 
    for n in (r2[xn] * c2[yn]) do 
	   for n2 in [1..9] do
           if n in d2[n2] then 
              s[rset[xn,yn]]:= [n2];
 
 
for xL:=0 to 80 do
 if s[xl] <> [] then
    begin
      nsector[Rx[xl]]:=nsector[rx[xl]] + s[xl];
      nsector[Cy[xl]+9]:=nsector[cy[xl]+9] + s[xl];
      nsector[bxy[xl]+18]:=nsector[Bxy[xl]+18] + s[xl];
	  
        exclude(ocell,xl);
		include(Acell,xl);		
     end;
	 
{sbrc;
errorcheck;
wpm(1,0,0);}
	 
 end;
 