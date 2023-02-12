{ Finned and or Sashimi x-wings}
procedure smashi (k:integer);
var
xn,xn2,xn4,xn3,yn,n,z,g,q:integer;
Finn:RCBnums;
finns:numberset;

begin
if k = 0 then begin g:=0; setlength(techwrite,g+1,15); end;
For n:= 1 to 9 do

For xn:= 0 to 7 do
 for xn2:= xn+1 to 8 do

        begin

         If   (sec[xn,n] > 0) and (sec[xn,n] < 5 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 5 )

            then
              for yn:= 9 to 44 do
                if (( Rnsector[xn,n] + Rnsector[xn2,n] ) * comboset2[yn] = comboset2[yn] ) then
                if( (Rnsector[xn2,n] + Rnsector[xn,n] ) - comboset2[yn] <> [] )
                 then
                   begin

                    finn:= (Rnsector[xn2,n] + Rnsector[xn,n] ) - comboset2[yn];

                    Finns:=[];
					
	if k = 0 then techwrite[g,4]:= [];		
	
                     for z:= 0 to 8 do
                       if z in finn
                         then
                         begin

                         if (Rnsector[xn2,n] - comboset2[yn] <> [] )
                          then
                          include(finns,Rset[xn2,z]);

                          if (Rnsector[xn,n] - comboset2[yn] <> [] )
                          then
                          include(finns,Rset[xn,z]);
						  
			    if k = 0 then
                   begin
					for  q in (Rnsector[xn2,n] + Rnsector[xn,n] ) - finn do
					  techwrite[g,4]:=techwrite[g,4] + [q+9];
					
                     for q in [18..26] do
					  if digitrcb[q,n] * finns = finns
					    then
						  techwrite[g,4]:=techwrite[g,4] + [q];
						
                     techwrite[g,2]:=[n];
                     techwrite[g,3]:=[xn] + [xn2];
                     end;			  
              
                     end;                         

                      for z:= 0 to 8 do
                        if z in comboset2[yn]
                         then
                          for xn4:= 0 to 8 do
						   if n in sectorRC[xn4,z] then
                           if not (xn4 in [xn,xn2])
                            and  ( finns * peer[Rset[xn4,z]] = finns )
                             then
							  begin
							  active:= true;
                              include(covered[Rset[xn4,z]],n);							
							  if k = 0 
							   then 
							     techwrite[g,n+4]:=Techwrite[g,n+4] + [Rset[xn4,z]];
							  end;
							
 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 Techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];   
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;

end;

        If   (sec[xn+9,n] > 0) and (sec[xn+9,n] < 5 )
           and (sec[xn2+9,n] > 0) and (sec[xn2+9,n] < 5 )

            then
              for yn:= 9 to 44 do
                if ((Rnsector[xn+9,n] + RnSector[xn2+9,n] ) * comboset2[yn] = comboset2[yn]) then
                 if  ((Rnsector[xn2+9,n] + rnsector[xn+9,n] ) - comboset2[yn] <> []) then

                   begin

                    finn:= (Rnsector[xn2+9,n] + Rnsector[xn+9,n]) - comboset2[yn];

                    Finns:=[];
					
if k = 0 then techwrite[g,4]:= [];

                     for z:= 0 to 8 do
                       if z in finn
                         then
                          begin

                         if (Rnsector[xn2+9,n] - comboset2[yn] <> [] )
                          then
                          include(finns,Cset[xn2,z]);

                          if (Rnsector[xn+9,n] - comboset2[yn] <> [] )
                          then
                          include(finns,Cset[xn,z]);
						  
                  if k = 0 then
                     begin
					 for  q in (Rnsector[xn2+9,n] + Rnsector[xn+9,n] ) - finn do
					  techwrite[g,4]:=techwrite[g,4] + [q];

                     for q in [18..26] do
					  if digitrcb[q,n] * finns = finns
					    then
						  techwrite[g,4]:=techwrite[g,4] + [q];

                     techwrite[g,2]:=[n];
                     techwrite[g,3]:=[xn+9] + [xn2+9];
                     end;              


                          end;

                    for z:= 0 to 8 do
                        if z in comboset2[yn]
                         then
                          for xn4:= 0 to 8 do
						   if n in SectorRC[xn4+9,z] then
                           if not (xn4 in [xn,xn2])
                            and  ( finns * peer[Cset[xn4,z]] = finns )
                             then
							  begin
							  active:= true;
                              include(covered[Cset[xn4,z]],n);
							   if k = 0 
							    then
 								 techwrite[g,n+4]:=Techwrite[g,n+4] + [cset[xn4,z]];
							   end;
							
 if (k = 0) and (techwrite[g,n+4] <> [])
 then
 begin
 Techwrite[g,0]:=[2];
 techwrite[g,1]:=[1];  
 g:=g+1;
 setlength(techwrite,g+1,15);
 end;
				  
                  
end;

        end;
if k = 0 then chaindisplay(#20,g);
end;{SMASHI x-wings}