{Timmer for executing solving commands} 
//  command functions
Procedure time(v:char);
var
 st,et,hz:int64;
      ms:double;
begin

setlength(techwrite,0,0);

sbrc;

queryperformancecounter (st);

case v of

#59: Hs(0);
#84: Ns(0);

#61: Hp(0);
#86: Np(0);

#62: Ht(0);
#87: Nt(0);

#63: Hq(0);
#88: Nq(0);

#89: barns(1,3,1,3); {xy-wing}
#90: barns(1,3,2,3); {xyz-wing}
#91: barns(1,4,0,4); {wxyz-wing}

#60: blr(0);

#85: xwing(0);
#20:smashi(0); {finned/sashi x-wings}
#64: sky(0);  {skyscrappers}
#65: er(0);
#66: kyte(0);
#67: Swordfish(0);
#92: smashiswords(0);

#68: jellyfish(0);
#93: smashijelly(0);

#122: transbarns(1,3,1,3); {T-xy-wing}
#117: transbarns(1,3,2,3); {T-xyz-wing}
#113: transbarns(1,4,0,4); {T-wxyz-wing}

#133: Wwing(1);
#137: iWwing(1);
#135: mwing(1);
#134: swing(1);
#136: L2wing(1);
#0138: l3wing(1);

#94: Strongwing(1);

#095: H1wing(1);
#110: H2wing(1);
#78:  H3wing(1);
#14:  H45wing(0);
{

#117: URt12456;
#104: HUR; }

#24: xchain(1);
#120: XYchain(1);
#26: AIC(1); 
#13: AICWals(1);

#97: alsxz(0);
#104: Ahsxz(0);
#121: alsxy(0);
#25: AAls2RC(0);
#11:AlsME(1);
#22:NalsNRC(1);

#23: alsWwing(0);
#1:  alsMwing(0);
#4:  alsSwing(0);
#39: alcsos(0);   

#98: Barns(1,0,0,6);

#116: transbarns(1,0,0,6);
#103: transalsxz(1);
#107: transalsxy(1);

#100: Suedecoq(1,1,2);
#69: DeathBlossom(1,2,3);

#106: DDS(1,0,9);
#111: ADDS(1,0,6);

#109: skloop(1);
#74:  msls(1);

#118: TransADDS(1,0,6);

#119: Transxychain(0);

#102:fishfinder(0,0,0);
//#116: fishfinder2(3,5);

#96:  solve;
//#06: bruteforce;

#99: issomorph('0','s','f'); // manual puzzle swapping. 
#10: Symetricalplacements(#10);// FixedBoxes;
#6:  Symetricalplacements(#6);// BoxesMnBands;
#16: Symetricalplacements(#16);// boxesMTri;
#21: Symetricalplacements(#21);// rotsym;
#18: Symetricalplacements(#22);// diasym;
#5:  Symetricalplacements(#5);//sticks;
#42: Symetricalplacements(#42);//all;
#35: Symetricalplacements(#35);// automorph/issomorph finder;

#112: potential;

end;
      queryperformancecounter (et);
      queryperformancefrequency (hz);

      ms := (et - st) * 1000.0 / hz;
      gotoxy(1,54);
      write( 'Total cpu time = ');
      gotoxy(1,55);
      write(ms:16:8,' millieseconds');

      ms := 1 * 1000.0 / ms;

      gotoxy(1,57);
      write( 'Solving rate = ');
      gotoxy(1,58);
      write(ms:16:8,' puzzles / second');

if active= true
then
 begin
  sbrc; 
  errorcheck;
  wpm(0,0,0);
 
 end;

if v =#96 then wpm(0,0,0);
if v = #99 then wpm(1,0,0);
end;