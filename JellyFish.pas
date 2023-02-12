{jelly fish}
procedure jellyfish(k:integer);
var
xn,xn2,xn3,xn4,xn5,yn,n,z,g:integer;
begin

if k = 0 then begin g:=0; setlength(techwrite,g+1,15); end;

For n:= 1 to 9 do

For xn:= 0 to 5 do
 for xn2:= (xn+1) to 6 do
  for xn3:= (xn2+1) to 7 do
   for xn4:= (xn3+1) to 8 do
       begin

         If   (sec[xn,n] > 0) and (sec[xn,n] < 5 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 5 )
           and (sec[xn3,n] > 0) and (sec[xn3,n] < 5 )
           and (sec[xn4,n] > 0) and (sec[xn4,n] < 5 )
            then
              for yn:= 129 to 254 do
                if Rnsector[xn,n] + Rnsector[xn2,n] + Rnsector[xn3,n] + Rnsector[xn4,n]= comboset2[yn]
                 then
                   begin
										
                     for z in comboset2[yn] do                         
						 begin						  
						 active:=true; 
						covered2[n]:= covered2[n] + (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]+DigitRCB[xn3,n]+DigitRCB[xn4,n]));

                         if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]+DigitRCB[xn3,n]+DigitRCB[xn4,n])); 
								 
                       end;
	if (k = 0) and (techwrite[g,n+4] <> [])
                 then
                  begin
				  techwrite[g,0]:=[2];
				  techwrite[g,1]:=[1];
				  techwrite[g,2]:=[n];
				  techwrite[g,3]:=[xn,xn2,xn3,xn4];
				  for z in comboset2[yn] do   
				  techwrite[g,4]:=techwrite[g,4] + [z+9];
                  g:=g+1;
                  setlength(techwrite,g+1,15);

                  end;
				
                  end;

        If   (sec[xn+9,n] > 0) and (sec[xn+9,n] < 5 )
           and (sec[xn2+9,n] > 0) and (sec[xn2,n] < 5 )
           and (sec[xn3+9,n] > 0) and (sec[xn3+9,n] < 5 )
           and (sec[xn4+9,n] > 0) and (sec[xn4+9,n] < 5 )
            then
              for yn:= 129 to 254 do
                 if Rnsector[xn+9,n] + Rnsector[xn2+9,n] + Rnsector[xn3+9,n] + Rnsector[xn4+9,n]= comboset2[yn]
                 then
                   begin
				   
                     for z in comboset2[yn] do 
                        
						 begin					
						 
                           active:=true; 
						   covered2[n]:= covered2[n] + (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]+DigitRCB[xn3+9,n]+DigitRCB[xn4+9,n]));

                          if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]+DigitRCB[xn3+9,n]+DigitRCB[xn4+9,n])); 
							
                        
						end;

if (k = 0) and (techwrite[g,n+4] <> [])
                 then
                  begin
				  techwrite[g,0]:=[2];
				  techwrite[g,1]:=[1];
				  techwrite[g,2]:=[n];
				  techwrite[g,3]:=[xn+9,xn2+9,xn3+9,xn4+9];
				  for z in comboset2[yn] do   
				  techwrite[g,4]:=techwrite[g,4] + [z];
                  g:=g+1;
                  setlength(techwrite,g+1,15);

                  end;
                

                    end;


        end;
if k = 0 then chaindisplay(#68,g);
end;{jelly fish}