{Finned Sashimi jelly fish}
procedure smashijelly(k:integer);

var
xn,xn2,xn3,xn4,xn5,yn,n,z,g,q:integer;
Finn:RCBnums;
finns:numberset;

begin
if k = 0 then begin g:=0; setlength(techwrite,g+1,15); end;

For n:= 1 to 9 do

For xn:= 0 to 5 do
 for xn2:= (xn+1)  to 6 do

  for xn3:= xn2+1 to 7 do
   for xn4:= (xn3+1) to 8 do
       begin

         If   (sec[xn,n] > 0) and (sec[xn,n] < 7 )
           and (sec[xn2,n] > 0) and (sec[xn2,n] < 7 )
           and (sec[xn3,n] > 0) and (sec[xn3,n] < 7 )
            and (sec[xn4,n] > 0) and (sec[xn4,n] < 7 )

            then
              for yn:= 129 to 254 do
                if (( Rnsector[xn,n] + Rnsector[xn2,n] + Rnsector[xn3,n] + Rnsector[xn4,n]) * comboset2[yn] = comboset2[yn] ) then

if ((Rnsector[xn2,n] + Rnsector[xn,n] + Rnsector[xn3,n] + Rnsector[xn4,n]) - comboset2[yn] <> [])
                 then
                   begin

                    finn:= (Rnsector[xn2,n] + Rnsector[xn,n] + Rnsector[xn3,n] + Rnsector[xn4,n]) - comboset2[yn];

                    Finns:=[];

if k = 0 then techwrite[g,4]:= [];

                     for  z in finn do

                         begin

                            if (Rnsector[xn,n] - comboset2[yn] <> [])
                           then
                            include(finns,Rset[xn,z]);

                           if (Rnsector[xn2,n] - comboset2[yn] <> [])
                           then
                            include(finns,Rset[xn2,z]);

                          if (Rnsector[xn4,n] - comboset2[yn] <> [])
                           then
                            include(finns,Rset[xn4,z]);

                           if (Rnsector[xn3,n] - comboset2[yn] <> [])
                           then
                            include(finns,Rset[xn3,z]);
							
				if k = 0 then
                     begin
					  for  q in (rnsector[xn2,n] + rnsector[xn,n] + rnsector[xn3,n] + rnsector[xn4,n]) - finn do
					  techwrite[g,4]:=techwrite[g,4] + [q+9];

                     for q in [18..26] do
					  if digitrcb[q,n] * finns = finns
					    then
						  techwrite[g,4]:=techwrite[g,10] + [q];

                     techwrite[g,2]:=[n];
                     techwrite[g,3]:=[xn+9] + [xn2+9]+[xn3+9] +[xn4+9];
                     end;

                          end;

                      for z in comboset2[yn] do
                          for xn5:= 0 to 8 do
                           if n in sectorRC[xn5,z] then
                           if not (xn5 in [xn,xn2,xn3,xn4])
                            and  ( finns * peer[Rset[xn5,z]] = finns )
                             then
							  begin
							   active:= true;
                              include(covered[Rset[xn5,z]],n);
							  if k=0
 							     then
								     techwrite[g,n+4]:= techwrite[g,n+4]+  ([rset[xn5,z]]);
							  end;

if (k = 0) and (techwrite[g,n+4] <> [])
                 then
                  begin
				  techwrite[g,0]:=[2];
				  techwrite[g,1]:=[1];
                  g:=g+1;
                  setlength(techwrite,g+1,15);

                  end;
				
                  end;

if (sec[xn+9,n] > 0) and (sec[xn+9,n] < 7 )
           and (sec[xn2+9,n] > 0) and (sec[xn2+9,n] < 7 )
           and (sec[xn3+9,n] > 0) and (sec[xn3+9,n] < 7 )
            and (sec[xn4+9,n] > 0) and (sec[xn4+9,n] < 7 )

            then
              for yn:= 129 to 254 do
                if (( Rnsector[xn+9,n] + Rnsector[xn2+9,n] + Rnsector[xn3+9,n] + Rnsector[xn4+9,n]) * comboset2[yn] = comboset2[yn] ) then

if ((Rnsector[xn2+9,n] + Rnsector[xn+9,n] + Rnsector[xn3+9,n] + Rnsector[xn4+9,n]) - comboset2[yn] <> [])
                 then
				 
                   begin

                    finn:= (Rnsector[xn2+9,n] + Rnsector[xn+9,n]+ Rnsector[xn3+9,n] + Rnsector[xn4+9,n]) - comboset2[yn];

                    Finns:=[];

if k=0 then techwrite[g,4]:= [];

                     for z in finn do

                          begin

                          if (Rnsector[xn2+9,n] - comboset2[yn] <> [])
                           then
                            include(finns,Cset[xn2,z]);

                          if (Rnsector[xn+9,n] - comboset2[yn] <> [])
                           then
                            include(finns,Cset[xn,z]);

                          if (Rnsector[xn4+9,n] - comboset2[yn] <> [])
                           then
                            include(finns,Cset[xn4,z]);

                          if (Rnsector[xn3+9,n] - comboset2[yn] <> [])
                           then
                            include(finns,Cset[xn3,z]);
							
							
				if k = 0 then
                     begin
					  for  q in (Rnsector[xn2+9,n] + Rnsector[xn+9,n] + Rnsector[xn3+9,n] + Rnsector[xn4+9,n]) - finn do
					  techwrite[g,4]:=techwrite[g,4] + [q];

                     for q in [18..26] do
					  if digitrcb[q,n] * finns = finns
					    then
						  techwrite[g,4]:=techwrite[g,10] + [q];					

                     techwrite[g,2]:=[n];
                     techwrite[g,3]:=[xn+9] + [xn2+9]+[xn3+9] +[xn4+9];
                     end;				
							
                          end;						


                    for z in comboset2[yn] do
                          for xn5:= 0 to 8 do
						   if n in SectorRC[xn5+9,z] then
                           if not (xn5 in [xn,xn2,xn3,xn4])
                            and  ( finns * peer[Cset[xn5,z]] = finns )
                             then
							  begin
							  active:=true;
                              include(covered[Cset[xn5,z]],n);
							  if k=0
 							     then
								     techwrite[g,n+4]:= techwrite[g,n+4]+ ([Cset[xn5,z]]);
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
if k = 0 then chaindisplay(#93,g);


end;{SMASHIjellies}