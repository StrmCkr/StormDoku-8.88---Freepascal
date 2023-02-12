{batch solve a file}
procedure batch;
var

myfile:text;
ior:integer;
filename:string;
verifygrid:integer;
G2,S2:real;
st,et,hz:int64;
ms:double;

Begin

initiate;
sbrc;
wpm(0,0,0);

G2:=0;
S2:=0;

    repeat;
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

     queryperformancecounter (st);
      repeat
        begin
          initiate;

           readln(myfile,Grid);

           Verifygrid:= length(Grid);

          if verifygrid = 81
            then
             begin			
               arange;
               
			   sbrc; 
			   errorcheck; 
			   
               g2:=g2+1;

          if unique = true
              then 
               solve;

                if sCount=81
                   then
                     s2:=s2+1;

                if (unique = false) then begin wpm(1,0,0); break; end;

                end;

           end;
         until eof(myfile);

        close(myfile);

      queryperformancecounter (et);
      queryperformancefrequency (hz);

      ms := (et - st) * 1000.0 / hz;
      gotoxy(1,54);
      write( 'Total cpu time = ');
      gotoxy(1,55);
      write(ms:16:4,' millieseconds');

      ms := G2 * 1000.0 / ms;

      gotoxy(1,57);
      write( 'Solving rate = ');
      gotoxy(1,58);
      write(ms:16:4,' puzzles / second');

   gotoxy(2,30);
   write('Solved ',round(S2),' | ',round(G2),' Puzzles');

 end;{batch solve} 