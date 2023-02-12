procedure Cellcombo;      { builds a list of active cells for specific comboset}
var
xn,n,j:integer;

begin

setlength(combocell,0);
setlength(Combocell,511);

setlength(Combosubset,0);
setlength(Combosubset,511);

setlength(Combonum,0);
setlength(Combonum,511);

setlength(HCombonum,0);
setlength(HCombonum,511);

   for xn:= 0 to 510 do
  begin
  
   for n in [0..26] do
    begin
	
    for j in comboset2[xn] do
	 combonum[xn,n]:=combonum[xn,n] + SectorRC[n,j];
	
	 for j in comboset[xn] do
	  Hcombonum[xn,n]:=Hcombonum[xn,n] + RNSector[n,j];

	end;	

for n in ocell do
   begin

     if (pm[n] * comboset[xn] = pm[n]  )
      and (pm[n] - comboset[xn] = [])
      and (pm[n] <> [])
       then
        include(combocell[xn],n);

     if (pm[n] * Comboset[xn] <> [] )
     and( pm[n] <> [])
      then
       include(combosubset[xn],n);
      end;


     end;

end;