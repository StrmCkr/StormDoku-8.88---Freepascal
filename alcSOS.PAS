procedure AlCsos(k:integer);  
var
alsa,nlsb,xn,xn2,count,count2:integer; 
yn2,yn4:numberset;
yn,yn3:nums;
begin
writexy(2,60,'active');

alsfinder;
ahsfinder;

nlsfinder;
hlsfinder;

for alsA:= low(ahs) to (high(ahs)) do {als A}
begin 
 writexy(2,61,'als a started');
  for nlsb:= low(nls) to (high(nls)) do {als b} 
 begin 
  writexy(2,62,' als b started ');
   count:=0;
   count2:=0;
  
 xn:=ahs[alsa,0]; {sector a}
 xn2:=nls[nlsb,0]; {sector b}

yn:=comboset[ahs[alsA,3]]; {digits a}
yn3:=comboset[nls[nlsb,3]]; {digits b}
				
yn2:=sectorrcb[xn,ahs[alsa,4]]; {cells a}
yn4:=sectorrcb[xn2,nls[nlsb,4]]; {cells b}

count:=popcnt(dword(yn))+popcnt(dword(yn3));
for x in (yn+yn3) do
 inc(count2);

if count = count2 then writexy(2,63,'active alc-sos'); 
 end;
 end; 
end; 
