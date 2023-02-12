procedure msls(k:integer);
var
a,b,c,d,e,f,g,h,j,yn,n,u:integer;
home,away:nums;
count,count2,count3:integer; 
cvrd,homeset,awayset:numberset; 

begin
cellcombo; 
if k=1 then begin  u:=0; setlength(techwrite,u+1,18); end;
for e in [0..23]  do {home set} 
 for f in [e+1..24]do {home set}
 if RCBnum[e] * rcbnum[f] = [] then
   for g in [f+1..25] do {home set}
   if (RCBnum[e] + rcbnum[f])* rcbnum[g] = [] then
    for h in [g+1..26]do {home set} 
	 if (RCBnum[e] + rcbnum[f]+rcbnum[g])* rcbnum[h] = [] then
	
for yn:= 129 to 254 do  {home set}

 if ((ssector[e]+ssector[f]+ssector[g]+ssector[h]) * comboset[yn] = comboset[yn])
and (popcnt(dword(Ssector[e] * comboset[yn])) =2)
and (popcnt(dword(Ssector[f] * comboset[yn])) =2)
and (popcnt(dword(Ssector[g] * comboset[yn])) =2)
and (popcnt(dword(Ssector[h] * comboset[yn])) =2)

 then  
   
 for a in[0..22] -[e,f,g,h] do  {away set}  
  for b in [a+1..23]-[e,f,g,h] do{away set} 
   if RCBnum[a] * rcbnum[b] = [] then
 
   for c in [b+1..24]-[e,f,g,h] do{away set} 
   if (RCBnum[a] + rcbnum[b])* rcbnum[c] = [] then
   
    for d in [c+1..25] -[e,f,g,h]do{away set} 
	 if (RCBnum[a] + rcbnum[b]+rcbnum[c])* rcbnum[d] = [] then

      for j in [d+1..26] -[e,f,g,h]do{away set} 
	   if (RCBnum[a] + rcbnum[b]+rcbnum[c]+rcbnum[d])* rcbnum[j] = [] then	 
 begin 
 home:=comboset[yn];
away:=[1..9] - comboset[yn];
 Awayset:=(rcbnum[a] +  rcbnum[b] + rcbnum[c] + rcbnum[d]+rcbnum[j]);
 homeset:=(rcbnum[e] +  rcbnum[f] + rcbnum[g] + rcbnum[h]);
 cvrd:=homeset*awayset; 
   
 if  combocell[510] * cvrd = cvrd 
 then  

  begin

 count:=popcnt(dword((away-Ssector[a])))+
        popcnt(dword((away-Ssector[b])))+
		popcnt(dword((away-Ssector[c])))+
		popcnt(dword((away-Ssector[d])))+
		popcnt(dword((away-Ssector[j]))) ;
		
// if count > 0 then write(count);
 
 count2:=popcnt(dword((home*Ssector[e])))+
         popcnt(dword((home*Ssector[f])))+
         popcnt(dword((home*Ssector[g])))+
		 popcnt(dword((home*Ssector[h])));
 //if count2 > 0 then write(' ',count2); 
    
 count3:=0; 
 
 for N in cvrd  do 
   inc(count3);
   
 if (count + count2 = count3 )and (count3 > 0)
  then 
   begin 
  // writexy(2,62,'msls ');
    active:=true; 
	
for n in home do
	  begin 
	  covered2[n]:=covered2[n] + (homeset-cvrd); 
	  if k = 1 then techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n] *(homeset-cvrd)); 
	  end; 
 	
    for n in away do 
	 begin
      covered2[n]:=covered2[n] + (awayset -cvrd);
     if k = 1 then techwrite[u,n+7]:=techwrite[u,n+7] + (digitcell[n] *(awayset-cvrd)); 
	 end;
	 
if (k = 1) and (techwrite[u,1+7]+ (techwrite[u,2+7])+ (techwrite[u,3+7] )
+ (techwrite[u,4+7] ) + (techwrite[u,5+7])+ (techwrite[u,6+7] )
+ (techwrite[u,7+7] ) + (techwrite[u,8+7])+ (techwrite[u,9+7] ) <> [])
 then 
 
   begin
   	techwrite[u,0]:=[5];
	techwrite[u,1]:=[4];
	
	techwrite[u,2]:=home; 
	techwrite[u,3]:=[e,f,g,h];
	techwrite[u,4]:=away;
	techwrite[u,5]:=[a,b,c,d,j];
	
	techwrite[u,6]:=[count+count2];
	techwrite[u,7]:=[count3];
	
	u:=u+1;
	setlength(techwrite,u+1,18);   
   
   end;	 
   end;    
  
end;
end; 
if k = 1 then chaindisplay(#74,u);
end;{msls}
