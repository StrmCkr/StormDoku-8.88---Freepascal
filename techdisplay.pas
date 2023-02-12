{clearing function for writting techniques}

procedure techclear(s:integer);
var
p,q:integer;
begin
for q:=0 to 113 do
For p:=0 to 23 do
 begin
gotoxy(118+q,35+p+s);
write(space);
end;
end;

{writing function for technique sets}

procedure techdisplay(K:char;J:integer);
var
n,q,p:integer;
l:char;
begin

for q:=0 to 66 do
For p:=0 to 14 do
 begin
gotoxy(118+q,35+p);
write(space);
end;

l:=K;
n:= 0;
gotoxy(117,35);
case k of

#65,#102:   begin
       textcolor(10);
	   
	   if l = #65 then writexy(118,35,'Empty Rectangle');	     

       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
		 textcolor(10);
		  if l = #65 then writexy(118,35,'Empty Rectangle');	      
	   
          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);

          gotoxy(118,37);

          write('(');
          textcolor(3);
          for q in techwrite[n,11] do
           write(q);
           textcolor(white);
           write('): Base: ');

           textcolor(6);
           for  p in techwrite[n,0] do
             write(p,' ');

            textcolor(white);
             write('Cover: ');
             textcolor(6);
           for p in techwrite[n,10] do
           write(p,' ');
           textcolor(white);
		    if L = #102 then begin
			textcolor(white);
			if techwrite[n,12] <> [] then begin
             write('Extra Covers: ');
             textcolor(6);
           for p in techwrite[n,12] do
           write(p,' ');
		   end;
           textcolor(white);
		   end;
			
           gotoxy(118,38);		
            write(' =>> ');

          for p:= 1 to 9 do
		  if techwrite[n,p] <> [] then
		  begin
		  gotoxy(118,39+p);
		  textcolor(red);
		  for q in techwrite[n,p] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> '); textcolor(3);write(p);
		  textcolor(white);
		  end;
           gotoxy(118,49);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;


          until (ch =#13)

          end;

      end;

#23: begin
	   textcolor(10);
	 if l = #23  then writexy(118,35,'ALS - W - Wings & Rings');
	

       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
		 textcolor(10);
		 if l = #23  then writexy(118,35,'ALS - W - Wings & Rings');
          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);
          gotoxy(118,37);

if [0] * techwrite[n,17] <> []  then begin 		
Write('Set A) [ ');
textcolor(3); for p in (techwrite[n,0]) do write(p,' '); textcolor(white); write('] @ ' ); {numbers}
textcolor(9); for p in (techwrite[n,11]) do write(p,' '); textcolor(white);   {cells}
gotoxy(118,38);
Write('Set B) [ ');
textcolor(3); for p in (techwrite[n,10]) do write(p,' '); textcolor(white); write('] @ '); {numbers}
textcolor(9); for p in (techwrite[n,12]) do write(p,' '); textcolor(white);  {cells}
gotoxy(118,39);write('RC: ( ');
textcolor(3); for p in (techwrite[n,16]) do write(p,' '); textcolor(white); write(') , linked: ,( '); {numbers}
textcolor(3); for p in (techwrite[n,15]) do write(p,' '); textcolor(white); write(') ' ); {number}
textcolor(9); for p in (techwrite[n,13]) do write(p,' '); textcolor(white); write(' = ' ); {cells}
textcolor(9);  for p in techwrite[n,14] do write(p,' '); textcolor(white); write(' ( ');  {cells}
textcolor(3); for p in (techwrite[n,15]) do write(p,' '); textcolor(white); write(') ' ); {number}
end;

if [1] * techwrite[n,17] <> []  then begin 	
gotoxy(118,40);
textcolor(3); for p in (techwrite[n,19]) do write(p,' '); textcolor(white); write(') ' ); {number}
textcolor(9); for p in (techwrite[n,18]) do write(p,' '); textcolor(white); write(' = ' ); {cells}
textcolor(9); for p in techwrite[n,20] do write(p,' '); textcolor(white); write(' ( ');  {cells}
textcolor(3); for p in (techwrite[n,19]) do write(p,' '); textcolor(white); write(') ' ); {number}	

end;


write(' =>> ');

for p:= 1 to 9 do
		  if techwrite[n,p] <> [] then
		  begin
		  gotoxy(118,40+p);
		  textcolor(red);
		  for q in techwrite[n,p] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> ');textcolor(3); write(p); textcolor(white);
		  end;
	
		
          gotoxy(140,50);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;

          until (ch =#13)
	           end;

end;



#1: begin
	   textcolor(10);
       
	   if l=#1 then writexy(118,35,'ALS - M - Wings & Rings');

       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
		 textcolor(10);
		 if l=#1 then writexy(118,35,'ALS - M - Wings & Rings');

          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);
          gotoxy(118,37);

write('(');  textcolor(3);  for p in techwrite[n,10] do write(p); textcolor(white); write(') - ');
textcolor(9); for p in (techwrite[n,11]) do write(p,' '); textcolor(white); write('-(' );
textcolor(3); for p in (techwrite[n,0]) do write(p); textcolor(white); write(')- ' );
textcolor(9); for p in (techwrite[n,13]) do write(p,' '); textcolor(white); write('=(');
textcolor(3); for p in (techwrite[n,0]) do write(p); textcolor(white); write(')= ');
textcolor(9); for p in (techwrite[n,12]) do write(p,' '); textcolor(white); write('=(');
textcolor(3); for p in (techwrite[n,10]) do write(p); textcolor(white); write(')= ' );
textcolor(9); for p in (techwrite[n,14]) do write(p,' '); textcolor(white); write('- (' );
textcolor(3);  for p in techwrite[n,10] do write(p); textcolor(white); write(')');
write(' =>> ');

for p:= 1 to 9 do
		  if techwrite[n,p] <> [] then
		  begin
		  gotoxy(118,39+p);
		  textcolor(red);
		  for q in techwrite[n,p] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> ');textcolor(3); write(p); textcolor(white);
		  end;
	
		
          gotoxy(118,49);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;

          until (ch =#13)
	           end;
end;

#4: begin
	   textcolor(10);      
      if l=#4 then writexy(118,35,'ALS -Split - Wings');
	
       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
		 textcolor(10);      
      if l=#4 then writexy(118,35,'ALS -Split - Wings');
          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);
          gotoxy(118,37);

textcolor(9); for p in (techwrite[n,12]) do write(p,' '); textcolor(white); write(' =(' );
textcolor(3); for p in (techwrite[n,10]) do write(p); textcolor(white); write(')= ' );
textcolor(9); for p in (techwrite[n,13]) do write(p,' '); textcolor(white); write('-(');
textcolor(3); for p in (techwrite[n,10]) do write(p); textcolor(white); write(')- ');

textcolor(9); for p in (techwrite[n,0]) do write(p,' '); textcolor(white); write('-(');
textcolor(3); for p in (techwrite[n,11]) do write(p); textcolor(white); write(')- ');
textcolor(9); for p in (techwrite[n,14]) do write(p,' '); textcolor(white); write('= (' );
textcolor(3);  for p in techwrite[n,11] do write(p); textcolor(white); write(')= ' );
textcolor(9); for p in (techwrite[n,15]) do write(p,' '); textcolor(white);
write(' =>> ');

for p:= 1 to 9 do
		  if techwrite[n,p] <> [] then
		  begin
		  gotoxy(118,39+p);
		  textcolor(red);
		  for q in techwrite[n,p] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> ');textcolor(3); write(p); textcolor(white);
		  end;
	
		
          gotoxy(118,49);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;

          until (ch =#13)
	           end;


end;



#14: begin
	   textcolor(10);
       writexy(118,35,'Hybrid (Type 4 & 5) - Wings');

       textcolor(8);
       if j = 0 then writexy(118,36,'Found : 0 ');

       if j > 0
        then
         begin
         repeat
		 textcolor(10);
       writexy(118,35,'Hybrid (Type 4 & 5) - Wings');
          textcolor(8);
          writexy(118,36,'Displaying : ');
          write(n+1,' Of ',J,'  ');

          textcolor(white);
          gotoxy(118,37);


write('(' );
textcolor(3); for p in ((techwrite[n,16] -(techwrite[n,11]+ techwrite[n,12])) ) do write(p); textcolor(white); write(')- ' );
textcolor(9); for p in (techwrite[n,14]) do write(p,' '); textcolor(white); write('=(');
textcolor(3); for p in (techwrite[n,11]) do write(p); textcolor(white); write(')= ' );
textcolor(9); for p in (techwrite[n,0]) do write(p,' '); textcolor(white); write('-(' );
textcolor(3); for p in (techwrite[n,11]) do write(p); textcolor(white); write('=');
textcolor(3); for p in (techwrite[n,12]) do write(p); textcolor(white); write(')- ' );
textcolor(9); for p in (techwrite[n,10]) do write(p,' '); textcolor(white);write('=(');
textcolor(3); for p in (techwrite[n,12]) do write(p); textcolor(white); write(')= ' );
textcolor(9); for p in (techwrite[n,15]) do write(p,' '); textcolor(white); write('-(' );
textcolor(3); for p in (techwrite[n,11]) do write(p); textcolor(white);write(')');
write(' =>> ');

for p:= 1 to 9 do
		  if techwrite[n,p] <> [] then
		  begin
		  gotoxy(118,39+p);
		  textcolor(red);
		  for q in techwrite[n,p] do
		  write(q,' ');
		  textcolor(white);
		  write(' <> ');textcolor(3); write(p); textcolor(white);
		  end;
	
		
          gotoxy(118,49);
           ch:=readkey;

if (ch=#43) or (ch=#45 ) then techclear(0);

           if ch=#43 then n:=n+1;
           if ch=#45 then n:=n-1;

           if (n) > j-1 then n:=0;
           if (n) < 0 then n:=j-1;

          until (ch =#13)
	           end;

end;

END;
textcolor(col2);

end;
