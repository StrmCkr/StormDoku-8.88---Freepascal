{hidden Quad}
procedure HQ(k:integer);
var
xn,yn,n,n2,n3,n4,z,g,q:integer;
Begin

if k= 0 then begin g:=0; setlength(techwrite,g+1,14); end;
For xn:= 0 to 8 do

   For n:= 1 to 6 do
    for n2:= (n+1) to 7 do
     for n3:= (n2+1) to 8 do
      for n4:= (n3+1) to 9 do
       begin

         If    (sec[xn,n] > 0) and (sec[xn,n] < 5 )
           and (sec[xn,n2] > 0) and (sec[xn,n2] < 5 )
           and (sec[xn,n3] > 0) and (sec[xn,n3] < 5 )
           and (sec[xn,n4] > 0) and (sec[xn,n4] < 5 )
            then
              for yn:= 129 to 254 do
                if Rnsector[xn,n] + Rnsector[xn,n2] + Rnsector[xn,n3] + Rnsector[xn,n4] = comboset2[yn]
                 then
                   begin
                    active:= true;

                     for z:= 0 to 8 do
                       if z in comboset2[yn]
                        then
						 begin
                           covered[rset[xn,z]]:= covered[rset[xn,z]] +(sectorRC[xn,z]- [n,n2,n3,n4]) ;
						   
						   if k = 0 then
                          begin

                           for q in (sectorRC[xn,z] - [n,n2,n3,n4]) do
                            techwrite[g,q+3]:=techwrite[g,q+3]+ [rset[xn,z]];

                          end;
                         end;

                    if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                     then
                       begin
					    techwrite[g,0]:=[1];
						techwrite[g,1]:=[0];
						
                        for q in comboset2[yn] do
                          techwrite[g,2]:=techwrite[g,2] + [rset[xn,q]];
						  
                          techwrite[g,3]:=[n,n2,n3,n4];

                          g:=g+1;
                          setlength(techwrite,g+1,14);

                       end;

                  end;

           If     (sec[xn+9,n] > 0) and (sec[xn+9,n] < 5 )
           and (sec[xn+9,n2] > 0) and (sec[xn+9,n2] < 5 )
           and (sec[xn+9,n3] > 0) and (sec[xn+9,n3] < 5 )
           and (sec[xn+9,n4] > 0) and (sec[xn+9,n4] < 5 )
             then
              for yn:= 129 to 254 do
                if Rnsector[xn+9,n] + Rnsector[xn+9,n2] + Rnsector[xn+9,n3] + Rnsector[xn+9,n4] = comboset2[yn]
                 then
                   begin
                    active:= true;

                     for z in comboset2[yn] do                        
						 begin
                           covered[Cset[xn,z]]:= covered[Cset[xn,z]] + (sectorRC[xn+9,z] - [n,n2,n3,n4]);
						   
						   if k = 0 then
                           begin

                           for q in (sectorRC[xn+9,z]- [n,n2,n3,n4]) do
                            techwrite[g,q+3]:=techwrite[g,q+3]+ [Cset[xn,z]];

                          end;
                         end;

                    if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                     then
                       begin
					    techwrite[g,0]:=[1];
						techwrite[g,1]:=[0];
						
                        for q in comboset2[yn] do
                          techwrite[g,2]:=techwrite[g,2] + [cset[xn,q]];
						  
                          techwrite[g,3]:=[n,n2,n3,n4];

                          g:=g+1;
                          setlength(techwrite,g+1,14);

                       end;


                  end;

           If     (sec[xn+18,n] > 0) and (sec[xn+18,n] < 5 )
           and (sec[xn+18,n2] > 0) and (sec[xn+18,n2] < 5 )
           and (sec[xn+18,n3] > 0) and (sec[xn+18,n3] < 5 )
           and (sec[xn+18,n4] > 0) and (sec[xn+18,n4] < 5 )
            then
              for yn:= 129 to 254 do
                if Rnsector[xn+18,n] + Rnsector[xn+18,n2] + Rnsector[xn+18,n3] + Rnsector[xn+18,n4] = comboset2[yn]
                 then
                   begin
                    active:= true;

                     for z in comboset2[yn] do                         
						begin
                           covered[bset[xn,z]]:= covered[bset[xn,z]] + (sectorRC[xn+18,z]- [n,n2,n3,n4]);
						   
						   if k = 0 then
                           begin
                             for q in (sectorRC[xn+18,z]- [n,n2,n3,n4]) do
                             techwrite[g,q+3]:=techwrite[g,q+3]+ [bset[xn,z]];

                           end;
                         end;

                    if (k = 0) and (techwrite[g,1+3] + techwrite[g,2+3] + techwrite[g,3+3] + techwrite[g,4+3] + techwrite[g,5+3] + techwrite[g,6+3] + techwrite[g,7+3] + techwrite[g,8+3]+ techwrite[g,9+3] <> [])
                     then
                       begin
					    techwrite[g,0]:=[1];
						techwrite[g,1]:=[0];
						
                        for q in comboset2[yn] do
                          techwrite[g,2]:=techwrite[g,2] + [bset[xn,q]];
						  
                          techwrite[g,3]:=[n,n2,n3,n4];

                          g:=g+1;
                          setlength(techwrite,g+1,14);

                       end;

                  end;

        end;
if k = 0 then chaindisplay(#63,g);
end;{hidden Quad}