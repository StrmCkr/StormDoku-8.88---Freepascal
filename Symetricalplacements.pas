procedure Symetricalplacements(m:char);
     {symetrical placement sequence of morphs(none,12,23,12,23,12)}
const
s1: array [0..5] of integer = (0,49,50,49,50,49); 

var
a,b,c,d,e,f,g,h,i,xn,yn,n,n2:integer;
check:boolean;
 
S7:  array [cell] of nums;  {solved grid copy}
s4:  array [cell] of nums; {temp copy} 

 begin
 yn:=0; 
   
  for xn:= 0 to 80 do
   s7[xn]:=s[xn];
  
  issomorph2(#100,chr(50),chr(54)); {tanspose} 
  
 for a:= 0 to 1 do 
  begin 
  
  if a > 0 then
       issomorph2(#116,chr(s1[a]),chr(s1[a]+1)); {tanspose} 
	  
  for b:= 0 to 5 do  
   begin 
     if b > 0 then 
        issomorph2(#115,chr(s1[b]),chr(s1[b]+1)); {stack} 
 	
   for c:= 0 to 5 do
    begin 
     if c > 0 then 
        issomorph2(#98,chr(s1[c]),chr(s1[c]+1)); {band} 
		
 for d:= 0 to 5 do 
	begin
	 if d > 0 then
	    issomorph2(#114,chr(s1[d]),chr(s1[d]+1)); {Row 123} 
	
 for e:= 0 to 5 do 
	begin
	 if e > 0 then
	    issomorph2(#114,chr(s1[e]+3),chr(s1[e]+4)); {Row 456} 
		
   for f:= 0 to 5 do 
	begin
	 if f > 0 then
	    issomorph2(#114,chr(s1[f]+6),chr(s1[f]+7)); {Row 789 }
		
  for g:= 0 to 5 do 
	begin
	 if g > 0 then
	    issomorph2(#99,chr(s1[g]),chr(s1[g]+1)); {col 123 }
	
 for h:= 0 to 5 do 
	begin
	 if h > 0 then
	    issomorph2(#99,chr(s1[h]+3),chr(s1[h]+4)); {col 456 }
		
  for i:= 0 to 5 do 
	begin
	 if i > 0 then
	    issomorph2(#99,chr(s1[i]+6),chr(s1[i]+7)); {col 789 }
		
case m of 	// individuals	
#10: if ((g+h+i) = 0) then FixedBoxes;
#6: if (b = 0) then  BoxesMnBands;
#16: if((b+c) = 0)then boxesMTri;
#21: if (a = 0) then rotsym;
#18: if (a = 0) then diasym;
 #5: if (b+(g+h+i)= 0) then sticks; 
 end; 

 if m = #42 {looks for all of them} 
  then 
   begin   
 if ((g+h+i) = 0) then FixedBoxes; 
 if (b = 0) then BoxesMnBands;
 if ((b+c) = 0) then boxesMTri;
 if (a = 0) then rotsym;
 if (a = 0) then diasym;
 if (b+(g+h+i)= 0) then  sticks; 
  end; 
  
 { this next section checks for auto-morphs need to issolate to its own code}

if m = #35  // finds the automorphs. 
  then 
  begin 
  
 for xn:=0 to 80 do 
  s4[xn]:=s[xn]; 
     
  for xn:= 0 to 80 do 
	  for  n in s[xn] do
  		for n2 in s7[xn] do		     
	        issomorph2(#100,chr(48+n),chr(48+n2));	   
  
 check:= True;
 
for xn:= 0 to 80 do
 begin
  if  ((s7[xn] = []) and (S[xn] <> []) )
  or  ((s7[xn] <> []) and(S[xn] = []))
  or  (s[xn] <> s7[xn]) 
   then
    Check:=false;

    if check = false then break;	 
	
	if xn = 80
 	then
	begin
	  inc(yn);
	   gotoxy(2,66+yn); 
       write('automorph (',yn,'): ',a,',',b,',',c,',',d,',',e,',',f,',',g,',',h,',',i);
	   sbrc;
	   wpm(1,0,0);
	 //  delay(150);
	end; 
	
   end; 
  
  for xn:= 0 to 80 do 
	  for  n in s[xn] do
  		for n2 in s4[xn] do		     
	        issomorph2(#100,chr(48+n),chr(48+n2));	
			
  end; 
  
   gotoxy(2,63); 
       write(a,',',b,',',c,',',d,',',e,',',f,',',g,',',h,',',i);
	   
 if i = 5 then 
 issomorph2(#99,chr(50+6),chr(50+7)); {col 789 }
 end;
 
 if h = 5 then 
 issomorph2(#99,chr(50+3),chr(50+4)); {col 456 }
 end;
 
 if g = 5 then  
 issomorph2(#99,chr(50),chr(50+1));   {col 123 }
 end;
 
 if f = 5 then 
  issomorph2(#114,chr(50+6),chr(50+7)); {Row 789 }
 end;
 
 if e = 5 then 
 issomorph2(#114,chr(50+3),chr(50+4)); {Row 456 }
 end;
 
 if d = 5 then 
 issomorph2(#114,chr(50),chr(50+1)); {Row 123 }
 end;
 
 if c = 5 then 
 issomorph2(#98,chr(50),chr(50+1)); {band} 
 end;
 
 if b = 5 then 
 issomorph2(#115,chr(50),chr(50+1)); {stack} 
 end;
 {a}
 if a = 1 then 
 issomorph2(#116,chr(49),chr(49+1)); {issomorph} 
 end;
     
 wpm(1,0,0);  
end; 