{Naked Triple}
procedure NT(k:integer);
var
xn,yn,n,n2,n3,z,g,q:integer;
begin

if k = 0 then begin g:=0; setlength(techwrite,g+1,14); end;

For xn:= 0 to 8 do
  For n:= 0 to 6 do
    for n2:= (n+1) to 7 do
     for n3:= (n2+1) to 8 do

        begin
{Row}
           if (sectorRC[xn,n] <> []) and (sectorRC[xn,n2] <> []) and (sectorRC[xn,n3] <> [])
           and (nm[rset[xn,n]] <4) and (nm[rset[xn,n2]] <4) and (nm[rset[xn,n3]] < 4 )
            then
              for yn:= 45 to 128 do
               if (sectorRC[xn,n] + sectorRC[xn,n2] + sectorRC[xn,n3] = comboset[yn] )
                 then
                   begin
                    active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2], Rset[xn,n3] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2],Rset[xn,n3] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+4] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					  techwrite[g,0]:=[0];
					  techwrite[g,1]:=[0];
					  techwrite[g,2]:=comboset[yn];
					  techwrite[g,3]:=[rset[xn,n]]+[rset[xn,n2]]+[Rset[xn,n3]];                      
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end; 

                  end;{rows} 

{Col}
           if (sectorRC[xn+9,n] <> []) and (sectorRC[xn+9,n2] <> []) and (sectorRC[xn+9,n3] <> [])
           and (nm[Cset[xn,n]] <4) and (nm[Cset[xn,n2]] <4) and (nm[Cset[xn,n3]] < 4 )
            then
              for yn:= 45 to 128 do
               if (sectorRC[xn+9,n] + sectorRC[xn+9,n2] + sectorRC[xn+9,n3] = comboset[yn] )
                 then
                   begin
                    active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2], Cset[xn,n3] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2],Cset[xn,n3] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn];
                       techwrite[g,3]:=[Cset[xn,n]]+[Cset[xn,n2]]+[Cset[xn,n3]];                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end; 

                  end;{Col} 

{Box}
           if (sectorRC[xn+18,n] <> []) and (sectorRC[xn+18,n2] <> []) and (sectorRC[xn+18,n3] <> [])
           and (nm[Bset[xn,n]] <4) and (nm[Bset[xn,n2]] <4) and (nm[Bset[xn,n3]] < 4 )
            then
              for yn:= 45 to 128 do
               if (sectorRC[xn+18,n] + sectorRC[xn+18,n2] + sectorRC[xn+18,n3] = comboset[yn] )
                 then
                   begin
                    active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+18,z] - [ Bset[xn,n] , Bset[xn,n2], Bset[xn,n3] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+18,z] - [ Bset[xn,n] , Bset[xn,n2],Bset[xn,n3] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];	
					   techwrite[g,2]:= comboset[yn];
                       techwrite[g,3]:= [Bset[xn,n]]+[Bset[xn,n2]]+[Bset[xn,n3]];                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end; 

                  end;{rows} 

        end;
if k = 0 then chaindisplay(#87,g);
end;{naked triple}