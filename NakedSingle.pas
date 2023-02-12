{naked singles}
procedure NS(K:integer);
var
xn,n,g:integer;
begin

if k=0 then begin  g:=0; setlength(techwrite,g+1,14); end;

for xn in ocell do //:= 0 to 80 do
   if nm[xn]=1
    then
      begin
       active:=true;

         s[xn]:=SectorRC[Rx[xn],cy[xn]];

         nsector[Rx[xn]]:= nsector[rx[xn]] + SectorRC[Rx[xn],cy[xn]];
         nsector[Cy[xn]+9]:= nsector[cy[xn]+9] + SectorRC[Rx[xn],cy[xn]];
         nsector[Bxy[xn]+18]:= nsector[bxy[xn]+18] + SectorRC[Rx[xn],cy[xn]];
		 
		  exclude(ocell,xn);
		  include(Acell,xn);

         if k = 0
          then
		   for n in SectorRC[Rx[xn],cy[xn]] do
            begin
			      techwrite[g,0]:=[0];
				  techwrite[g,1]:=[0];
                  techwrite[g,2]:=[n];
				  techwrite[g,3]:=[xn];
                  techwrite[g,n+3]:=peer[xn] * digitcell[n];                  
                  G:=g+1;
                  setlength(techwrite,g+1,14);

            end;

      end;

   if k = 0 then
     Chaindisplay(#84,G);

end; {naked singles}