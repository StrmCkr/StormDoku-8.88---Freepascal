{XY chain}
procedure XYchain(K:integer);
type
xsets = array of array of numberset;
steps = array of array of numberset; 
stepper = array of integer;
used2 = array of numberset; 
hold = array of integer; 
acts = array of array of integer; 
acts2 = array of array of integer;
acts3 = array of array of integer; 
var
h:hold; 
xset: xsets;
step:steps; 
phase:stepper; 
use2: used2;
act: acts; 
act2: acts2; 
act3: acts3;
n,a,b,c,d,e,f,g,j,u,m,r,max:integer;
check: boolean; 
output: text;
begin

links; 

setlength(xset,0,0);
if k = 1 then begin u:=0; setlength(techwrite,u+1,0); end; 

 b:=-1;
for n in [1..9] do
 for a in [0..0] do
    for c:=  low(linkset[n][a]) to high(linkset[n][a]) do
        begin
		 b:=b+1;
		 setlength(xset,b+1,10);
		 xset[b]:=linkset[n,a,c];		
		end;
		
//finds the arrays that are the same data points 
//finds arrays that use a bivavle as on 
 max:= high(xset); 
 setlength(act2,0,0);
 setlength(act2,max+1);
 {writexy(2,60,'max: '); 
 write(high(linkset[1][5]));}
 
for b:= low(xset) to high(xset) do
begin 
 g:=0; 
  for e:= low(xset) to high(xset) do
   if e <> b then 
   begin   
 	       {same set} {reverse twin } 
if      (xset[b][0] = xset[e][0])  //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3]) // first and last are the same digit
	and (xset[e][0] =xset[e][3]) // first and last are the same
    and (xset[b][1] + xset[b][2] = xset[e][1] + xset[e][2])	// same cells but swapped position
	
	     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 
			
//same "on cell" position 2 set 1 and set2 postion 2 are the same on values
if      (xset[b][0] = xset[e][0])  //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3]) // first and last are the same digit
	and (xset[e][0] = xset[e][3]) // first and last are the same
    and (xset[b][2] * xset[e][2] <> []) // 2nd cell contains same "on cells"
		     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end;

//same "off cell" position 1 set 1 and set 2 postion 1 are the same on values
if      (xset[b][0] = xset[e][0])  //  first digit is the same 
    and (xset[b][3] = xset[e][3]) //  last digit is the same 
	and (xset[b][0] = xset[b][3]) // first and last are the same digit
	and (xset[e][0] = xset[e][3]) // first and last are the same
    and (xset[b][1] * xset[e][1] <> []) // 2nd cell contains same "on cells"
		     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end;

{find bivavle cell twins} 
if      (xset[b][0]+ xset[b][3] = xset[e][0] + xset[e][3])  //  digit set the same     
    and (xset[b][1] = xset[b][2])//uses 1 cell
	and (xset[e][1] = xset[e][2])//uses 1 cell
	
    and( xset[e][1] = xset[b][1]) // 1 cell in both sets
	and( xset[e][2] = xset[b][2])// 1 cell in both sets
		
	     then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 
		

// bivavle digit  is "on" postion linking  same digit sets cant reuse the ending cell.
  if (xset[b][1] = xset[b][2]) // first set uses 1 cell 
    and (xset[b][3] = xset[e][0]) // 2nd set starting digit uses exchange digit
    and (xset[e][0] = xset[e][3]) // 2nd is a single digit 
    and (xset[b][2] * xset[e][2] <> []) // cannot re use the "on" cell from a & b
    then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 
			
// first set is a bi-local  2nd set is a bivavle
  if (xset[e][1] = xset[e][2]) // 2nd set uses 1 cell 
    and (xset[b][3] = xset[e][0]) // 2nd set starting digit uses exchange digit
    and (xset[b][0] = xset[b][3]) // 1st is a single digit 
    and (xset[b][1] * xset[e][1] <> []) // cannot re use the "off" cell from 
    then 
		    begin 
			 setlength(act2[b],g+1);
		     act2[b][g]:=e; 
			 g:=g+1;
			end; 
 
end;	  
end;

assign(output,'C:\sudoku\twins.txt');
erase(output);
rewrite(output);
close(output);
 // sister tester print info to screen checks to see if the above works
{ gotoxy(2,60);
 write(max,' ');}
 For b:= low(xset) to high(xset) do  
 begin 
 append(output);
 writeln(output); 
 write(output,'set: ',B,' sister to:');
  for g:= low(act2[b]) to high(act2[b]) do  
    begin	 
	  write(output,act2[b][g],' ');
	 end; 
 close(output);	 
	end;

// weak-link builder
   
 setlength(act,0,0);
 setlength(act,max+1); //stores the weak-link visible to C
 
for B:= low(xset) to high(xset) do
 begin 
 g:=-1;
   For C:= low(xset) to high(xset) do
   if b <> c then 
    begin 
	 
	 check:=True; 
      for e:= low(act2[b]) to high(act2[b]) do  
	    if act2[b][e] = C 
		  then 
		    check:= false;			
	 if check  
      then        
		 begin	
		 
		 //same digit to same digit 
	    if    (xset[b][0]+xset[b][3] = xset[c][3]) // digit @ link is identical to first and last
		  and (xset[c][3] = xset[c][0]) // 2nd set same digit. 
		  and (xset[b][5] * xset[c][4] <> []) // shares a sector
		  and (xset[b][2] * xset[c][1] = []) // no overlapping cell	
          and (xset[b][9] * xset[c][1] = xset[c][1]) // all of c lands in the peer cells of b		  
		   then 
		     begin
		      g:=g+1;
		      setlength(act[b],g+1);
		      act[b][g]:= C; 
		     end;
			 
		 //digit exchange @ strong link
       if     (xset[b][3] <> xset[c][0]) // last and next digit are the diffrent 
         and  (xset[b][2] = xset[c][1]) // last cell and next cell are the same 
         and  (xset[b][7] * xset[c][0] = xset[c][0]) // overlap exchange is true
		 and  (xset[c][6] * xset[b][3] = xset[b][3]) // overlap exchange is true 
         and  (xset[b][5] * xset[c][4] <> []) // shares a sector 
         and  (xset[c][1] * xset[c][2] = []) // cant be a bivavle 		 
		  then
            begin
		      g:=g+1;
		      setlength(act[b],g+1);
		      act[b][g]:= C; 
		    end;
			
		 //digit exchange @ bivavle 
       if     (xset[b][3] = xset[c][0]) // last and next digit are the same 
	     and  (xset[c][0] <> xset[c][3]) // last and next digit in new link are diffrent     
         and  (xset[b][2] * xset[c][1] = []) // last cell and next cell arent the same           
         and  (xset[b][5] * xset[c][4] <> []) // shares a sector 
		 and (xset[b][9] * xset[c][1] = xset[c][1]) // all of c lands in the peer cells of b
         and  (xset[c][1] * xset[c][2] = xset[c][2]) // a bivavle 		 
		  then
            begin
		      g:=g+1;
		      setlength(act[b],g+1);
		      act[b][g]:= C; 
		    end;
			
				 //same digit to same digit 
	    if    (xset[b][0] <> xset[b][3]) // start is a bivavle 
		  and (xset[c][0] = xset[c][3]) // 2nd set same digit.
          and (xset[c][0] = xset[b][3]) // sees the same exchange 		  
		  and (xset[b][5] * xset[c][4] <> []) // shares a sector
		  and (xset[b][2] * xset[c][1] = []) // no overlapping cell	
          and (xset[b][9] * xset[c][1] = xset[c][1]) // all of c lands in the peer cells of b		  
		   then 
		     begin
		      g:=g+1;
		      setlength(act[b],g+1);
		      act[b][g]:= C; 
		     end;	
			 
         end; // end check 
    end;// end c cycle
end; // end B cycle 

assign(output,'C:\sudoku\Aic.txt');
erase(output);
rewrite(output);
close(output);
  
For b:= low(xset) to high(xset) do
 begin 
 append(output);
 writeln(output);	
 //gotoxy(2,61+b);
 write(output,'set: ',B,' weak-linked to: ');
  for g:= low(act[b]) to high(act[b]) do  
    begin	 
	  write(output,act[b][g],' ');
	 end;
	 close(output);
end;

assign(output,'C:\sudoku\Chain.txt');
erase(output);
rewrite(output);
close(output);

//chain walk
 For A:= low(xset) to high(xset) do
  If high(act[A])>-1 
    then 
	 begin 
	    setlength(act3,0,0);
        b:=0;  
	    setlength(act3,b+1,max+1); //sets step storing
		
		//for e:= 0 to max do 
		 act3[b][0]:=-1; // sets the first "0" as -1 to allow code to see it as off
		 
        act3[b][A]:=A;   // saves used nodes 
         
         for e:= low(act2[a]) to high(act2[A]) DO
          ACT3[B][act2[a,e]]:=act2[a,e]; 		 
		
		setlength(h,b+1); // sets first step {als links list to choose from}
     if High(act[a])>-1
       then	 
	    h[b]:=High(act[a]) //sets the link list node count 
		else 
		h[b]:= -1; 
		
		setlength(phase,b+1); // sets the first node
         phase[b]:=A;
		 
		 // notes
         // act2 = twins
		 // act = list of sets
		 // act 3 = working list in the chain walk
 
{append(output);
writeln(output); 
write(output,'start: ',A);
 write(output,'(',h[b],')');
 for e:= low(act3[b]) to high(act3[b]) DO
           write(output,act3[b][e]);}	 
 
		 while (h[b] > -1)  do 
		   begin		   
		     if (act[phase[b],h[b]] <> act3[b,act[phase[b],h[b]]])               			 
                 then  
                   begin                                   	
					
                     inc(b);
					 setlength(act3,b+1,max+1); //sets step storing 
					 act3[b]:=act3[b-1]; // copies the previous step
					  
					 setlength(phase,b+1); // sets the  node
                     phase[b]:=act[phase[b-1],h[b-1]];
					 
					 act3[b][phase[b]]:=phase[b];	
                    
					{append(output);
					write(output,' - ',phase[b]);} 
					
		if k = 1 
		  then  
           begin 		  
	       F:=((b+1)*4);
		   setlength(techwrite[u],0); 
		   setlength(techwrite[u],f+15); 
		   end;
					 
		for e:= low(act2[phase[b]]) to high(act2[phase[b]]) DO
          ACT3[B][act2[phase[b],e]]:=act2[phase[b],e]; 	
		  
		  setlength(h,b+1); // sets first step {als links list to choose from}
 
 if High(act[phase[b]])>-1 
         then
     		 h[b]:=High(act[phase[b]]) //sets the link list node count 
	     else 
             h[b]:=-1; 		 
		  
     // eliminations
	 
	 //start and end same digit & peers of each other 
	 if (xset[a][8] * xset[phase[b]][9] <> [])
	 and (xset[a][0] = xset[phase[b]][3]) 
	   then
	     begin 
		 for n in (xset[a][0] * xset[phase[b]][3]) do 
		  if (xset[a,8] * xset[phase[b],9]) <> []
		  then 
		   begin 
	         covered2[n]:=covered2[n] + (xset[a,8] * xset[phase[b],9]);
		       active:= true;
			   
			   if k = 1 
			     then 	
				techwrite[u][n+f+3]:=techwrite[u][n+f+3] +(xset[a,8] * xset[phase[b],9]); 
		       { append(output);
				 write(output,'[=> eliminates:',n,' @ ');
                  for e in (xset[a,8] * xset[phase[b],9]) do				   
                     write(output,e,' ');
                   write(output,']');}
			 end;	   
		  end; 	
	
	//  A) start and end diffrent digit	and visible to all copies of canddites used 
	
	 if (xset[phase[b]][3] * xset[a][6] = xset[phase[b]][3]) // is in the exchange cells
	 and (xset[phase[b]][9] * xset[a][1] = xset[a][1])// sees all the digits
	 and (xset[a][6] <> [0]) // is not a grouped digit !
	// and (xset[a][0] = xset[a][3])  { single digit}
	// and (xset[phase[b]][3] = xset[phase[b]][0]) {single digit}
	and (xset[a][0] <> xset[phase[b]][3]) // cannot be linked 
	and (xset[a][1] <> xset[phase[b]][2]) // cannot start and end same cells
	    then
		  begin
		    for n in (xset[phase[b]][3]) do 
			if (xset[a,1] * xset[phase[b],9]) <> []
			then 
			 begin 
	           covered2[n]:=covered2[n] + (xset[a,1] * xset[phase[b],9]);
		       active:= true;
			   if k = 1 
			    then					
				 techwrite[u][n+f+3]:=techwrite[u][n+f+3] +(xset[a,1] * xset[phase[b],9]);
		      {append(output);
				write(output,'[=> eliminates:',n,' @ ');
                  for e in (xset[a,1] * xset[phase[b],9]) do 
                     write(output,e,' ');
                     write(output,']');	}
			 end;		 
		  end;
		  
	//  B) start and end diffrent digit	and visible to all copies of canddites used 
	 if (xset[A][0] * xset[phase[b]][7] = xset[a][0]) // is in the exchange cells
	 and (xset[A][8] * xset[phase[b]][2] = xset[phase[b]][2])// sees all the digits
	 and (xset[phase[b]][7] <> [0]) // is not a grouped digit !
	// and (xset[a][0] = xset[a][3])  { single digit}
	 //and (xset[phase[b]][3] = xset[phase[b]][0]) {single digit}
	and (xset[a][0] <> xset[phase[b]][3]) // cannot be linked 
	and (xset[a][1] <> xset[phase[b]][2]) // cannot start and end same cells
	
	    then
		  begin
		    for n in (xset[A][0]) do
			 if (xset[phase[B],2] * xset[A,8]) <> []
			  then 
			   begin 
	             covered2[n]:=covered2[n] + (xset[phase[B],2] * xset[A,8]);
		          active:= true;
				  
				  if k  = 1
				    then 
					  techwrite[u][n+f+3]:=techwrite[u][n+f+3] +(xset[phase[B],2] * xset[A,8]);
		         { append(output);
				   write(output,'[=> eliminates:',n,' @ ');
                    for e in (xset[phase[B],2] * xset[A,8]) do 
                     write(output,e,' ');
                     write(output,']');}
				end; 	 
		  end; 		  
	 		 
	//loop end is a bivavle and start has its ending digit  
      if ((xset[a][0] = xset[phase[b]][3])
          and (xset[phase[b]][1] = xset[phase[b]][2]) //is a bivavle
          and (xset[phase[b]][9] * xset[a][1] = xset[a][1])) // all of b  sees  As cells
		  
	//loop start is a bivavle and end has its starting digit 	  
		or 
		  ((xset[a][0] = xset[phase[b]][3])
          and (xset[a][1] = xset[a][2]) //is a bivavle
          and (xset[a][8] * xset[phase[b]][2] = xset[phase[b]][2]))
		  
//	start and end are same digit	  
	 or 	 
	   ((xset[a][0] = xset[phase[b]][3]) 
	   and (xset[a][8] * xset[phase[b]][2] = xset[phase[b]][2]))
	   
		    then 
			  begin 	           
			    For G:= 0 to b-1 do
 				for e:= g+1 to b do
				   begin 
				   //e:= g+1;  
				     // digits are the same  
                     for n in (xset[phase[G]][3]* xset[phase[e]][0]) do
					  if ((xset[phase[g]][9]*xset[phase[e]][8]) <> []) 
					   then 
					   begin 
					    covered2[n]:= covered2[n] + (xset[phase[g]][9]*xset[phase[e]][8]);						
						active:= true;
						 if k  = 1
				           then 
					       techwrite[u][n+f+3]:=techwrite[u][n+f+3] +(xset[phase[g]][9]*xset[phase[e]][8]);
		                { append(output);
				           write(output,'[=> eliminates:',n,' @ ');
                             for j in (xset[phase[g]][9] * xset[phase[e]][8]) do 
                               write(output,j,' ');
                               write(output,']');}				
						end; 
						
						// digits swap in cell cell becomes locked to the exchange digits
						//2nd and first 
						if   (xset[phase[g]][2] = xset[phase[e]][1]) 
						 and (xset[phase[g]][7] * xset[phase[e]][0] = xset[phase[e]][0])
                         and (xset[phase[e]][6] * xset[phase[g]][3] = xset[phase[g]][3])					 
						 
                             then 
                                begin
                                  for J in (xset[phase[g]][2]* xset[phase[e]][1]) do 
								    if ((pm[j]-(xset[phase[g]][3] + xset[phase[e]][0])) <> [])
									 then 
									  begin
									   covered[j]:=covered[j] + (pm[j]-(xset[phase[g]][3] + xset[phase[e]][0]));
									    active:=true; 
										//append(output);
				                        //write(output,'[=>',j,' eliminates: ');
										 if k = 1 
										  then 
										    for n in pm[j] - (xset[phase[g]][3] + xset[phase[e]][0]) do 
											  techwrite[u][n+f+3]:=techwrite[u][n+f+3] +[j];
											  // write(output,n,' ');
                                       // write(output,']'); 
									  end; 
									end; 
									
						// digits swap in cell cell becomes locked to the exchange digits
						// first and 2 
						if   (xset[phase[g]][1] = xset[phase[e]][2]) 
						 and (xset[phase[g]][6] * xset[phase[e]][3] = xset[phase[e]][3])
                         and (xset[phase[e]][7] * xset[phase[g]][0] = xset[phase[g]][0])					 
						 
                             then 
                                begin
                                  for J in (xset[phase[g]][1]* xset[phase[e]][2]) do 
								    if ((pm[j]-(xset[phase[g]][0] + xset[phase[e]][3])) <> [])
									 then 
									  begin
									   covered[j]:=covered[j] + (pm[j]-(xset[phase[g]][0] + xset[phase[e]][3]));
									    active:=true; 
										//append(output);
				                        //write(output,'[=>',j,' eliminates: ');
										 if k = 1 
										  then 
										    for n in pm[j] - (xset[phase[g]][0] + xset[phase[e]][3]) do 
											  techwrite[u][n+f+3]:=techwrite[u][n+f+3] +[j];
											  // write(output,n,' ');
                                       // write(output,']'); 
									  end; 	  
									end;                                 								
					end;	
                   					 
			   end; // loop elimination code. 
			   
// loop end and start land on same cell. <canabalistic>	  
	if 	
	 (xset[a][1] = xset[phase[b]][2]) // first and last cell overlap 
	 and (xset[a][0] = xset[phase[b]][3]) // first and last digit is the same 
	 and (xset[phase[b]][7] <> [0]) // exchange is on
	 and (xset[a][6] <> [0]) // exchange is on 
        then 
begin 	
	
		  for j in xset[a][1] do 
		    begin 
			active:=true; 
		    covered[j]:=covered[j] + (pm[j] - xset[a][0]);
			
			 if k = 1 
			   then 			   
				for n in (pm[j] - (xset[a][0])) do 
				   techwrite[u][n+f+3]:=techwrite[u][n+f+3] +[j];
				   
            for n in xset[a][0] do 
                begin 
                  covered2[n]:=covered2[n] + (xset[a][8]);
				  active:= true; 
				  
			  if k = 1 
			   then 	   
				 techwrite[u][n+f+3]:=techwrite[u][n+f+3] + (xset[a][8]);
				 
	            end 
          end; 		  
	 end; 
	 
//chain display saving trigger  	
if ((techwrite[u][1+f+3] + techwrite[u][2+f+3] + techwrite[u][3+f+3] 
 +  techwrite[u][4+f+3] + techwrite[u][5+f+3] + techwrite[u][6+f+3]
 +  techwrite[u][7+f+3] + techwrite[u][8+f+3] + techwrite[u][9+f+3] )<> [] )
 
  then 
    begin
 	 
	 techwrite[u,0]:=[4];
	 techwrite[u,1]:=[b]; 
	
for e:= 0 to b do 
 begin 
  techwrite[u,(e*4)+2]:=xset[phase[e],0]; 
  techwrite[u,(e*4)+3]:=xset[phase[e],1]; 
  techwrite[u,(e*4)+4]:=xset[phase[e],2]; 
  techwrite[u,(e*4)+5]:=xset[phase[e],3]; 	
end;  
  
if  u = 32767  
 then 
   begin
   //chaindisplay(#26,u);   
   setlength(techwrite,0,0);    
   u:=0;   
 end; 
 
 u:=u+1;	
	 setlength(techwrite,u+1);
	 setlength(techwrite[u],f+15);
	 
 end; //saving chain display     
	
			   
 		  		  end 
				 else
				  begin 
                    dec(h[b]);	
				 
				 repeat 
                   if (h[b] < 0) and (b > 0)
                    then 
                     begin 	
					 
					{ append(output);
					 writeln(output);
					 write(output,'back track 1');
					 writeln(output);
					 write(output,'start: ');}					 
                       dec(b);
					   {for g:= 0 to b do
					      begin 
					     write(output,phase[g]);
						  if g <> b then write(output,' - ');
                          end; 	}					 
					  setlength(act3,b+1,max+1);
					  setlength(h,b+1);
					  setlength(phase,b+1);
                      dec(h[b]);
					  { if (b =0) and (h[b] <= -1) then
					     write(output,' Terminated');}
                     end;	
			   until( h[b]>=0) or (b <=0)		 
  			     end;
				 
	// back tracking if the while h[b] > -1 condition triggers 			 
		repeat 
                   if (h[b] < 0) and (b > 0)
                    then 
                     begin 
					 
					 // eliminations
						 
					{ append(output);
					 writeln(output);
					 write(output,'back track 1');
					 writeln(output);
					 write(output,'start: ');	}				 
                       dec(b);
					  { for g:= 0 to b do
					      begin 
					     write(output,phase[g]);
						  if g <> b then write(output,' - ');
                          end; }						 
					  setlength(act3,b+1,max+1);
					  setlength(h,b+1);
					  setlength(phase,b+1);
                      dec(h[b]);
					  { if (b =0) and (h[b] <= -1) then
					     write(output,' Terminated');}
                     end;	
			   until( h[b]>=0) or (b <=0)		 
		 end;
 { close(output);}
	 
	  end; // chain walk 
   if k = 1 then chaindisplay(#120,u); 
end; {xy chain}

