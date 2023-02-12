{$include exact.pas}
{$link exact.o}
{$linklib msvcrt}

const 
  undef = -1;

var 
  e : pexact_t;
  nvdlxh, nvdlxe : longint;
  vdlxa : array [0..80] of integer;
  vdlxh : array [0..729+324] of longint;
  vdlxe : array [0..4*729] of longint;

procedure dlx_init_declare ();

var 
  n, r, c, b, d : integer;

begin
  for n := 0 to 728 do
    vdlxh[n] := (exact_col shl 16) or n;

  for n := 0 to 324 do
    vdlxh[729+n] := (exact_row shl 16) or n;

  nvdlxh := 729 + 324;
  nvdlxe := 0;

  for r := 0 to 8 do
    for c := 0 to 8 do
      begin
        b := 3 * (r div 3) + (c div 3);
        for d := 0 to 8 do
          begin
            vdlxe[nvdlxe] := (    (9*r+c) shl 16) or (81*r+9*c+d); inc (nvdlxe);
            vdlxe[nvdlxe] := ( (81+9*r+d) shl 16) or (81*r+9*c+d); inc (nvdlxe);
            vdlxe[nvdlxe] := ((162+9*c+d) shl 16) or (81*r+9*c+d); inc (nvdlxe);
            vdlxe[nvdlxe] := ((243+9*b+d) shl 16) or (81*r+9*c+d); inc (nvdlxe);
          end;
      end;
end;

function dlx_solve (var a : array of integer) : integer;

var 
  n, r, c, d, i : integer;
  sp : ^longint;

begin
  exact_reset (e);
  exact_declare (e, nvdlxh, nvdlxe, vdlxh, vdlxe);

  for r := 0 to 8 do
    begin
      for c := 0 to 8 do
        begin
          if a[9*r+c] <> undef then
            begin
              n := 81*r+9*c+a[9*r+c];
              if (exact_pushable (e, n) = 0) then
                begin
                    {writeln (stderr, 'conflicting input at r', r+1, 'c', c+1, 'd', a[9*r+c]+1);}
                  exit (0);
                end;
              exact_push (e, n);
            end;
        end;
    end;

  sp := exact_solve (e, @n);
  if (sp = nil) then
    exit (0);

  for i := 0 to n-1 do
    begin
      r := sp[i] div 81;
      c := (sp[i] div 9) mod 9;
      d := sp[i] mod 9;
      a[9*r+c] := d;
    end;

  sp := exact_solve (e, @n);
  if (sp <> nil) then
    exit (2);

  exit (1);
end;
