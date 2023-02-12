{hybrid type 1 wing} 
procedure H1wing(K:integer);
var
n,n2,n3,xn,xn2,xn3,j,j3,j2,g:integer;
begin

if k = 1 then begin g:=0; setlength(techwrite,g+1,26); end;

for n:= 1 to 9 do
 for j:= 0 to 26 do

 if sec[j,n]= 2
  then

   for xn in DigitRCB[j,n] do
    for xn2 in DigitRCB[j,n] -[xn] do
     for j2 in (([rx[xn]] + [Cy[xn]+9] + [bxy[xn]+18])-([j]) ) do
      for n2 in (pm[xn] - [n]) do
       if sec[j2,n2] = 2
         then
          for xn3 in (DigitRCB[j2,n2] - ([xn]+[xn2])) do

           for j3 in  (([rx[xn2]] + [Cy[xn2]+9] + [bxy[xn2]+18]) -([j]+[j2]) ) do
            for n3 in (pm[xn2] - ([n]+[n2]) ) do
             if (sec[j3,n3] <5) and (sec[j3,n3] > 1)  and
              (((DigitRCB[j3,n3] * peer[xn3])  + [xn2])  = DigitRCB[j3,n3] )
               then
                begin
                 active:= true;
				
				 if (pm[xn3] * [n3] <> [])
				  then
				   begin
                   covered2[n3]:= covered2[n3] + [xn3];
			           if k=1 then   techwrite[g,n3+15]:= [xn3];
				   end;

				   if sec[j3,n3] = 2
                   then
				    begin
                      covered2[n2]:=covered2[n2] + ((peer[xn3] * DigitRCB[j3,n3] ) * Digitrcb[j3,n2]);

		 if k = 1 then techwrite[g,n2+15]:= ((peer[xn3] * DigitRCB[j3,n3] )* Digitrcb[j3,n2]);

                    end;

	if (k = 1) and 
	(techwrite[g,1+15] + techwrite[g,15] + techwrite[g,3+15]
	+ techwrite[g,4+15] + techwrite[g,5+15] + techwrite[g,6+15] 
	+ techwrite[g,7+15] + techwrite[g,8+15]+ techwrite[g,9+15] <> [])

					 then
					   begin
			
techwrite[g,0]:=[4];
techwrite[g,1]:=[12];
techwrite[g,2]:=[n3];
techwrite[g,3]:=digitrcb[j3,n3] - [xn2];
techwrite[g,4]:=[xn2];
techwrite[g,5]:=[n3];

techwrite[g,6]:=[n];
techwrite[g,7]:=[xn2];
techwrite[g,8]:=[xn];
techwrite[g,9]:=[n];

techwrite[g,10]:=[n2];
techwrite[g,11]:=[xn];
techwrite[g,12]:=[xn3];
techwrite[g,13]:=[n2];
			   
					    g:=g+1;
						setlength(techwrite,g+1,26);
						end;

                 end;

if k= 1 then chaindisplay(#95,g);

end; {h1 wing}