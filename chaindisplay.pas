procedure ElimDisplay(n,g,h:integer);
var
p,a,xw,yw,I:integer;
begin
    for p in [1..9] do 
	  if techwrite[n,p+h+3] <> []
	    then
		  for a in techwrite[n,p+h+3] do
		   begin 
		   xw:= ( (Cy[a])+1) * 12 - 9 ;
           yw:= up + 31 + ((Rx[a])+1)*2-2;
           
           gotoxy(xw,yw);
		   	
    if not (P in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + coveredact[a])//* covered[a] * pm[a]  ))
   and not (a in covered2act[p])
  and  (s[a]=[])
    then
	   begin 
	    textcolor(196);
  	   	gotoxy(xw+p-1,yw); 			
       write(p);
	   end    
	 end;  
	 
textcolor(col2);

end; 

procedure Colordisplay(n,g,h:integer);
var
a,xw,yw,I,p,f,w,m:integer; 
begin

if g= 0 // naked subsets
  then  
 for a in techwrite[n,3] do
  begin 
   xw:= ( (Cy[a])+1) * 12 - 9 ;
   yw:= up + 31 + ((Rx[a])+1)*2-2;

   textcolor(6);
   gotoxy(xw,yw);

 For I:= 1 to 9 do
    if not (I in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + coveredact[a])//* covered[a] * pm[a]  ))
   and not (a in covered2act[i])
  and  (s[a]=[])
    then
       write(I)
      else
       write(space); 
	   
end; // naked sets 	

if g = 1 then // hidden subset
    for a in techwrite[n,2] do
		 begin 
		 xw:= ( (Cy[a])+1) * 12 - 9 ;
         yw:= up + 31 + ((Rx[a])+1)*2-2;

         textcolor(6);
         
		 for p in techwrite[n,3] do
		   if not (p in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + covered[a])//* covered[a] * pm[a]  ))
   and not (a in covered2[p])
  and  (s[a]=[])
    then
	 begin 
	 gotoxy(xw+p-1,yw);
       write(p);
	   end;      
		
    end; // hidden sets 

if (g = 2) or (g = 7) // fish 
 then
  for I in techwrite[n,2] do   // digit  
	for p in techwrite[n,3] do //sector
      for a in DigitRCB[p,i] do // cells to lookup
       begin 
	   	 xw:= ( (Cy[a])+1) * 12 - 9 ;
         yw:= up + 31 + ((Rx[a])+1)*2-2;

         textcolor(6);
        
  if not (I in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + covered[a])//* covered[a] * pm[a]  ))
   and not (a in covered2[i])
  and  (s[a]=[])
    then
	 begin 
	 gotoxy(xw+I-1,yw);
       write(i);
	   end;     

  end;// fish


if g = 3 then //als types
 begin 
    w:=2;
	f:=0;
	
	  repeat 	  
	   begin 
	   for a in techwrite[n,w+1] do
		 begin
   xw:= ( (Cy[a])+1) * 12 - 9 ;
   yw:= up + 31 + ((Rx[a])+1)*2-2;

   textcolor(6);
   gotoxy(xw,yw);

 For I:= 1 to 9 do
    if not (I in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + coveredact[a])//* covered[a] * pm[a]  ))
   and not (a in covered2act[i])
  and  (s[a]=[])
    then
       write(I)
      else
       write(space); 
	   end;

		F:=F+1; 
		w:=w+2; 		
	 
 end; 	 
	 until w >=(3+h-2);
 end;// als  
 
 if g = 4  // chains
  then
    begin 		  
	w:=2;
	f:=0;
	m:=0;
	  repeat 	  
	   begin 
	   
	    for p in techwrite[n,w] do		 
		 for a in techwrite[n,w+1] do		 
		 begin 
		 xw:= ( (Cy[a])+1) * 12 - 9 ;
         yw:= up + 31 + ((Rx[a])+1)*2-2;

         textcolor(6);
		 
	if not (p in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + covered[a])//* covered[a] * pm[a]  ))
   and not (a in covered2[p])
  and  (s[a]=[])
    then
	 begin 
	 gotoxy(xw+p-1,yw);
       write(p);
	   end;   
end;		

	    for p in techwrite[n,w+3] do		 
		 for a in techwrite[n,w+2] do		 
		 begin 
		 xw:= ( (Cy[a])+1) * 12 - 9 ;
         yw:= up + 31 + ((Rx[a])+1)*2-2;

         textcolor(6);       
		 
	if not (p in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + covered[a])//* covered[a] * pm[a]  ))
   and not (a in covered2[p])
  and  (s[a]=[])
    then
	 begin 
	 gotoxy(xw+p-1,yw);
       write(p);
	   end;   
end;		

        m:=m+32;		
		w:=w+4; 		
		if m > 64 then begin  m:=0; f:=f+1;	end;
		
	end;	 
	 until w >(3+(h)-2);
	 
 
 end; // chains
 
 if g = 6  // ahs 
  then
    begin
    w:=2;
	f:=0;
	  repeat 	  
	   begin 
	    	 
	    for a in techwrite[n,w] do
		 for p in techwrite[n,w+1] do
		  begin
		  xw:= ( (Cy[a])+1) * 12 - 9 ;
          yw:= up + 31 + ((Rx[a])+1)*2-2;

         textcolor(6);
		 
	if not (p in  (nsector[rx[a]] + nsector[cy[a]+9] + nsector[bxy[a]+18]) + delpm[a] + Ipm[a] + covered[a])//* covered[a] * pm[a]  ))
   and not (a in covered2[p])
  and  (s[a]=[])
    then
	 begin 
	 gotoxy(xw+p-1,yw);
       write(p);
	   end;   
end;	  
		F:=F+1; 
		w:=w+2; 		
	 end	 
	 until w >=(3+h-2);
	 
 end; //ahs 
 
 
textcolor(col2);	
end;

procedure Chaindisplay(K:char;J:integer);
var
n,q,p,g,h,w,f,m:integer;
l:char;
begin
{for q:=0 to 66 do
For p:=0 to 23 do
 begin
gotoxy(118+q,35+p);
write(space);
end;}
techclear(0);

l:=K;
n:= 0;
gotoxy(117,35);
case k of 
 
#11,#13, 
#20,#22,#24,#25,#26,
#59,
#60,#61,#62,#63,#64,#66,#67,#68,#69,
#74,#78,
#84,#85,#86,#87,#88,
#92,#93,#94,#95,#97,
#100,#102,#104,#106,#109,#110,#111,
#120,#121,
#133,#134,#135,#136,#137,#138: begin
	   textcolor(10);
	   
	 	if l = #84 then writexy(118,35,'Naked Single');
		if l = #86 then writexy(118,35,'Naked Pair');
		if l = #87 then writexy(118,35,'Naked Tripple');
		if l = #88 then writexy(118,35,'Naked Quad');
		
		if l = #59 then writexy(118,35,'Hidden Single');
		if l = #61 then writexy(118,35,'Hidden Pair');
		if l = #62 then writexy(118,35,'Hidden Tripple');
		if l = #63 then writexy(118,35,'Hidden Quad');

		if l = #60 then writexy(118,35,'Box Line Reduction');
		if l = #85 then writexy(118,35,'X - Wing - Basic | Franken | Mutant');
		if l = #20 then writexy(118,35,'X - Wing   - Smashi | Finned');
		if l = #64 then writexy(118,35,'Skyscraper');
		if l = #66 then writexy(118,35,'2 - String Kyte');
		if l = #67 then writexy(118,35,'Swordfish - Basic');
		if l = #92 then writexy(118,35,'Swordfish  - Smashi | Finned');
		if l = #68 then writexy(118,35,'Jelly Fish - Basic');
		if l = #93 then writexy(118,35,'Jellyfish  - Smashi | Finned');
		
		if l = #102 then writexy(118,35,'Fish Finder: n x ( n + k )'); 
		
		if l = #97 then writexy(118,35,'Almost Locked Set - XZ');
		if l = #104 then writexy(118,35,'Almost Hidden Set - XZ');		
		if l = #121 then writexy(118,35,'Almost Locked Set - XY');
		if l = #25 then writexy(118,35,'Almost almost Locked Set - 2RC Rule');
		if l = #22 then writexy(118,35,'N^A.L.S - N^RC Rule');
		if l = #106 then writexy(118,35,'Distributed Disjointed Subsets');
		if l = #111 then writexy(118,35,'Almost Distributed Disjointed Subsets');
		
		if l = #100 then writexy(118,35,'Sue de Coq');
		if l = #69 then writexy(118,35,'Death Blossom');
		
		if l = #24 then writexy(118,35,'X - Chain');
		if l = #120 then writexy(118,35,'XY - Chain');
		if l = #26 then writexy(118,35,'Alternating Interface Chain');
		if l = #11 then writexy(118,35,'ALS - Chain');
		if l = #13 then writexy(118,35,'A.I.C + ALS - Chain');
		
		if l = #133 then writexy(118,35,'W - Wings | Rings');
		if l = #135 then writexy(118,35,'M - Wings | Rings');
		if l = #134 then writexy(118,35,'Split - Wing');
		if l = #136 then writexy(118,35,'Local Type 2 Wing');
		if l = #138 then writexy(118,35,'Local Type 3 Wing'); 
		if l = #94 then writexy(118,35,'Strong - Wings | Rings'); 
		
		if l = #95 then writexy(118,35,'Hybrid Type 1 - Wings'); 
		if l = #110 then writexy(118,35,'Hybrid Type 2 - Wings'); 
		if l = #78 then writexy(118,35,'Hybrid Type 3 - Wings');
		
		if l = #137 then writexy(118,35,'Inverted W Wings | Rings'); 
		
		if l = #109 then writexy(118,35,'Sk Loop'); 
		if l = #74 then writexy(118,35,'Multi Sector Locked Set'); 
		
       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);
          gotoxy(118,37);		  
G:=0; 
H:=0; 
F:=0; 

for q in techwrite[n,0] do 
      G:=q; 
	  
for q in techwrite[n,1] do 
      h:=q; 

if l in [#11,#13,#24,#26,#120]  
  then 	
   for q in techwrite[n,1] do 
      h:=(q+1)*4;  

if l in [#22]
  then 
   for q in techwrite[n,1] do 
      h:=(q+1)*2;  


if g = 0 then //naked subset 
    begin 
	textcolor(white);
		 gotoxy(118,37);
		 Write('Set ',char(ord(65+f)),' [ ');
		 textcolor(3);
		 
	    for q in techwrite[n,2] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(9);
		 for q in techwrite[n,3] do
		  write(q,' ');
		textcolor(white);
	 end;

if g = 1 then // hidden subset
    begin 
	textcolor(white);
		 gotoxy(118,37);
		 Write('Set [ ');
		 textcolor(9);
		 
	    for q in techwrite[n,2] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(3);
		 for q in techwrite[n,3] do
		  write(q,' ');
		textcolor(white);
	 end;
	 
if g = 2 then //fish
begin  
textcolor(white);
          gotoxy(118,37);
write('(');
          textcolor(3);
          for q in techwrite[n,2] do
           write(q);
           textcolor(white);
           write('): Base: ');

           textcolor(6);
           for  p in techwrite[n,3] do
             write(p,' ');

            textcolor(white);
             write('Cover: ');
             textcolor(6);
           for p in techwrite[n,4] do
           write(p,' ');
           textcolor(white);
	 end; 

if g = 3 then //als types
 begin 
    w:=2;
	f:=0;
	  repeat 	  
	   begin 
	    textcolor(white);
		 gotoxy(118,37+F);
		 Write('Set ',char(ord(65+f)),' [ ');
		 textcolor(3);
		 
	    for q in techwrite[n,w] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(9);
		 for q in techwrite[n,w+1] do
		  write(q,' ');
		textcolor(white);
		F:=F+1; 
		w:=w+2; 		
	 end	 
	 until w >=(3+h-2);
	 
	 gotoxy(118,37+f);
        Write('RC: ');textcolor(3);
		 for q in techwrite[n,3+h-1] do		
		 write(q,' '); textcolor(white);
		 Write('Z: '); textcolor(3);
		 for q in techwrite[n,3+h] do
		 write(q,' ');textcolor(white);

end;  

if g = 4  
  then
    begin 		  
	w:=2;
	f:=0;
	m:=0;
	  repeat 	  
	   begin 
	    textcolor(white);
		 gotoxy(118+m,37+f);
		 Write(' (');
		 textcolor(3);	 
	    for q in techwrite[n,w] do
		 write(q);
		 textcolor(white);
		 Write(') ');
		 textcolor(9);
		 for q in techwrite[n,w+1] do
		  write(q,' ');
		textcolor(white);
		 Write('= ');
		 textcolor(9);
		 for q in techwrite[n,w+2] do
		  write(q,' ');
		  textcolor(white);
		  Write('(');
		 textcolor(3);		 
	    for q in techwrite[n,w+3] do
		 write(q);
		 textcolor(white);
		 Write(')');	  
		
        m:=m+68;		
		w:=w+4; 
		if w <(3+(h)-2) then write(' - '); 
		if m > 70 then begin  m:=0; f:=f+1;end;		 
	 end	 
	 until w >(3+(h)-2);
	
	end; 

if g = 5 then //msls types
 begin 
	    textcolor(white);
		 gotoxy(118,37);
		 Write('Away Set [ ');
		 textcolor(3);
		 
	    for q in techwrite[n,2] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(6);
		 for q in techwrite[n,3] do
		  write(q,' ');
		textcolor(white);			
				
	    textcolor(white);
		 gotoxy(118,38);
		 Write('Home Set [ ');
		 textcolor(3);
		 
	    for q in techwrite[n,4] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(6);
		 for q in techwrite[n,5] do
		  write(q,' ');
		textcolor(white);
		
	 
	 gotoxy(118,39+f);
        Write('covers: ');textcolor(3);
		 for q in techwrite[n,6] do		
		 write(q,' '); textcolor(white);
		 Write('cells: '); textcolor(3);
		 for q in techwrite[n,7] do
		 write(q,' ');textcolor(white);
F:=F+3;
end; 

if g = 6  // ahs 
  then
    begin
    w:=2;
	f:=0;
	  repeat 	  
	   begin 
	    textcolor(white);
		 gotoxy(118,37+F);
		 Write('Set ',char(ord(65+f)),' [ ');
		 textcolor(9);
		 
	    for q in techwrite[n,w] do
		 write(q,' ');
		 textcolor(white);
		 write('] @ ');
		 textcolor(3);
		 for q in techwrite[n,w+1] do
		  write(q,' ');
		textcolor(white);
		F:=F+1; 
		w:=w+2; 		
	 end	 
	 until w >=(3+h-2);
	 gotoxy(118,37+f);
        Write('RC: ');textcolor(9);
		 for q in techwrite[n,3+h-1] do		
		 write(q,' '); textcolor(white);
		 Write('Z: '); textcolor(9);
		 for q in techwrite[n,3+h] do
		 write(q,' ');textcolor(white); 
    end; //ahs

if g = 7 then // nxn+kfish
begin  
textcolor(white);
          gotoxy(118,37);
write('(');
          textcolor(3);
          for q in techwrite[n,2] do
           write(q);
           textcolor(white);
           write('): Base: ');

           textcolor(6);
           for  p in techwrite[n,3] do
             write(p,' ');

            textcolor(white);
             write('Cover: ');
             textcolor(6);
           for p in techwrite[n,4] do
           write(p,' ');
		   
		    textcolor(white);
             write('Extra Covers: ');
             textcolor(6);
           for p in techwrite[n,5] do
           write(p,' ');
		   
           textcolor(white);
	 end; // nxn+k fish	
	 
	//elimimimination cells      
	 write(' =>> ');	
	
	 for p:= 1 to 9 do
		  if techwrite[n,p+h+3] <> [] then
		  begin
		  gotoxy(118,38+F+p);
		  textcolor(red);
		  for q in techwrite[n,p+h+3] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> '); textcolor(3);write(p);
		  textcolor(white);
		  end;
		  
	Colordisplay(n,g,h);	  
	ElimDisplay(n,g,h);
	
          gotoxy(118,39+f+9);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(1);
if (ch=#43) or (ch=#45 ) then wpm(1,0,0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;
            
          until (ch =#13)
	     end;

end;		  

end; 
textcolor(col2);
end; //chaindisplay		  