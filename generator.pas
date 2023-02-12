function getcell(selected:numberset):integer; 
var 
q:integer; 
begin
randomize;
while selected <> [0..80] do  
   begin     
    repeat
       begin 	
       q:=random(81);
	   end;     
    until not (q in selected ) and (pm[q] <> []);     
      // write(q,': ');   
      // include(selected,q);
   getcell:=q;
    break; 
 end;    
end; 

function getnum(attused,attempt:nums):integer;
var
n:integer; 
begin
randomize;
while attused <> [1..9] do 
           begin		 
            repeat 
			 begin
			   n:=random(9)+1; 			   
			 end;
			until (n in attempt) and ([n] * attused = []);
               //include(attused,n);
               //write(n,' ');	
			   getnum:=n;
			   break; 
			end; // number used 

end; 

procedure placenum(xa,dig3:integer);
begin
	  
      S[xa]:=[dig3];
      include(nsector[Rx[xa]],dig3);
	  include(nsector[Cy[xa]+9],dig3);
	  include(nsector[Bxy[xa]+18],dig3);
      exclude(ocell,xa);
	  include(Acell,xa);
end;

procedure removenum(xa,dig3:integer);
begin
	  S[xa]:=[];
      exclude(nsector[Rx[xa]],dig3);
	  exclude(nsector[Cy[xa]+9],dig3);
	  exclude(nsector[Bxy[xa]+18],dig3);
      include(ocell,xa);
	  exclude(Acell,xa);
	  
end;

procedure generator;
type
hold= array of integer;
Solved2 = array of nums;
using = array of numberset; 

Var
q,n,k,g2,w,j,iter:integer;
used:using; 
selected:numberset; 
attempt: nums;
attused: nums; 

h:hold;
s2: solved2;

output: text;

begin

initiate; 
selected:=[]; 

 writexy(2,33,' generating a grid'); 
 gotoxy(2,60);
 randomize;
 
 w:=0; 
  
 repeat   
 
 sbrc; 

  //gets a cell   
 q:= getcell(selected); 	  
    include(selected,q); 
      
          attempt:=pm[q];
           attused:=[];	 		  
		   
		  n:=getnum(attused,attempt);
		    include(attused,n);            
			 
			 placenum(Q,n); 			 
		       wpm(1,0,0);	
	
	if w > 2 then Dlx; 
	  if zero = true 
	    then 
		 begin 
		  removenum(Q,n); 
		  wpm(1,0,0);
		 end;  	
		 
	 IF ZERO = FALSE THEN INC(W); 
	 
   until (unique2 = true); 
    
 wpm(1,0,0);	 

assign(output,'C:\sudoku\Generator\Generated.txt');
 append(output);
  writeln(output);
       for k:= 0 to 80 do
        if s[k] <> []
         then
           begin
             for G2:= 1 to 9 do
               if g2 in s[k]
                then
                 write(output,g2)
           end
        else
          write(output,'.');
       close(output);

end;