{finds hidden singles}
procedure Hs(K:integer);
var
xn,yn,n,g:integer;
begin

if k=0 then begin  g:=0; setlength(techwrite,g+1,14); end;

  for xn:= 0 to 8 do
    for n:= 1 to 9 do
      begin

     if Sec[xn,n] = 1
       then
        For yn:= 0 to 8 do
          if Rnsector[xn,n] = [yn]
           then
             begin
              active:=true;

                S[Rset[xn,yn]]:=[n];

                include(nsector[xn],n);
                include(nsector[yn+9],n);
                include(nsector[bxy[rset[xn,yn]]+18],n);
                
				 exclude(ocell,rset[xn,yn]);
		         include(Acell,rset[xn,yn]);
				
                if k = 0 then
                 begin
                  techwrite[g,0]:=[1];
				  techwrite[g,1]:=[0];
				  techwrite[g,3]:=[n];
				  techwrite[g,2]:=[Rset[xn,yn]];
                  techwrite[g,n+3]:=peer[rset[xn,yn]] * digitcell[n];                  
                  G:=g+1;
                  setlength(techwrite,g+1,14);
                  end;
             end;


      if sec[xn+9,n] = 1
       then
        For yn:= 0 to 8 do
          if Rnsector[xn+9,n] = [yn]
           then
             begin
              active:=true;

                S[Cset[xn,yn]]:=[n];

                include(nsector[yn],n);
                include(nsector[xn+9],n);
                include(nsector[bxy[rset[yn,xn]]+18],n);
				
				 exclude(ocell,Cset[xn,yn]);
		         include(Acell,Cset[xn,yn]);
				

                 if k = 0 then
                 begin
                  techwrite[g,0]:=[1];
				  techwrite[g,1]:=[0];
				  techwrite[g,3]:=[n];
				  techwrite[g,2]:=[Cset[xn,yn]];
                  techwrite[g,n+3]:=peer[rset[xn,yn]] * digitcell[n];                  
                  G:=g+1;
                  setlength(techwrite,g+1,14);
                  end;
             end;

      if sec[xn+18,n] = 1
       then
        For yn:= 0 to 8 do
         if Rnsector[xn+18,n] = [yn]
           then
             begin
              active:=true;

                S[Bset[xn,yn]]:=[n];

                include(nsector[Rx[bset[xn,yn]]],n);
                include(nsector[cy[bset[xn,yn]]+9],n);
                include(nsector[xn+18],n);
				
                 exclude(ocell,bset[xn,yn]);
		         include(Acell,bset[xn,yn]);
				 
                if k = 0 then
                 begin

                  techwrite[g,0]:=[1];
				  techwrite[g,1]:=[0];
				  techwrite[g,2]:=[Bset[xn,yn]];
				  techwrite[g,3]:=[n];				  
                  techwrite[g,n+3]:=peer[rset[xn,yn]] * digitcell[n];                  
                  G:=g+1;
                  setlength(techwrite,g+1,14);


                  end;

             end;


       end;

    if k = 0 then
     chaindisplay(#59,G);

end;  {hidden singles}
