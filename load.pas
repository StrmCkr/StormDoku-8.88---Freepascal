{load from  grid only save}
procedure load;
var
F:file of nums;
XL:integer;
begin
initiate;

{$I-}
 assign(f,Dat_file);
 reset(f);
{$I+}

if Ioresult=0 then
 begin
   for xL:=0 to 80 do
    begin
      read (f, S[xl]); 
	  if s[xl] <> [] 
	   then 
	      begin 
      nsector[Rx[xl]]:=nsector[rx[xl]] + s[xl];
      nsector[Cy[xl]+9]:=nsector[cy[xl]+9] + s[xl];
      nsector[bxy[xl]+18]:=nsector[Bxy[xl]+18] + s[xl];
	  
        exclude(ocell,xl);
		include(Acell,xl);
		end;
     end;
     close(f);
 end;
 textcolor(yellow );
        writexy(2,15,'Load Grid');
        delay(300);
        writexy(2,15,'         ');
        textcolor(col2);
end;


{load from gird and pm save}
procedure loadpm;

var
F:file of nums;
XL:integer;

begin
initiate;

{$I-}
 assign(f,Dat_file2);
 reset(f);
{$I+}
 
if Ioresult=0 then
 begin
   for xL:=0 to 80 do
    begin
      read (f, ipm[xl]);
      if popcnt(dword(ipm[xl])) = 8   
       then
	    begin
        S[xl]:=[1..9] - ipm[xl];
		nsector[Rx[xl]]:=nsector[rx[xl]] + s[xl];
        nsector[Cy[xl]+9]:=nsector[cy[xl]+9] + s[xl];
        nsector[bxy[xl]+18]:=nsector[Bxy[xl]+18] + s[xl];
		
        exclude(ocell,xl);
		include(Acell,xl);
		end;        
     end;
     close(f);
 end;
 textcolor(yellow );
        writexy(2,15,'Load PM');
        delay(300);
        writexy(2,15,'       ');
        textcolor(col2);
end;