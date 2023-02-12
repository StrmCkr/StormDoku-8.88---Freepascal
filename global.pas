const
       LEFT    = 12;
       UP      = 4;
       SPACE   = ' ';
       dat_file= 'stormduko.dat'; {save file}
       dat_file2= 'stormdukoPM.dat';{save pm file}
       dat_file3='PolM.dat';{save potential solutions}
       text_file= 'C:\sudoku\generator\Generated.txt';

       COL1   = lightblue; {preset colors}
       COL2   = lightgray;
       COLBG  = black;

 {index reference to the 0-80 cells as relation to Row, col, box grid representation}

  Rx: array[0..80] of integer =
   (0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,
    3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,
    6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8);

  Cy: array[0..80] of integer =
   (0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,
    0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,
    0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8);

  Bxy: array[0..80] of integer =
   (0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,
    3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,
    6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8);

  BxyN: array[0..80] of integer =
   (0,1,2,0,1,2,0,1,2,3,4,5,3,4,5,3,4,5,6,7,8,6,7,8,6,7,8,
    0,1,2,0,1,2,0,1,2,3,4,5,3,4,5,3,4,5,6,7,8,6,7,8,6,7,8,
    0,1,2,0,1,2,0,1,2,3,4,5,3,4,5,3,4,5,6,7,8,6,7,8,6,7,8);

  {quick look up for each space for x,y cordinals}
  Rset: array [0..8,0..8] of integer =
    ( (0,1,2,3,4,5,6,7,8),
    (9,10,11,12,13,14,15,16,17),
    (18,19,20,21,22,23,24,25,26),
    (27,28,29,30,31,32,33,34,35),
    (36,37,38,39,40,41,42,43,44),
    (45,46,47,48,49,50,51,52,53),
    (54,55,56,57,58,59,60,61,62),
    (63,64,65,66,67,68,69,70,71),
    (72,73,74,75,76,77,78,79,80) );

  Cset: array [0..8,0..8] of integer =
    ( (0,9,18,27,36,45,54,63,72),
    (1,10,19,28,37,46,55,64,73),
    (2,11,20,29,38,47,56,65,74),
    (3,12,21,30,39,48,57,66,75),
    (4,13,22,31,40,49,58,67,76),
    (5,14,23,32,41,50,59,68,77),
    (6,15,24,33,42,51,60,69,78),
    (7,16,25,34,43,52,61,70,79),
    (8,17,26,35,44,53,62,71,80) );

   Bset: array [0..8,0..8] of integer =
    ( (0,1,2,9,10,11,18,19,20),
    (3,4,5,12,13,14,21,22,23),
    (6,7,8,15,16,17,24,25,26),
    (27,28,29,36,37,38,45,46,47),
    (30,31,32,39,40,41,48,49,50),
    (33,34,35,42,43,44,51,52,53),
    (54,55,56,63,64,65,72,73,74),
    (57,58,59,66,67,68,75,76,77),
    (60,61,62,69,70,71,78,79,80) );

	{identifies cell based on position in the sector}
    SecSet: array [0..26,0..8] of integer =
    ( {row}
    (0,1,2,3,4,5,6,7,8),
    (9,10,11,12,13,14,15,16,17),
    (18,19,20,21,22,23,24,25,26),
    (27,28,29,30,31,32,33,34,35),
    (36,37,38,39,40,41,42,43,44),
    (45,46,47,48,49,50,51,52,53),
    (54,55,56,57,58,59,60,61,62),
    (63,64,65,66,67,68,69,70,71),
    (72,73,74,75,76,77,78,79,80),
      {col}
    (0,9,18,27,36,45,54,63,72),
    (1,10,19,28,37,46,55,64,73),
    (2,11,20,29,38,47,56,65,74),
    (3,12,21,30,39,48,57,66,75),
    (4,13,22,31,40,49,58,67,76),
    (5,14,23,32,41,50,59,68,77),
    (6,15,24,33,42,51,60,69,78),
    (7,16,25,34,43,52,61,70,79),
    (8,17,26,35,44,53,62,71,80),
    {box}
    (0,1,2,9,10,11,18,19,20),
    (3,4,5,12,13,14,21,22,23),
    (6,7,8,15,16,17,24,25,26),
    (27,28,29,36,37,38,45,46,47),
    (30,31,32,39,40,41,48,49,50),
    (33,34,35,42,43,44,51,52,53),
    (54,55,56,63,64,65,72,73,74),
    (57,58,59,66,67,68,75,76,77),
    (60,61,62,69,70,71,78,79,80) );
	
{looks up a sector,cell and returns its rcb position} {note 9 = blank sice this is not a generated list}
    SecSet2: array [0..26,0..80] of integer =(
(0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,3,4,5,6,7,8),
(0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9,9,9,9,9,9),
(9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9,9,9,9,9),
(9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9,9,9,9),
(9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9,9,9),
(9,9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9,9),
(9,9,9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9,9),
(9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9,9),
(9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8,9),
(9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,1,9,9,9,9,9,9,9,9,2,9,9,9,9,9,9,9,9,3,9,9,9,9,9,9,9,9,4,9,9,9,9,9,9,9,9,5,9,9,9,9,9,9,9,9,6,9,9,9,9,9,9,9,9,7,9,9,9,9,9,9,9,9,8),
(0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8,9,9,9),
(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,1,2,9,9,9,9,9,9,3,4,5,9,9,9,9,9,9,6,7,8)
);	
	{Row/Col/Box position based on sector}
   secRCb: array [0..26] of integer =
   (0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8);

   {Swaps Row/Col/Box identity to sector }
   Rsec: array[0..8] of integer =
   (0,1,2,3,4,5,6,7,8);

   Csec: array[0..8] of integer =
   (9,10,11,12,13,14,15,16,17);

   bsec: array[0..8] of integer =
   (18,19,20,21,22,23,24,25,26);

Slist: array[1..9] of integer =
(0,9,45,129,255,381,465,501,510);
Flist: array[1..9] of integer =
(8,44,128,254,380,464,500,509,510);

type
sector = 0 .. 26;
cell = 0 .. 80;
digits = 1 .. 9;
RCB = 0 .. 8;

numberset = set of cell;   {the grid}
nums =  set of digits;   {digits 1-9}

RCBnums = set of Rcb;  {R,C,B spaces 0 - 8}
RCBpeer = set of sector; {RCB peer sectors}

Sgrid = array of nums;
Sgrid2 = array of nums;
numSector = array of nums;
deletePm = array of nums;
importPM = array of nums;

Cov = array of nums;
cov2 = array of numberset;

Rnumsector = array of array[1..9] of RCBnums;
SectorRowCol = array of array[0..8] of Nums;
Secs = array of array[1..9] of integer;
nakedMarks = array of integer;
pencilmarks = array of nums;

sectornums = array of nums; //[sector] of nums; {function listing all  digits for sector }
solvedsector = array of nums; //[sector] of nums; {function listing all solved digits for sector}

digitcells = array of numberset;
DigitRowColBox = array of array[1..9] of numberset;

BoxnCol = array of array[1..9] of RCBnums;
BoxnRow = array of array[1..9] of RCBnums;
ColnBox = array of array[1..9] of RCBnums;
RownBox = array of array[1..9] of RCBnums;

emptyRecint = array of array[1..9] of RCBnums;

ComboCells = array of numberset;
Combosubsets = array of numberset;

Combonums = array of array[0..26] of nums;
Hcombonums = array of array[0..26] of rcbnums;

Nakedlockedset = array of array of integer;
HiddenLockedset = array of array of integer; 

almostlockedset = array of array of integer;
almosthiddenset = array of array of integer;

strongLk = array of array of array of array[0..11] of numberset;

tech= array of array of numberset;
Var

      X,Y           : integer; {coridinals}
      Grid          : String ; {imported grid string}
	  Grid2         : String ; {imported 2nd grid} 
	  
      Count,Countpm,Scount: integer; {counts the given clues and pms}
      active,unique,table,unique2,zero: boolean;
      ch            : char;
      iter          : integer;
      //variation     : boolean;
	
	  Acell: numberset; {on cells}
	  Ocell: numberset;  { off cells}
	
	  S: sgrid; 	  {the solved grid}
	  S2: sgrid2;      {imported 2nd grid} 
	  NSector: numsector;  { removed sectors by s cells solved }
      delpm: deletepm ; {manual deletion of pencilmarks}
	  Ipm:importpm; {loaded copy of pencilmarks}
	
	   SectorN:sectornums; //[sector] of nums; {function listing all  digits for sector }
       Ssector:solvedsector; //[sector] of nums; {function listing all solved digits for sector}
	
	  covered: cov; //  [cell] of nums;  - technique removals by cell for n
      covered2: cov2; // [digits] of numberset; - technique removals by digits for cells
      
	  coveredact : cov; // techniques removed by cell updated
	  covered2act : cov2; // techniques removed by cell updated
	  
	  techwrite:  tech;  {array holding technique data for writing to screen}

 {builds sets of N size digits/rcb  }
comboset: array [0..510] of nums;        { 1-9 used for digits}
comboset2: array [0..510] of RCbnums;    { 0-8 used for R/C/B & position }

{peer cells} 	
peer: array [cell] of numberset;
peer2: array [cell,0..19] of integer; {a quick call version to use the peers iterativly}

{looks up the sectors a cell is from}
CellSec: array [cell] of RCBpeer; { a quick call version for sectors a cell is in}

{displays all cells for the sector used or not}
 RCBnum: array[sector] of numberset; {RCB call function listing all potential cells for easier use}

 {displays the intersecting sectors for each sector selected}
 peerRCB: array[sector] of rcbpeer; {RCB peer sectors of selected sector}

{displays the sector of a combos set}
 SectorRCB: array[Sector,0..510] of numberset;   {sector by combset2, looks up RCB for the comboset and displays the cells.}
 combosetS: array [sector,0..510] of numberset;  {listing cells for sector based on digit combination set}
 
 secover: array[sector,sector] of RCBnums; {marks which "positions" overlap for 2 sectors}

{hidden sets}
RnSector: RNumSector; // [sector,Digits] of RCBnums;  {saves RCB}

{Mini row/Col}
BnC: BoxnCol;// [Rcb,digits] of RCBnums;   {nums represet  col used in a box  }
BnR: BoxnRow;// [Rcb,digits] of RCBnums;   {nums represet  row used in a box  }

CnB: ColnBox;//  [Rcb,digits] of RCBnums;   {nums represet Box  used inside a col }
RnB: RownBox;// [Rcb,digits] of RCBnums;   {nums represet Box  used inside a row }

{empty rectangle intersection}
ERI:emptyRecint; // [RCB,digits] of RCBnums; {square  x digit saving box }

{Naked sets}
SectorRC:SectorRowCol; //[sector,rcb] of nums; {# in row x col with in sector}

{counts each digit}
Sec:Secs; // [sector,digits] of integer; {exact number of unassigned cells for # givens in a sector}
NM: nakedmarks;  // [cell] of integer; { # of digits found in cell}
PM: pencilmarks; // [cell] of nums;  {pm combined view of nsector - dpm,Ipm,covered,covered2}

{postions listings by area}
 DigitCell: digitcells; //[digits] of numberset; { listing every cell with n candidate}
 DigitRCB: DigitRowColBox;//[sector,digits] of numberset; {RBC function listing active cells for digit N}

{combination sets for cells,sectors}
combocell: ComboCells; //[0..510] of numberset; { combosets in specific cells Naked whole grid}
ComboSubset: Combosubsets; //[0..510] of numberset; {subset combo in specific cells  whole grid}

ComboNum: Combonums;//[0..510,sector] of nums; {sector looking up postion set saving all numbers in those cells} {naked}
HComboNum: Hcombonums; // [0..510,sector] of RCBnums; {sector looking up Digit set saving all position of those cells} {hidden}

{nls & hls data base}
nls: nakedlockedset; {sector,cell size, digit size, position listed by comboset for the sector, digits used listed by comboset}
hls: hiddenlockedset; {sector,cell size, digit size, digits listed by comboset for the sector, position used listed by comboset}

{als & ahs data base}
als: almostlockedset;  {sector,cell size, digit size, position listed by comboset for the sector, digits used listed by comboset}
ahs: almosthiddenset;  {sector,cell size, digit size, digits listed by comboset for the sector, position used listed by comboset}

{link type data base}
Linkset : stronglk; // array [ 0..9][0..6][0..9] of numberset[0..80]//setwise
{digit selected[1..9]} 
{0: bivavel,
1:  2 cells in a sector
2: cell in sector , grouped link to another = all digits in that sector
3: cells in sector, as a grouped link to a single cell = all digits in that sector
4: cells in sector, as a grouped link to a grouped node = all digits in that sector
5: ERI max 
6: ERI all styles
7: ALS}
{ internal data as:
 0 starting digit,
 1 active cell,
 2 linked cells,
 3 link digit,
 4 sector start cells  are in,
 5 sector the link cells are is in.
 6 start - digit swap is applicable 0 = off 
 7 end digit swap is applicable 0 = off 
 8 potential elimination cells ..start cell
 9 potential elimination for  ...end cell
 10 als stuff
 11 als stuff 
 12 - sister link 
 } 


