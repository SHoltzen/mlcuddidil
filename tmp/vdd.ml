(* File generated from vdd.idl *)

type vdd__t


(** Public type for exploring the abstract type [t] *)
type +'a vdd =
| Leaf of 'a         (** Terminal value *)
| Ite of int * 'a t * 'a t (** Decision on CUDD variable *)
	


(* ====================================================== *)
(** {3 Extractors} *)
(* ====================================================== *)

external manager : 'a t -> Man.v Man.t = "camlidl_bdd_manager"
external is_cst : 'a t -> bool = "camlidl_bdd_is_cst"
external topvar : 'a t -> int = "camlidl_bdd_topvar"
external dthen : 'a t -> 'a t = "camlidl_add_dthen"
external delse : 'a t -> 'a t = "camlidl_add_delse"
external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_add_cofactors"
external cofactor : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_add_cofactor"
external dval : 'a t -> 'a = "camlidl_cudd_avdd_dval"
external inspect: 'a t -> 'a vdd = "camlidl_cudd_avdd_inspect"

(* ====================================================== *)
(** {3 Supports} *)
(* ====================================================== *)

external support : 'a t -> Man.v Bdd.t = "camlidl_bdd_support"
external supportsize : 'a t -> int = "camlidl_bdd_supportsize"
external is_var_in : int -> 'a t -> bool = "camlidl_bdd_is_var_in"
external vectorsupport : 'a t array -> Man.v Bdd.t = "camlidl_bdd_vectorsupport"
external vectorsupport2 : Man.v Bdd.t array -> 'a t array -> Man.v Bdd.t = "camlidl_add_vectorsupport2"

(* ====================================================== *)
(** {3 Classical operations} *)
(* ====================================================== *)


external cst : Man.v Man.t -> 'a -> 'a t = "camlidl_cudd_avdd_cst"


let _background man : 'a t =  cst man (Obj.magic ())
(** Be cautious, it is not type safe (if you use  {!nodes_below_level}, etc...: you can try to retrieve a constant value of some type and [()] value of the background value will be treated as another type.*)


external ite : Man.v Bdd.t -> 'a t -> 'a t -> 'a t = "camlidl_add_ite"
external ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a t option = "camlidl_cudd_add_ite_cst"
external eval_cst : 'a t -> Man.v Bdd.t -> 'a t option = "camlidl_cudd_add_eval_cst"
external compose : int -> Bdd.vt -> 'a t -> 'a t = "camlidl_add_compose"


external _vectorcompose: Bdd.vt array -> 'a t -> 'a t = "camlidl_add_vectorcompose"
external _vectorcompose_memo : Memo.t -> Bdd.vt array -> 'a t -> 'a t = "camlidl_add_vectorcompose_memo"
let vectorcompose ?memo tbdd add =
  match memo with
  | Some(memo) ->
      let arity = match memo with
	| Memo.Global -> 1
	| Memo.Cache x -> Cache.arity x
	| Memo.Hash x -> Hash.arity x
      in
      if arity<>1 then
	raise (Invalid_argument "Cudd.Add.vectorcompose_memo: memo.arity<>1")
      ;
      _vectorcompose_memo memo tbdd add
  | None ->
      _vectorcompose tbdd add

(* ====================================================== *)
(** {3 Logical tests} *)
(* ====================================================== *)

external is_equal : 'a t -> 'a t -> bool = "camlidl_bdd_is_equal"
external is_equal_when : 'a t -> 'a t -> Man.v Bdd.t -> bool = "camlidl_bdd_is_equal_when"
external is_eval_cst : 'a t -> Man.v Bdd.t -> 'a option = "camlidl_cudd_avdd_is_eval_cst"
external is_ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a option = "camlidl_cudd_avdd_is_ite_cst"

(* ====================================================== *)
(** {3 Structural information} *)
(* ====================================================== *)

external size : 'a t -> int = "camlidl_bdd_size"
external nbpaths : 'a t -> float = "camlidl_bdd_nbpaths"
external nbnonzeropaths : 'a t -> float = "camlidl_bdd_nbtruepaths"
external nbminterms : int -> 'a t -> float = "camlidl_bdd_nbminterms"
external density : int -> 'a t -> float = "camlidl_bdd_density"
external nbleaves : 'a t -> int = "camlidl_add_nbleaves"

(* ====================================================== *)
(** {3 Variable mapping} *)
(* ====================================================== *)

external varmap : 'a t -> 'a t = "camlidl_add_varmap"


external _permute : 'a t -> int array -> 'a t = "camlidl_add_permute"
external _permute_memo : Memo.t -> 'a t -> int array -> 'a t = "camlidl_add_permute_memo"
let permute ?memo vdd permut =
  match memo with
  | Some memo ->
      let arity = match memo with
	| Memo.Global -> 1
	| Memo.Cache x -> Cache.arity x
	| Memo.Hash x -> Hash.arity x
      in
      if arity<>1 then
	raise (Invalid_argument "Cudd.Vdd.permute: memo.arity<>1")
      ;
      _permute_memo memo vdd permut
  | None ->
      _permute vdd permut

(* ====================================================== *)
(** {3 Iterators} *)
(* ====================================================== *)

external iter_cube: (Man.tbool array -> 'a -> unit) -> 'a t -> unit = "camlidl_cudd_avdd_iter_cube"
external iter_node: ('a t -> unit) -> 'a t -> unit = "camlidl_cudd_iter_node"

(* ====================================================== *)
(** {3 Leaves and guards} *)
(* ====================================================== *)

external guard_of_node : 'a t -> 'a t -> Man.v Bdd.t = "camlidl_add_guard_of_node"
external guard_of_nonbackground : 'a t -> Man.v Bdd.t = "camlidl_add_guard_of_nonbackground"


external _nodes_below_level: 'a t -> int option -> int option -> 'a t array = "camlidl_cudd_avdd_nodes_below_level"
let nodes_below_level ?max vdd olevel = _nodes_below_level vdd olevel max


(** Guard of the given leaf *)
external guard_of_leaf : 'a t -> 'a -> Man.v Bdd.t = "camlidl_cudd_avdd_guard_of_leaf"

(** Returns the set of leaf values (excluding the background value) *)
external leaves: 'a t -> 'a array = "camlidl_cudd_avdd_leaves"

(** Picks (but not randomly) a non background leaf. Return [None] if the only leaf is the background leaf. *)
external pick_leaf : 'a t -> 'a = "camlidl_cudd_avdd_pick_leaf"


let guardleafs (vdd:'a t) : (Man.v Bdd.t * 'a) array =
  let tab = leaves vdd in
  Array.map (fun leaf -> (guard_of_leaf vdd leaf,leaf)) tab


(** [fold_guardleaves f d i] applies [f] to the pairs constituted by the leaf values and associated guards in the DD [d]. The initial value for the accumulator is [i], and the visiting order is the same as the one of the array returned by [guardleafs]. *)
external fold_guardleaves : (Man.v Bdd.t -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b = "camlidl_cudd_avdd_fold_guardleaves"


(* ====================================================== *)
(** {3 Minimizations} *)
(* ====================================================== *)

external constrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_add_constrain"
external tdconstrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_add_tdconstrain"
external restrict: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_add_restrict"
external tdrestrict : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_add_tdrestrict"

(* ====================================================== *)
(** {3 Conversions} *)
(* ====================================================== *)
(* ====================================================== *)
(** {3 User operations} *)
(* ====================================================== *)

(**
Two options:
- By decomposition into guards and leafs: see module {!Mapleaf}
- By using CUDD cache: see module {!User}
*)

(* ====================================================== *)
(** {3 Miscellaneous} *)
(* ====================================================== *)

external transfer : 'a t -> Man.v Man.t -> 'a t = "camlidl_add_transfer"

(* ====================================================== *)
(** {3 Printing} *)
(* ====================================================== *)

open Format

let print__minterm print_leaf fmt dd =
  if is_cst dd then print_leaf fmt (dval dd)
  else
    let nb = nbpaths dd in
    if nb > (float_of_int !Man.print_limit) then
      fprintf fmt "dd with %i nodes, %i leaves and %g paths" (size dd) (nbleaves dd) nb
  else begin
    fprintf fmt "@[<v>";
    let first = ref true in
    iter_cube
      (begin fun cube leaf ->
	if not !first then fprintf fmt "@ " else first := false;
	let str = Bytes.create (Array.length cube) in
	Array.iteri
	  (fun i elt ->
	    Bytes.set str i (match elt with
	      | Man.False -> '0'
	      | Man.True -> '1'
	      | Man.Top -> '-'))
	  cube;
	fprintf fmt "%s -> %a" (Bytes.unsafe_to_string str) print_leaf leaf
      end)
      dd;
    fprintf fmt "@]"
  end

let print print_bdd print_leaf fmt dd =
  if is_cst dd then print_leaf fmt (dval dd)
  else
    let nb = nbpaths dd in
    if nb > (float_of_int !Man.print_limit) then
      fprintf fmt "dd with %i nodes, %i leaves and %g paths" (size dd) (nbleaves dd) nb
  else begin
    let leaves = leaves dd in
    fprintf fmt "{ @[<v>";
    for i=Array.length leaves - 1 downto 0 do
      let leaf = leaves.(i) in
      let bdd = guard_of_leaf dd leaf in
      fprintf fmt "@[<hv>%a IF @[%a@]@]"
	print_leaf leaf print_bdd bdd;
      if i > 0 then
	fprintf fmt ",@ ";
    done;
    fprintf fmt "@] }"
  end

let print_minterm print_id print_leaf formatter dd =
  print (Bdd.print_minterm print_id) print_leaf formatter dd

