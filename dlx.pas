procedure DLX; {code provied by Paul from http://forum.enjoysudoku.com/member2928.html}
var 
xn,n:integer;

begin
  e := exact_alloc ();
  dlx_init_declare ();

for xn:=0 to 66 do
For n:=0 to 14 do
 begin
gotoxy(118+xn,35+n);
write(space);
end;

for xn in [0..80] do    
      begin      
       
        vdlxa[xn] := undef;		

        if (s[xn] <> [] ) then
          begin
		  
		   for n in s[xn] do            
            vdlxa[xn] := n-1;
          end;
      end;
 	
	if (dlx_solve (vdlxa) <> 1) then
        begin
          unique2:= false; 
          if dlx_solve(vdlxa) = 0 then zero:=true; 		  
          exit;
        end 
	   else
	    begin
         unique2:=true;
         zero:=false; 
       end; 		 

  
if unique2 = true then 
begin
 textcolor(10);
writexy(118,35,'DLX Unique Solution:');
textcolor(8);
for xn:= 0 to 8 do
 BEGIN 
  gotoxy(118,37+xn); 
 for n:= 0 to 8 do 
    write(vdlxA[XN*9+N]+1);
END; 
	end; 
  textcolor(col2); 
  
end; 