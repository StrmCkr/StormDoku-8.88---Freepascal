{2-String Kyte}
procedure kyte(k:integer);
var
n,yn,xn,xa,ya,I,j,xn2,yn2,g:integer;
begin

if k = 0 then begin g:=0; setlength(techwrite,g+1,15); end;
 for n:= 1 to 9 do

    for xa:=0 to 2 do
     for ya:=0 to 2 do
       for I:= 0 to 2 do
         for yn:= (ya*3) to (2+(ya*3)) do     {columns}
          begin
           xn:=(I+(xa*3));    {rows}

           j:= (xa*3)+(ya);    {box}

          if  (DigitRCB[j+18,n] * DigitRCB[xn,n] <> [] )     {mini row contains cells}
          and (DigitRCB[J+18,n] * DigitRCB[yn+9,n] <> [])    {mini col contains cells}
          and ( DigitRCB[xn,n] * DigitRcb[yn+9,n] = [] )     {r&c intersection = []}

          and (DigitRCB[xn,n] - (DigitRCB[j+18,n]*DigitRCB[xn,n]) <> [] )      {row has digits out side the box}
          and (DigitRCB[yn+9,n] - (DigitRCB[j+18,n]*DigitRCB[yn+9,n]) <> [] )   {col has digits out side the box}
          then

          for xn2:= 0 to 8 do
           if ((xn2 div 3 ) <> (xn div 3) )
            then
             for yn2:= 0 to 8 do
              if ((yn2 div 3) <> (yn div 3))

              then
                 if  (   DigitRCB[xn,n] = (   DigitRCB[xn,n] * DigitRCB[j+18,n]) +  (DigitRCB[xn,n] * DigitRCB[yn2+9,n]) )
                 and (   DigitRCB[yn+9,n] = (   DigitRCB[yn+9,n] * DigitRCB[j+18,n]) +  (DigitRCB[yn+9,n] * DigitRCB[xn2,n]) )
				 and ((DigitRCB[xn2,n] * DigitRCB[yn2+9,n]) <> [])
                 then
                  begin
                  active:= true;

                  covered2[n]:= covered2[n] + (DigitRCB[xn2,n] * DigitRCB[yn2+9,n]);

				   if (k = 0)
				   then
				    begin
					techwrite[g,0]:=[2];
					techwrite[g,1]:=[1];
					techwrite[g,2]:=[n];
					techwrite[g,3]:=[yn+9] + [xn];					
                    techwrite[g,4]:=[j+18] + [xn2] + [yn2+9];
					
					techwrite[g,n+4]:= (DigitRCB[xn2,n] * DigitRCB[yn2+9,n]);
					
					g:=g+1;
					setlength(techwrite,g+1,15);
					end;
					
                 end;

          end;

if k = 0 then chaindisplay(#66,g); 		
				
end; {2-string kite}