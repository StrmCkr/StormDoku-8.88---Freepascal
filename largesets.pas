 
 {$mode objfpc}{$inline on}
 
    { A simple way to implement large or huge sets.
     (c) 2019 Thaddy de Koning. No license and not
     re-licensable: free for all to use.
     Copyright holds:
     You can not claim license nor copyrigths 
	 }
	 {* added by strmck 2022}
    unit largesets;
    { Operator      Action
      ---------------------------------------------
      +             Union
      -             Difference
      *             Intersection
      ><        Symmetric difference
      <=        Contains
	  >=        Left hand side set is a superset of the one on the right *
       = 	     equality:  use function  equality( which does (><) and evaultes if its empty)*
       <>        inequality:  use function inequality( which does (><) and evaulates if its not empty)*
      include2   Include an element in the set
      exclude2   Exclude an element from the set
      in         Check if an single element is in a set
   
   notes: Twordset can be modifed for Tdwordset/Tqwordset 
   include & exclude renamed to allow for inherinted function include/exclude to function normally 
   }
    interface
    uses
      generics.collections;
     
    type
      TWordSet  = specialize TSortedHashSet<word >; 
	    
      { union }
      operator + (const a,b:TWordset):TWordSet;   
     
      { difference }
      operator - (const a,b:Twordset ):TWordSet;   
     
      { intersection }
      operator * (const a,b:TwordSet ):TWordSet;  
     
      { symmetric difference }
      operator >< (const a,b:TWordSet ):TWordSet;
   
      { contains }
      operator <= (const a,b:TWordSet ):Boolean;
  
        { Left hand side set is a superset of the one on the right }
      operator >= (const a,b:TWordSet ):Boolean; 	  
	 	
      { in }
      operator in (const a:word; const b:TWordset ):Boolean;  
     
      { include }
      procedure include2(const a:TWordSet; const b:Word);  
     
      { exclude }
      procedure exclude2(const a:TWordSet;const  b:Word);    
     
	 function Equality(const A,B:TWordSet):Boolean;
	 function inEquality(const A,B:TWordSet):Boolean;
	 
    implementation 
 Var 
  D: TwordSet; 
  
      { union }
      operator + (const a,b:Twordset):TWordSet;
      begin 
	  d.Free; 
	  D := TWordSet.Create;
	    D.unionWith(A);
		D.unionWith(B);      
        Result := D;		
      end;      
         
      { difference }
      operator -(const a,b:Twordset):TWordSet;
      begin
	   d.Free; 
	    D := TWordSet.Create;
	    D.unionWith(A);
		D.ExceptWith(B);        
        result:=D;
      end;    
         
      { intersection }
      operator *(const a,b:TwordSet):TWordSet;
      begin
	  d.Free; 
	  D := TWordSet.Create;
	  D.unionWith(a);
	  D.IntersectWith(b);      
        Result := D;
      end;         
     
      { symmetric difference }
      operator ><(const a,b:TWordSet):TWordSet;
      begin
	  d.Free; 
	  D := TWordSet.Create;
	  D.unionWith(a);
	  D.SymmetricExceptWith(b);       
        Result := D;
      end;         
     
      { contains }
      operator <=(const a,b:TWordSet):Boolean;
      var
        c:word;
      begin
        Result := true;
        for c in a do
        if not b.contains(c) then
        begin
          Result := False;
          break;
        end;
      end;    
    	  
      { Left hand side set is a superset of the one on the right }
      operator >=(const a,b:TWordSet):Boolean;
      var
        c:word;
      begin
        Result := true;
        for c in b do
        if not a.contains(c) then
        begin
          Result := False;
          break;
        end;
      end;	
	  
 {equality} { first checks if either set has diffrent values} 
 Function Equality(const A, B: TWordSet): Boolean;
var 
  c:word;
begin
d.Free; 
Result := true;
D := TWordSet.Create;
D.unionWith(a);
D.SymmetricExceptWith(b);              
  for c in D do
     begin  
    result:= False; 
      break;	
  	end; 	
end;

 Function inEquality(const A, B: TWordSet): Boolean;
var 
  c:word;
begin
d.Free; 
Result := false;
D := TWordSet.Create;
D.unionWith(a);
D.SymmetricExceptWith(b);             
  for c in D do
     begin  
    result:= True; 
      break;	
  	end; 	
end;		
      { in }
      operator in (const a:word;const b:TWordset):Boolean;
      begin
        Result := b.Contains(a);
      end; 
     
      { include }
      procedure include2(const a:TWordSet;const b:Word);
      begin
        a.Add(b);
      end;    
          
      { exclude }
      procedure exclude2(const a:TWordSet;const b:Word);
      begin
        a.Remove(b);
      end;     
     
  {counting function}    
function GetCount(const aSet: TWordSet): SizeInt;
  begin
    Exit(aSet.Count);	
    end;
	
end.