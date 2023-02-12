{box line reduction}
procedure BLR(k:integer);
var
xn,sq,n,g:integer;
begin

if k=0 then begin  g:=0; setlength(techwrite,g+1,15); end;

for n:= 1 to 9 do
 for xn:= 0 to 8 do
   if  Sec[xn+18,n] > 0
    then
  for sq:= 0 to 8 do

  if sq in (BnR[xn,n] + BnC[xn,n])
   then
  begin

   {type 1 all cells for  a box are in a row }
    if  (BNR[xn,n] = [sq] )   and (DigitRCB[sq,n] - DigitRCB[xn+18,n] <> [])
     then
      begin
       active:=true;
       covered2[n]:= Covered2[n] + (DigitRCB[sq,n] - DigitRCB[xn+18,n]);

	   if K = 0
	    then
		 begin
		 techwrite[g,0]:=[2];
		 techwrite[g,1]:=[1];
		 techwrite[g,2]:=[n];
		 techwrite[g,3]:=[xn+18];		
		 techwrite[g,4]:=[sq] ;		
         techwrite[g,n+4]:=(DigitRCB[sq,n] - DigitRCB[xn+18,n]);
		 g:= g+1;
		 setlength(techwrite,g+1,15);
		end;       
	   
      end;

   {type 2 all cells for a row are in 1 box }

    if (RnB[sq,n] = [xn]) and ( DigitRCB[xn+18,n] - DigitRCB[sq,n] <> [])
     then
      begin
       active:= true;
       covered2[n]:=covered2[n] + ( DigitRCB[xn+18,n] - DigitRCB[sq,n]);


     if K = 0
	    then
		 begin
		 techwrite[g,0]:=[2];
		 techwrite[g,1]:=[1];
		 techwrite[g,2]:=[n];
		 techwrite[g,3]:= [sq];		
		 techwrite[g,4]:= [xn+18];
		 techwrite[g,n+4]:= ( DigitRCB[xn+18,n] - DigitRCB[sq,n]);
		g:= g+1;
		setlength(techwrite,g+1,15);
		end;				
		
       end;

   {type 1 all cells for  a box are in a  col}
   if  (BNC[xn,n] = [sq] ) and (DigitRCB[sq+9,n] - DigitRCB[xn+18,n] <> [])
     then
      begin
       active:=true;
       covered2[n]:= Covered2[n] + (DigitRCB[sq+9,n] - DigitRCB[xn+18,n]);

 if K = 0
	    then
		 begin
		 techwrite[g,0]:=[2];
		 techwrite[g,1]:=[1];
		 techwrite[g,2]:=[n];	
		 techwrite[g,3]:= [xn+18];
		 techwrite[g,4]:= [sq+9];		 
         techwrite[g,n+4]:= (DigitRCB[sq+9,n] - DigitRCB[xn+18,n]);
		g:= g+1;
		setlength(techwrite,g+1,15);
		end;
		
      end;

     {type 2 all cells for a Col are in 1 box }
     if ( CnB[sq,n] = [xn] )   and (DigitRCB[xn+18,n] - DigitRCB[sq+9,n] <> [])
     then
      begin
       active:= true;
        covered2[n]:=covered2[n] + (DigitRCB[xn+18,n] - DigitRCB[sq+9,n] );

          if K = 0
	    then
		 begin
		 techwrite[g,0]:=[2];
		 techwrite[g,1]:=[1];
		 techwrite[g,2]:=[n];	
		 techwrite[g,3]:= [sq+9];
		 techwrite[g,4]:= [xn+18];		
         techwrite[g,n+4]:=(DigitRCB[xn+18,n] - DigitRCB[sq+9,n] );
		g:= g+1;
		setlength(techwrite,g+1,15);
		end;

       end;

   end; {xn}

 if k = 0 then chaindisplay(#60,G);


end;{box,line reduction}