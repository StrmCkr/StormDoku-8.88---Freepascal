{Naked Quad}
procedure Nq(k:integer);
var
xn,yn,n,n2,n3,n4,z,g,q:integer;
Begin

if k = 0 then begin  g:=0; setlength(techwrite,g+1,14); end;
For xn:= 0 to 8 do
  For n:= 0 to 5 do
    for n2:= (n+1) to 6 do
     for n3:= (n2+1) to 7 do
      for n4:= (n3+1) to 8 do


        begin
{Row}
           if (sectorRC[xn,n] <> []) and (sectorRC[xn,n2] <> []) and (sectorRC[xn,n3] <> []) and (sectorRC[xn,n4] <> [])
           and (nm[rset[xn,n]] <5) and (nm[rset[xn,n2]] <5) and (nm[rset[xn,n3]] < 5 ) and (nm[rset[xn,n4]] <5)
            then
             for yn:= 129 to 254 do
              if (sectorRC[xn,n] + sectorRC[xn,n2] + sectorRC[xn,n3] + sectorRC[xn,n4] = comboset[yn] )

                then
                   begin
                    active:= true;                 

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2], Rset[xn,n3] , Rset[xn,n4] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn,z] - [ Rset[xn,n] , Rset[xn,n2], Rset[xn,n3], Rset[xn,n4] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn]; 
                       techwrite[g,3]:= [rset[xn,n]]+[rset[xn,n2]]+[rset[xn,n3]] +[rset[xn,n4]];
                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end;
					  
                  end;{row}

{Col}
           if (sectorRC[xn+9,n] <> []) and (sectorRC[xn+9,n2] <> []) and (sectorRC[xn+9,n3] <> []) and (sectorRC[xn+9,n4] <> [])
           and (nm[Cset[xn,n]] <5) and (nm[Cset[xn,n2]] <5) and (nm[Cset[xn,n3]] < 5 ) and (nm[Cset[xn,n4]] <5)
            then
             for yn:= 129 to 254 do
              if (sectorRC[xn+9,n] + sectorRC[xn+9,n2] + sectorRC[xn+9,n3] + sectorRC[xn+9,n4] = comboset[yn] )

                then
                   begin
                    active:= true;                 

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2], Cset[xn,n3] , Cset[xn,n4] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+9,z] - [ Cset[xn,n] , Cset[xn,n2], Cset[xn,n3], Cset[xn,n4] ] );
						   end; 
						  
						  end; 

                  if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn]; 
                       techwrite[g,3]:= [cset[xn,n]]+[cset[xn,n2]]+[cset[xn,n3]] +[cset[xn,n4]];
                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end;
					  
                  end;{col}
{Box}
           if (sectorRC[xn+18,n] <> []) and (sectorRC[xn+18,n2] <> []) and (sectorRC[xn+18,n3] <> []) and (sectorRC[xn+18,n4] <> [])
           and (nm[Bset[xn,n]] <5) and (nm[Bset[xn,n2]] <5) and (nm[Bset[xn,n3]] < 5 ) and (nm[Bset[xn,n4]] <5)
            then
             for yn:= 129 to 254 do
              if (sectorRC[xn+18,n] + sectorRC[xn+18,n2] + sectorRC[xn+18,n3] + sectorRC[xn+18,n4] = comboset[yn] )

                then
                   begin
                    active:= true;                 

                    for z in comboset[yn] do 
					    begin
						  covered2[z]:= covered2[z]  + (DigitRCB[xn+18,z] - [ Bset[xn,n] , Bset[xn,n2], Bset[xn,n3] , Bset[xn,n4] ] ) ;  

                        if k= 0
                            then
                             begin
						    techwrite[g,z+3]:=techwrite[g,z+3] + (DigitRCB[xn+18,z] - [ Bset[xn,n] , Bset[xn,n2], Bset[xn,n3], Bset[xn,n4] ] );
						   end; 
						  
						  end; 

                   if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                    then
                      begin
					   techwrite[g,0]:=[0];
					   techwrite[g,1]:=[0];
					   techwrite[g,2]:=comboset[yn]; 
                       techwrite[g,3]:= [bset[xn,n]]+[bset[xn,n2]]+[bset[xn,n3]] +[bset[xn,n4]];
                       
                       g:=g+1;
                       setlength(techwrite,g+1,14);

                      end;
					  
                  end;{Box}
        end;
if k=0 then chaindisplay(#88,g);
end;{naked quad}