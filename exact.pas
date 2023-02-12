{$ifndef exact_read}
{$define exact_read}

const 
  exact_row = 1;
  exact_col = 2;

type 
  row_bitmap = bitpacked array [0..728] of boolean;
  col_bitmap = bitpacked array [0..728] of boolean;
  ent_bitmap = bitpacked array [0..531440] of boolean;

  pexact_rchead_t = ^exact_rchead_t;
  pexact_lrudrc_t = ^exact_lrudrc_t;

  exact_lrudrc_t = record
    left  : pexact_lrudrc_t;
    right : pexact_lrudrc_t;
    up    : pexact_lrudrc_t;
    down  : pexact_lrudrc_t;
    row   : pexact_rchead_t;
    col   : pexact_rchead_t;
  end;

  exact_rchead_t = record
    links : exact_lrudrc_t;
    id    : longint;
    count : longint;
    b     : longint;
  end;

  exact_t = record
    root  : exact_rchead_t;

    rchead_count : longint;
    lrudrc_count : longint;

    rchead_chunk : pexact_rchead_t;
    lrudrc_chunk : pexact_lrudrc_t;

    rowid_to_rowhead : ^longint;
    colid_to_colhead : ^longint;

    rowid_map : ^row_bitmap;
    colid_map : ^col_bitmap;
    entry_map : ^ent_bitmap;

    num_cols : longint;
    num_rows : longint;
    sum_b    : longint;

    simple   : longint;

    can_declare           : longint;
    iteration_in_progress : longint;
    lock                  : longint;

    level                 : longint;
    soln_stack            : ^longint;
    soln_stack_capacity   : longint;
    num_push              : longint;
    col_stack             : pointer;
    filter_pos            : ^longint;
    filter_stack          : pointer;
    filter_stack_capacity : longint;

    cache                  : pexact_rchead_t;
    cache_branching_factor : longint;

    level_f               : pointer;
    level_p               : pointer;
    filter_f              : pointer;
    filter_p              : pointer;
  end;

  pexact_t  = ^exact_t;

  exact_level_t = function (param : longint; sz : longint; var soln : array of longint) : longint; cdecl;
  exact_filter_t = function (param : longint; sz : longint; var soln : array of longint; colid : longint) : longint; cdecl;

  pexact_filter_t  = ^exact_filter_t;
  pexact_level_t  = ^exact_level_t;

function exact_alloc: pexact_t; cdecl; external;
procedure exact_free (e:pexact_t); cdecl; external;
procedure exact_reset (e:pexact_t); cdecl; external;
function exact_declare_row (e:pexact_t; i:longint; b:longint): longint; cdecl; external;
function exact_declare_col (e:pexact_t; j:longint; u:longint): longint; cdecl; external;
function exact_declare_entry (e:pexact_t; i:longint; j:longint): longint; cdecl; external;
function exact_declare (e:pexact_t; nh:longint; nv:longint; h:plongint; v:plongint): longint; cdecl; external;
function exact_can_declare (e:pexact_t): longint; cdecl; external;
function exact_solve (e:pexact_t; n:plongint): plongint; cdecl; external;
function exact_reset_solve (e:pexact_t): longint; cdecl; external;
function exact_is_row (e:pexact_t; i:longint): longint; cdecl; external;
function exact_is_col (e:pexact_t; j:longint): longint; cdecl; external;
function exact_is_entry (e:pexact_t; i:longint; j:longint): longint; cdecl; external;
function exact_num_rows (e:pexact_t): longint; cdecl; external;
function exact_num_cols (e:pexact_t): longint; cdecl; external;
function exact_get_rows (e:pexact_t; i:plongint): longint; cdecl; external;
function exact_get_cols (e:pexact_t; j:plongint): longint; cdecl; external;
function exact_push (e:pexact_t; j:longint): longint; cdecl; external;
function exact_pop (e:pexact_t): longint; cdecl; external;
function exact_pushable (e:pexact_t; j:longint): longint; cdecl; external;
function exact_can_push (e:pexact_t): longint; cdecl; external;
function exact_num_push (e:pexact_t): longint; cdecl; external;
function exact_get_push (e:pexact_t; j:plongint): longint; cdecl; external;
function exact_level (e:pexact_t; l:pexact_level_t; p:longint): longint; cdecl; external;
function exact_filter (e:pexact_t; f:pexact_filter_t; p:longint): longint; cdecl; external;
function exact_check (e:pexact_t): longint; cdecl; external;

{$endif}
