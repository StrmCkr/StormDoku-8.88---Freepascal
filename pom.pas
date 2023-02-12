// 46,656 potential  single digit grids.

procedure potential;
 
type
hold = array of integer;
base = array of numberset;
digit = array of numberset;


var
   w1,w2,w3:TWordSet;  

setstuff: array [digits] of Twordset; 
Cellsetstuff: array [ digits,cell] of twordset; 
 
locked:  array [digits] of numberset;
deleted:  array [digits] of numberset;

stuff: array [digits] of numberset;

alist:array[digits] of word; 

xn,w,p,n,n2,xn2,q,g,L,j,m,o,xn3,xn4,xn5:integer;
output: text;

step: base;
h: hold;
z:digit;

begin

for n:=1 to 9 do
 begin 
 setstuff[n]:= twordset.create;
   for q in digitcell[n] do      
    cellsetstuff[n,q]:=twordset.create; 	
end; 

  for n:= 1 to 9 do
    alist[n]:=0; 
	
for N:= 1 to 9 do
begin
locked[n]:=[];
deleted[n]:=[];
stuff[n]:= [];

for xn:= 0 to 80 do
 begin

  if s[xn] = [n]
   then
      locked[n]:= locked[n]+ [xn];

   if (s[xn] <> [n] ) and not( n in pm[xn])
    then
     deleted[n]:= deleted[n] + [xn];

  end;
 end;

{startin cell}

  {delete the exsiting output if you want to rebuild it unhash this section}
{assign(output,'C:\sudoku\pom\output.txt');
erase(output);
rewrite(output);
close(output);  }

assign(output,'c:\sudoku\pom\exclusions.txt');
erase(output);
rewrite(output);
close(output);


{smashes all prebuilt  txt files  of potential solutions for digits 1-9  }
 for n:= 1 to 9 do
  begin
    case n of
      1: assign(output,'C:\sudoku\pom\1.txt');
      2: assign(output,'C:\sudoku\pom\2.txt');
      3: assign(output,'C:\sudoku\pom\3.txt');
      4: assign(output,'C:\sudoku\pom\4.txt');
      5: assign(output,'C:\sudoku\pom\5.txt');
      6: assign(output,'C:\sudoku\pom\6.txt');
      7: assign(output,'C:\sudoku\pom\7.txt');
      8: assign(output,'C:\sudoku\pom\8.txt');
      9: assign(output,'C:\sudoku\pom\9.txt');
     end;

erase(output);
rewrite(output);
close(output);
end;

setlength(step,0);
setlength(z,0);
setlength(h,0);

 for xn:= 80 downto 72 do

  begin

  w:=0;    {step count}

  setlength(h,(w+1));  {set the array size to w}

  h[w]:=xn;        {starting point for first substep}

  setlength(step,(w+1));   {set the array size to w}

  step[w]:= [xn];  { keeps track of what cells are used at each step W }

  setlength(z,w+1);  {prevent occupy "new starting point" }

  z[w]:= peer[xn] + [xn]; {used cells  starting point}

   repeat

    for p:= h[w] downto (72-((w+1)*9)) do    {iteration of peers}

      if  p in ([0..80] - z[w] ) // added check used state
       then
         begin

          h[w]:=h[w]-1;    { advance the peer count for step w}

          inc(w);        {increase the step count}

          setlength(h,(w+1));
          setlength(step,(w+1));     {increse the array size  to w}

          step[w]:= step[w-1] + [p] ;   {set the step cell active for the newly created step w}

          h[w]:= 71 - ((w)*9) ;  {set the new step w as 71 potential choice cells}

          setlength(z,w+1);  { increase size to w}

          z[w]:= z[w-1] +  peer[p] + [p]; {used cells  new  point}

          break;

        end
       else
          h[w]:=h[w]-1;  {if the above is false then advance the peer number}


if w = 8
  then
   begin


{ generate the whole list to a specific file}
{assign(output,'C:\sudoku\pom\output.txt');
append(output);
for n in step[w] do
    write(output,n,' ');

    writeln(output);

    close(output); }

 for n:= 1 to 9 do
  begin
  
    case n of
      1: assign(output,'C:\sudoku\pom\1.txt');

      2: assign(output,'C:\sudoku\pom\2.txt');

      3:  assign(output,'C:\sudoku\pom\3.txt');

      4: assign(output,'C:\sudoku\pom\4.txt');

      5: assign(output,'C:\sudoku\pom\5.txt');

      6: assign(output,'C:\sudoku\pom\6.txt');

      7: assign(output,'C:\sudoku\pom\7.txt');

      8:  assign(output,'C:\sudoku\pom\8.txt');

      9:  assign(output,'C:\sudoku\pom\9.txt');
       end;

  if ( step[w]  * locked[n] = locked[n] )
  and ( step[w] * deleted[n] = [] )
   then
     begin
	 inc(alist[n]); 
       append(output);

       for q in (step[w] - locked[n])  do 
	     begin
          write(output, q,' ');
		  
		  include2(cellsetstuff[n,q],alist[n]);
		  include2(setstuff[n],alist[n]);
		  end; 

        writeln(output);
        close(output);

        stuff[n]:= stuff[n] + (step[w] - locked[n]);

     end;


end; { N choice}

 end;   {w=8}


    if ((h[w] < 0 )  and (w > 0 ))
      or (w=8)
      or ( ( [0..80] - z[w] = [] ) and (W < 8) and (w > 0) )
       or ( (h[w] < (72 - ( (w+1)*9) ) )  and (w > 0)  )

    {the following resets the step to the previous state}
     then
      repeat
      begin
       w:=(w-1);
       setlength(h,(w+1));
       h[w]:= h[w];
       setlength(step,(w+1));
       setlength(z,w+1);

        end;
       until   ( w = 0 ) or (h[w] > ((71 - (w+1)*9))  )

    until ((w = 0) and (h[w] < 0) ) or  ( ( w = 0) and (h[w] < (72 -( (w+1)*9) ) ) )
  
 end;
 {size printing of all sets} 
 for n:= 1 to 9 do
 begin
 gotoxy(2,60+n);
  write(n,':=  ',alist[n]);
  end; 
 
 {size 1} 
  for n:= 1 to 9 do
 if  (stuff[n] <> [])
 and (stuff[n] *  (digitcell[n]  -  (locked[n] + deleted[n]) ) = stuff[n])
 and (  ((digitcell[n]  -  (locked[n] + deleted[n]) ) - stuff[n])  <> [] )
  then
    begin
     assign(output,'C:\sudoku\pom\exclusions.txt');
     append(output);
        write(output,n, ' @: ');
			// cell has no templates out of all of them. 	
        for  xn  in  ((digitcell[n]  -  (locked[n] + deleted[n])) - stuff[n])do 
          begin
            write(output,xn,' ');
		    covered2[n]:=covered2[n]+[xn];
		    active:=true; 
		   end;
		   
		   //cell is exclusivly in all sets 
		  for xn in digitcell[n] do  
		   if equality(cellsetstuff[n,xn],setstuff[n])
           then  
              begin 
			     active:=true; 
                 covered[xn]:=covered[xn] + (pm[xn]-[n]);
				 write(output,'*',xn,'<>( ');
				for o in pm[xn]-[n] do 
				 write(output,o,' ');
				  write(output,') ')
                end;     				
		   
		   
           writeln(output);
           close(output);
		   
		   
     end; {size 1}
 
 {size 2} 
 for n in [1..9] do
    for xn in digitcell[n] do 
	   for xn2 in digitcell[n]*[(xn+1)..80] do    
	  begin 
       w1:=twordset.create; 
	   
       w1:= cellsetstuff[n,xn] + cellsetstuff[n,xn2];
 
         if  setstuff[n]<=w1 
           then 
		    begin			  
			  for q in [1..9]-[n] do
			   begin
                 for g in setstuff[q] do
                  if [xn,xn2] * digitcell[q] = [xn,xn2]
 				   then 				 
				    if (g in (cellsetstuff[q,xn]))
				     and (g in (cellsetstuff[q,xn2]))
				      then
  					  begin                      					  
                     	w2:=twordset.create; 
						
					   for L in digitcell[q] do 
					     if (g in cellsetstuff[q,l]) 
						   then
						     begin
						     exclude2(cellsetstuff[q,L],g);	
							 include2(w2,l);
							 end; 

  
	assign(output,'C:\sudoku\pom\exclusions.txt');
     append(output); 
	  write(output,'(',n,')',xn,',',xn2,':(');
	    for m in setstuff[n] do write(output,' ',m); write(output,' ) & '); 
         write(output,'(',q,')',xn,',',xn2,':('); 
           	for o in (setstuff[q]) do write(output,' ',o); write(output,' ) ');
              write(output,'RT: ', G,' @ Digit: ',q, ' =>> <> '); 
			  
			  exclude2(setstuff[q],g);			  
                     	 			   
						 for L in digitcell[q] do
						    begin 
							   {no templates left for cells}
                              w3:= setstuff[q] - cellsetstuff[q,l];                              
							   if equality(w3,cellsetstuff[q,l])
							      then 
								    begin
								      write(output,L,' ');
									  active:=true; 
									  covered2[q]:=covered2[q] + [L];
									  end;
								{digits are locked to all sets} 	  
								if equality(cellsetstuff[q,l],setstuff[q])
                                   then  
                                     begin 
									 active:=true; 
                                      covered[l]:=covered[l] + (pm[l]-[q]);
									  write(output,'*',L,'<>( ');
									   for o in pm[l]-[q] do 
									     write(output,o,' ');
										 write(output,') ')
                                     end;     									  
							 end;
							
							
							 
		  writeln(output);
           close(output);	
		   
		   include2(setstuff[q],g);
		   for L in w2 do 
     		   begin
				include2(cellsetstuff[q,L],g);	
			   end; 
		   w2.free;
                         break;						

					  end; 					    
					end; 					  
                 end;
				 w1.free; 
				 
            end; 	{size 2} 		  


end;
