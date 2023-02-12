{place imported 81 char string onto Grid}
procedure Arange;
var

xa,N:integer;
dig:string;
dig3,dig2: integer;

begin
N:=0;
 for xa:=0 to 80 do
   begin
    inc(n);
    dig:=grid[n];
    val(dig,dig3,dig2);

    if dig3 <>0
      then
	   begin
      S[xa]:=[dig3];
      include(nsector[Rx[xa]],dig3);
	  include(nsector[Cy[xa]+9],dig3);
	  include(nsector[Bxy[xa]+18],dig3);
        exclude(ocell,xa);
		include(Acell,xa);
	  end;
        end;

end;

{loads a grid from a txt file}
procedure import;
var
myfile:text;
ior:integer;
filename:string;
verifygrid:integer;
Begin

initiate;

repeat
      repeat
      writexy(2,26,'                                       ');
      writexy(2,26, 'file path ');
       readln(filename);
           if (filename = ('')) or (filename = ('exit'))
            then exit
           else
        writexy(2,27,'                                       ');
        writexy(2,28,'                                       ');
        assign(myfile,filename);
        ior:= 0;
        {$I-}
        reset(myfile);
        {$I+}
        IOR:=ioresult;

      if Ior <> 0
      then
      writexy(2,27,'file not found')
      else
       begin
        textcolor(yellow );
        writexy(2,15,'Import');
        delay(300);
        writexy(2,15,'       ');
        textcolor(col2);
       end;

      until IoR = 0;
      read(myfile,grid);
      close(myfile);

Verifygrid:= length(Grid);

if( verifygrid <> 81) then
   writexy(2,28,'incorrect string size => <> 81 ');
until verifygrid=81;

if verifygrid=81
  then
   begin
   Arange;
   sbrc;
   wpm(1,0,0);
   end;
      writexy(2,26,'                                       ');
end;


procedure Arange2;
var

xa,N:integer;
dig:string;
dig3,dig2: integer;

begin
N:=0;
 for xa:=0 to 80 do
   begin
    inc(n);
    dig:=grid2[n];
    val(dig,dig3,dig2);

    if dig3 <>0
      then
	   begin
      S2[xa]:=[dig3];
      {include(nsector[Rx[xa]],dig3);
	  include(nsector[Cy[xa]+9],dig3);
	  include(nsector[Bxy[xa]+18],dig3);
        exclude(ocell,xa);
		include(Acell,xa);}
	  end;
        end;

end;

{loads a grid from a txt file}
procedure import2;
var
myfile:text;
ior:integer;
filename:string;
verifygrid:integer;
Begin
setlength(s2,81);
repeat
      repeat
      writexy(2,26,'                                       ');
      writexy(2,26, 'file path ');
       readln(filename);
           if (filename = ('')) or (filename = ('exit'))
            then exit
           else
        writexy(2,27,'                                       ');
        writexy(2,28,'                                       ');
        assign(myfile,filename);
        ior:= 0;
        {$I-}
        reset(myfile);
        {$I+}
        IOR:=ioresult;

      if Ior <> 0
      then
      writexy(2,27,'file not found')
      else
       begin
        textcolor(yellow );
        writexy(2,15,'Import');
        delay(300);
        writexy(2,15,'       ');
        textcolor(col2);
       end;

      until IoR = 0;
      read(myfile,grid2);
      close(myfile);

Verifygrid:= length(Grid2);

if( verifygrid <> 81) then
   writexy(2,28,'incorrect string size => <> 81 ');
until verifygrid=81;

if verifygrid=81
  then
   begin
   Arange2;
   //sbrc;
  // wpm(1,0,0);
   end;
      writexy(2,26,'                                       ');
end;