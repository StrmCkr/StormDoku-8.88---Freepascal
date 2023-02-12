procedure Help; {info menu}
begin
  textcolor(lightred);
  writexy(2, 2,'Box Row Col Cell');
  writexy(42,2,'Sectors');
  textcolor(67);
  writexy(2,5,'choice');
  textcolor(24);
  writexy(12,23,'Givens:');
  writexy(12,24,'Unsolved:');
  writexy(12,25,'PMs:');

  textcolor(green);
  writexy(26,23,'ESC : Exit');

  textcolor(67);
  writexy(58,1,'Keystroke');

  textcolor(24);
  writexy(51,2,'Movement:');

  textcolor(green);
  writexy(50,3,'Arrows    - Direction');
  writexy(50,4,'Home      - Goto Col 1 on Row');
  writexy(50,5,'End       - Goto Col 9 on Row');
  writexy(50,6,'Page up   - Goto Row 1 on Col');
  writexy(50,7,'Page down - Goto Row 9 on Col');
  writexy(50,8,'Backspace - Delete # in cell');
  writexy(50,9,'Delete    - Delete # in cell');
  Writexy(50,10,'Tab       - Switch PM | Grid');
  writexy(50,11,'CRTL + \  - Extended Grids');
  writexy(50,12,'1 - 9     - Enter # into cell');

  textcolor(24);
  writexy(51,14,'Functions:');

  textcolor(green);

  writexy(50,15,'`         - Solve');
  writexy(50,16,'~         - Batch solve');
  writexy(50,17,'R         - Reset Grid');
  writexy(50,18,'E         - Empty Pm Grid');
  writexy(50,19,'Ctrl  + S - Save Grid String');
  writexy(50,20,'S         - Save Pm state');
  writexy(50,21,'Shift + L - Load Saved Grid');
  writexy(50,22,'L         - Load Saved Pm');
  writexy(50,23,'I         - Import a Grid');
  writexy(50,24,'C         - Isomorphic');
  writexy(50,25,'Crtl  + Q - Automorphic');
  writexy(50,26,'P         - P.O.M');
  writexy(50,27,'Crtl  + G - Generate');  
  writexy(50,28,'Shift + F - Dancing Links');
  writexy(50,29,'Crtl  + ? - Copyright');
  // writexy(50,30,'CRTl  + F - Brute Force');

  textcolor(24);

 writexy(85,1,'Starter Techniques:');
  textcolor(green);
  writexy(81,2,'F1          - Hidden Single');
  writexy(81,3,'Shift + F1  - Naked Single');
  writexy(81,4,'F3          - Hidden Pair');
  writexy(81,5,'Shift + F3  - Naked Pair');
  writexy(81,6,'F4          - Hidden Triple');
  writexy(81,7,'SHift + F4  - Naked Triple');
  writexy(81,8,'F5          - Hidden Quad');
  writexy(81,9,'Shift + F5  - Naked Quad');

  textcolor(24);
  writexy(85,11,'Fish Techniques:');
  textcolor(green);

  writexy(81,12,'F2          - Box Line Reduction');
  writexy(81,13,'Shift + F2  - X - Wing');
  writexy(81,14,'F6          - Skyscraper');
  writexy(81,15,'F7          - Empty Rectangle');
  Writexy(81,16,'F8          - 2-String Kyte');
  writexy(81,17,'F9          - Sword Fish');
  writexy(81,18,'F10         - Jelly Fish');
  writexy(81,19,'Crtl + T    - Finned/Sashimi Xwing');
  writexy(81,20,'Shift + F9  - Finned/Sashimi Sword');
  writexy(81,21,'Shift + F10 - Finned/Sashimi Jelly');

   //writexy(81,30,'T          - N x N Fish');

  textcolor(24);
  writexy(85,23,'Bent Subset Techniques:');
  textcolor(green);
  writexy(81,24,'Shift + F6  - XY - Wing');
  writexy(81,25,'Shift + F7  - XYZ - Wing');
  writexy(81,26,'Shift + F8  - WXYZ - Wing');

  writexy(81,28,'B           - Barns');

  textcolor(24);
  writexy(120,27,'Subset Techniques:');
  textcolor(green);

  writexy(116,28, 'D          - Sue De Coq');
  writexy(116,29, 'Shift + E  - Death Blossom');
  writexy(116,30, 'J          - D.D.S');
  writexy(116,31, 'O          - A.D.D.S');

  textcolor(24);
  writexy(160,17,'Cover Set Techniques:');
  textcolor(green);
  writexy(156,18,'F          - N x ( N + K ) Fish');
  writexy(156,19,'M          - SK Loop');
  writexy(156,20,'Shift + J  - Muti Sector Locked Set');
  gotoxy(156,21); write(char(#39));
  writexy(157,21,'          - ALC - SOS');

  textcolor(24);
  writexy(120,1,'Named Chain Techniques:');
  textcolor(green);

  writexy(116,2, 'F11         - W - Wing & Ring');
  writexy(116,3, 'Shift + F11 - M - Wing & Ring');
  writexy(116,4, 'F12         - S - Wing');
  writexy(116,5, 'Shfit + F12 - L2 - Wing');
  writexy(116,6, 'Crtl  + F12 - L3 - Wing'); 
  writexy(116,7, 'Crtl  + F1  - Strong - Wing & Ring');  
  writexy(116,8, 'Crtl  + F2  - H 1 - Wing');
  writexy(116,9, 'N           - H 2 - Wing');
  writexy(116,10,'Shift + N   - H 3 - Wing');
  writexy(116,11,'Crtl  + N   - H 4 & 5 - Wing');
  writexy(116,12,'Crtl  + F11 - iW - Wing & Ring');

  textcolor(24);
  writexy(160,1,'Chain Techniques:');
  textcolor(green);
  writexy(156,2,'Crtl + X    - X - Chain ');
  writexy(156,3,'X           - XY - Chain'); 
  writexy(156,4,'Crtl + Z    - A.I.C ');
  writexy(156,5,'Crtl + K    - ALS  - Chain');
  writexy(156,6,'Crtl + M    - A.I.C + ALS - Chain'); 

  textcolor(24);
  writexy(160,8,'Symetrical Placement Techniques: semi functioning');
  textcolor(green);
  writexy(156,9, 'Crtl + J     -Fixed Boxes');
  writexy(156,10,'Crtl + F     -Boxes move in bands');
  writexy(156,11,'Crtl + P     -Boxes move Triangular');
  writexy(156,12,'Crtl + U     -Rotational Symmetries');
  writexy(156,13,'Crtl + R     -Diagonal Symmetries');
  writexy(156,14,'Crtl + E     -Stick Symmetries');
  writexy(156,15,'*            -All Symmetries');
  writexy(156,16,'#            -Issomoporh/automorph');

  textcolor(24);
  writexy(120,15,'Almost locked Sets Techniques:');
  textcolor(green);

  writexy(116,16,'A           - ALS  - XZ rule ');
  writexy(116,17,'H           - AHS  - XZ rule ');
  writexy(116,18,'Y           - ALS  - XY rule ');
  writexy(116,19,'Crtl + Y    - AALS - 2RC rule');
  writexy(116,20,'Crtl + V    - N^ALS - N^RC rule');
  
  textcolor(24);
  writexy(120,22,'Named ALS + Chain Techniques:');
  textcolor(green);
  
  writexy(116,23,'Crtl + W    - ALS  - W - Wing & Ring');
  writexy(116,24,'Crtl + A    - ALS  - M - Wing & Ring');
  writexy(116,25,'Crtl + D    - ALS  - S - Wing & Ring');
 

  textcolor(24);
  writexy(160,23,'Transport  Techniques:');
  textcolor(green);
  writexy(156,24,'Z           - T - XY - Wing');
  writexy(156,25,'U           - T - XYZ - Wing');
  writexy(156,26,'Q           - T - WXYZ - Wing');
  writexy(156,27,'T           - T - Barns');
  writexy(156,28,'W           - T - XY-Chain');
  writexy(156,29,'G           - T - ALS-XZ');
  writexy(156,30,'K           - T - ALS-XY');
  writexy(156,31,'V           - T - A.D.D.S');

  writexy(50,54,' PM keystroke ');
  textcolor(24);
  writexy(39,55,'Movment:');
  textcolor(green);
  writexy(39,56,'Arrows    - Direction');
  writexy(39,57,'Home      - Goto Col 1 on Row');
  writexy(39,58,'End       - Goto Col 9 on Row');
  writexy(39,59,'Page up   - Goto Row 1 on Col');
  writexy(39,60,'Page down - Goto Row 9 on Col');
  writexy(39,61,'Backspace - Resets PM #s in cell');
  writexy(39,62,'Delete    - Resets PM #s in cell');
  writexy(39,63,'1 - 9     - Delete # from cell');
  
  textcolor(67);
  writexy(162,61,'Technique Trace ');
  textcolor(24);
  writexy(162,62,'Movment:');
  textcolor(green);
  writexy(162,63,'+          - Next in list');
  writexy(162,64,'-          - Previous in List');
  writexy(162,65,'Enter      - Exit List');
  writexy(162,66,'Colour     =');
  textcolor(3); write(' Digit,');
  textcolor(6); write(' Sector,');
  textcolor(9); write(' Cell,');
  textcolor(red); write(' Exclusion Cell ');

 { textcolor(darkgray);
  writexy(76,56,'Copyright © Strmckr 2009 ->> 2023');
  writexy(72,57,'This program is free software: you can ');
  writexy(72,58,'redistribute it and/or modify it under the');
  writexy(72,59,'terms of the GNU general public License');
  writexy(72,60,'This program is distributed without any ');
  writexy(72,61,'warrenty; without even the implied warranty');
  writexy(72,62,'of Merchantability or fitness for a ');
  writexy(72,63,'particular purpose. See the GNU general');
  writexy(72,64,'public license for more details.  ');
  writexy(72,65,'< http://www.gnu.org/licenses/gpl-3.0.html > ');
  textcolor(col2);}
end;
