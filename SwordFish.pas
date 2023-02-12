{sword fish}
procedure Swordfish(k:integer);
var
xn,xn2,xn3,xn4,yn,n,z,g:integer;
begin

if k = 0 then begin g:=0; setlength(techwrite,g+1,15); end;
For n:= 1 to 9 do

For xn:= 0 to 6 do
 for xn2:= (xn+1) to 7 do
  for xn3:= (xn2+1) to 8 do

       begin

         If   (sec[xn,n] > 0) and (sec[xn,n] < 4 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 4 )
           and (sec[xn3,n] > 0) and (sec[xn3,n] < 4 )
            then
              for yn:= 45 to 128 do
                if Rnsector[xn,n] + Rnsector[xn2,n] + Rnsector[xn3,n]= comboset2[yn]
                 then
                   begin
                    
                     for z in comboset2[yn] do                        
                         begin                         

                          active:=true; 
						       covered2[n]:= covered2[n] + (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]+DigitRCB[xn3,n]));

                              if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]+DigitRCB[xn3,n]));                     

                         end;

                if (k = 0) and (techwrite[g,n+4] <> [])
                 then
                  begin
				  techwrite[g,0]:=[2];
				  techwrite[g,1]:=[1];
				  techwrite[g,2]:=[n];
				  techwrite[g,3]:=[xn,xn2,xn3];
				  for z in comboset2[yn] do 
				   techwrite[g,4]:=techwrite[g,4] + [z+9];
                  g:=g+1;
                  setlength(techwrite,g+1,15);

                  end;

                  end;


        If   (Sec[xn+9,n] > 0) and (sec[xn+9,n] < 4 )
           and (sec[xn2+9,n] > 0) and (sec[xn2+9,n] < 4 )
           and (sec[xn3+9,n] > 0) and (sec[xn3+9,n] < 4 )
            then
              for yn:= 45 to 128 do
                if Rnsector[xn+9,n] + Rnsector[xn2+9,n] + Rnsector[xn3+9,n] = comboset2[yn]
                 then
                   begin


                     for z in comboset2[yn] do 
                      
                         begin
                            active:=true; 
						       covered2[n]:= covered2[n] + (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]+DigitRCB[xn3+9,n]));

                              if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]+DigitRCB[xn3+9,n]));
                     
                         end;

                if (k = 0) and (techwrite[g,n+4] <> [])
                 then
                  begin
				  techwrite[g,0]:=[2];
				  techwrite[g,1]:=[1];
				  techwrite[g,2]:=[n];
				  techwrite[g,3]:=[xn+9,xn2+9,xn3+9];
				  for z in comboset2[yn] do 
				   techwrite[g,4]:=techwrite[g,4] + [z];
                  g:=g+1;
                  setlength(techwrite,g+1,15);

                  end;

              end;

        end;

 if k =0 then chaindisplay(#67,g);
end;{swordfish}