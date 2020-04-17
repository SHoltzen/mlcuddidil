(* File generated from hash.idl *)

type hash__t

external _create : int -> int -> hash__t
	= "camlidl_hash__create"

external arity : hash__t -> int
	= "camlidl_hash_arity"

external clear : hash__t -> unit
	= "camlidl_hash_clear"


let (table:t Weak.t ref) = ref (Weak.create 32)

let create ?(size=2) arity =
  let hash = _create arity size in
  let index = ref 0 in
  while
    !index < Weak.length !table
    && Weak.check !table !index
  do
    incr index
  done;
  if !index = Weak.length !table then begin
    let newtable = Weak.create (2* !index) in
    Weak.blit !table 0 newtable 0 !index;
    table := newtable;
  end;
  Weak.set !table !index (Some (Obj.magic hash));
  hash

let clear_all () =
  for i=0 to (Weak.length !table)-1 do
    let ohash = Weak.get_copy !table i in
    match ohash with
      | None -> ()
      | Some hash -> clear hash
  done;
  ()

let _ = Callback.register "camlidl_cudd_hash_clear_all" clear_all

