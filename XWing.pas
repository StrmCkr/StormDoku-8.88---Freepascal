{x-wing}
procedure xwing(k:integer);
var
xn,xn2,xn3,yn,n,z,g:integer;
begin

if k=0 then begin  g:=0; setlength(techwrite,g+1,15); end;
For n:= 1 to 9 do

For xn:= 0 to 7 do
 for xn2:= (xn+1) to 8 do

       begin

         If   (sec[xn,n] > 0) and (sec[xn,n] < 3 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 3 )
            then
              for yn:= 9 to 44 do
                if (Rnsector[xn,n] + Rnsector[xn2,n])  =  comboset2[yn]
                 then
                  begin
                    active:= true;
					
                     for z in comboset2[yn] do  
					  if  (digitRCB[z+9,n] - (DigitRCB[xn,n]+DigitRCB[xn2,n]) <> []) then                     
                         begin
                           active:=true; 
						       covered2[n]:= covered2[n] + (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]));

                              if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z+9,n]  - (DigitRCB[xn,n]+DigitRCB[xn2,n]));                     

                         end;

 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn,xn2];
  for z in comboset2[yn] do 
    techwrite[g,4]:=techwrite[g,4] + [z+9]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;

                  end;

 If   (sec[xn,n] > 0) and (sec[xn,n] < 7 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 7 )
           and (Bxy[xn] = bxy[xn2])
            then
              for yn:= 9 to 44 do
                if (RnB[xn,n] + RnB[xn2,n])  =  comboset2[yn]
                 then
                  begin
                    active:= true;                     

                    for z in comboset2[yn] do
                      begin
                       
                       for xn3:= 0 to 8 do
                        if ([Rx[bset[z,xn3]]] * [xn,xn2] = [] ) and (n in sectorRC[z+18,xn3])
                          then
                           begin
                           include(covered[Bset[z,xn3]],n);

                           if k = 0 then techwrite[g,n+4]:=techwrite[g,n+4] +[ bset[z,xn3]];

                           end;

                      end;

 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn,xn2];
  for z in comboset2[yn] do 
    techwrite[g,4]:=techwrite[g,4] + [z+18]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;

end;

        If   (sec[xn+9,n] > 0) and (sec[xn+9,n] < 3 )
           and (sec[xn2+9,n] > 0) and (sec[xn2+9,n] < 3 )
            then
              for yn:= 9 to 44 do
                if rnsector[xn+9,n] + rnsector[xn2+9,n] = comboset2[yn]
                 then
                   begin
                    active:= true;                  

                     for z in comboset2[yn] do  
					  if  (digitRCB[z,n] - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]) <> []) then 
                         begin                        

                          active:=true; 
						       covered2[n]:= covered2[n] + (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]));

                              if k=0 then techwrite[g,n+4]:= techwrite[g,n+4]+ (DigitRCB[z,n]  - (DigitRCB[xn+9,n]+DigitRCB[xn2+9,n]));                     

                         end;

 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn+9,xn2+9];
  for z in comboset2[yn] do 
    techwrite[g,4]:=techwrite[g,4] + [z+9]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;


end;

If   (sec[xn+9,n] > 0) and (sec[xn+9,n] < 7 )
           and (sec[xn2+9,n] > 0) and (sec[xn2+9,n] < 7 )
           and (Bxy[xn] = bxy[xn2])
            then
              for yn:= 9 to 44 do
                if (CnB[xn,n] + CnB[xn2,n])  =  comboset2[yn]
                 then
                  begin
                    active:= true;

                    for z in comboset2[yn] do
                      begin                     

                       for xn3:= 0 to 8 do
                        if ([CY[bset[z,xn3]]] * [xn,xn2] = [] )  and (n in sectorRC[z+18,xn3])
                          then
                           begin
                           include(covered[Bset[z,xn3]],n);

                           if k = 0 then techwrite[g,n+4]:=techwrite[g,n+4] +[ bset[z,xn3]];
                           end;

                      end;

 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn+9,xn2+9];
  for z in comboset2[yn] do 
    techwrite[g,4]:=techwrite[g,4] + [z+18]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;

end;


     If   (sec[xn+18,n] > 0) and (sec[xn+18,n] < 7 )
           and (sec[xn2+18,n] > 0) and (sec[xn2+18,n] < 7 )
            then

             for yn:= 9 to 44 do
              begin


                if BNC[xn,n] + BnC[xn2,n] = comboset2[yn]
                 then
                   begin
                    active:= true;                     

                    for xn3:= 0 to 8 do
                     if not (xn3 in [xn,xn2])
                      then
                       begin
                       for z:= 0 to 8 do
                        if (Cy[bset[xn3,z]] in comboset2[yn])  // and( n in SectorRC[xn3+18,z])
                          then
                           begin
                            if ( n in sectorRC[xn3+18,z]) then
                                include(covered[bset[xn3,z]],n);

                            if (k =0) and( n in sectorRC[xn3+18,z])
 							then techwrite[g,n+4]:=techwrite[g,n+4]+ [Bset[xn3,z]];
                            

                           end;						   
						   						   
						   end;
 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn+18,xn2+18]; 
 for xn3:= 0 to 8 do
  if not (xn3 in [xn,xn2]) then
  for z:= 0 to 8 do
   if (Cy[bset[xn3,z]] in comboset2[yn]) then 
    techwrite[g,4]:=techwrite[g,4] + [Cy[bset[xn3,z]]+9]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;


 end;

                if BNR[xn,n] + BnR[xn2,n] = comboset2[yn]
                 then
                   begin
                    active:= true;
                    
                    for xn3:= 0 to 8 do
                     if not (xn3 in [xn,xn2])
                      then
                        begin 
                       for z:= 0 to 8 do
                        if (Rx[bset[xn3,z]] in comboset2[yn]) // and (n in sectorRC[xn3,z])
                          then
                           begin
                              if (n in sectorRC[xn3+18,z])
                                then
                                 include(covered[bset[xn3,z]],n);

                             if (k =0) and (n in sectorRC[xn3+18,z])
 							 then techwrite[g,n+4]:=techwrite[g,n+4]+ [Bset[xn3,z]];

                                                     
                             end; 
end;
 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];
 techwrite[g,2]:=[n]; 
 techwrite[g,3]:=[xn+18,xn2+18]; 
 for xn3:= 0 to 8 do
  if not (xn3 in [xn,xn2])then
  for z:= 0 to 8 do
   if (Rx[bset[xn3,z]] in comboset2[yn]) then 
    techwrite[g,4]:=techwrite[g,4] + [Rx[bset[xn3,z]]+9]; 
 
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;


                   end;


             end;

        end;

if k = 0 then chaindisplay(#85,g);
end;{x-wing}