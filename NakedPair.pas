{Naked pairs}
procedure NP(k:integer);
var
xn,yn,n,n2,z,g,q:integer;
begin

if k = 0 then begin g:=0; setlength(techwrite,g+1,14); end;

For xn:= 0 to 8 do
  For n:= 0 to 7 do
    for n2:= (n+1) to 8 do

        begin
{rows}
           if(sectorRC[xn,n] <> []) and (sectorRC[xn,n2] <> [])
           and (nm[rset[xn,n]] <3) and (nm[rset[xn,n2]] <3)
            then
             for yn:= 9 to 44 do
              if ( sectorRC[xn,n] + sectorRC[xn,n2] = comboset[yn])
               then
                   begin
                     active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+4] + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn];
                       techwrite[g,3]:=[rset[xn,n]]+[rset[xn,n2]];                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end;

                  end; {rows}
{cols} 
           if(sectorRC[xn+9,n] <> []) and (sectorRC[xn+9,n2] <> [])
           and (nm[Cset[xn,n]] <3) and (nm[Cset[xn,n2]] <3)
            then
             for yn:= 9 to 44 do
              if ( sectorRC[xn+9,n] + sectorRC[xn+9,n2] = comboset[yn])
               then
                   begin
                     active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2] ] );
						   end; 
						 
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
                       techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn];
                       techwrite[g,3]:=[cset[xn,n]]+[cset[xn,n2]];                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);
                      end;

                  end; {cols}
{boxes} 
           if(sectorRC[xn+18,n] <> []) and (sectorRC[xn+18,n2] <> [])
           and (nm[Bset[xn,n]] <3) and (nm[Bset[xn,n2]] <3)
            then
             for yn:= 9 to 44 do
              if ( sectorRC[xn+18,n] + sectorRC[xn+18,n2] = comboset[yn])
               then
                   begin
                     active:= true;

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+18,z] - [Bset[xn,n] , Bset[xn,n2] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+18,z] - [ Bset[xn,n] , Bset[xn,n2] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
                       techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn];
                       techwrite[g,3]:=[bset[xn,n]]+[bset[xn,n2]];                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);
                      end;

                  end; {boxes}

        end;
if k = 0 then chaindisplay(#86,g);
end;{naked pair}