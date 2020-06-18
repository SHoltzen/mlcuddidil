(* File generated from add.idl *)

type add__t

(** Public type for exploring the abstract type [t] *)
type add =
| Leaf of float      (** Terminal value *)
| Ite of int * t * t (** Decision on CUDD variable *)



(*  ====================================================== *)
(** {3 For internal use} *)
(*  ====================================================== *)




(*  ====================================================== *)
(** {3 Extractors} *)
(*  ====================================================== *)

(** Returns the manager associated to the ADD *)
external manager : t -> Man.dt = "camlidl_bdd_manager"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsConstant}[Cudd_IsConstant]}. Is the ADD constant ? *)
external is_cst : t -> bool = "camlidl_bdd_is_cst"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_NodeReadIndex}[Cudd_NodeReadIndex]}. Returns the index of the ADD (65535 for a constant ADD) *)external topvar : t -> int = "camlidl_bdd_topvar"

external dthen : add__t -> add__t
	= "camlidl_add_dthen"

external delse : add__t -> add__t
	= "camlidl_add_delse"


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_V}[Cudd_V]}. Returns the value of the assumed constant ADD *)
external dval : t -> float = "camlidl_cudd_avdd_dval"


(** Returns the positive and negative cofactor of the ADD wrt the variable *)
external cofactors : int -> t -> t*t = "camlidl_cudd_add_cofactors"

external cofactor : add__t -> Bdd.bdd__dt -> add__t
	= "camlidl_add_cofactor"


(** Decomposes the top node of the ADD *)
external inspect: t -> add = "camlidl_cudd_avdd_inspect"


(*  ====================================================== *)
(** {3 Supports} *)
(*  ====================================================== *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Support}[Cudd_Support]}. Returns the support (positive cube) of the ADD *)
external support : t -> Bdd.dt = "camlidl_bdd_support"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupportSize}[Cudd_SupportSize]}. Returns the size of the support of the ADD *)
external supportsize : t -> int = "camlidl_bdd_supportsize"

(** [Cuddaux_IsVarIn]. Does the given variable belong to the support of the ADD ? *)
external is_var_in : int -> t -> bool = "camlidl_bdd_is_var_in"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_VectorSupport}[Cudd_VectorSupport]}. Returns the support of the array of ADDs.

Raises a [Failure] exception in case where the array is of size 0 (in such
case, the manager is unknown, and we cannot return an empty support). *)
external vectorsupport : t array -> Bdd.dt = "camlidl_bdd_vectorsupport"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_VectorSupport}[Cudd_VectorSupport]}. Returns the support of the BDDs and ADDs arrays.

Raises a [Failure] exception when both arrays are of size 0 (in such
case, the manager is unknown, and we cannot return an empty support). *)
external vectorsupport2 : Bdd.dt array -> t array -> Bdd.dt = "camlidl_add_vectorsupport2"

(*  ====================================================== *)
(** {3 Classical operations} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addConst}[Cudd_addConst]}. Return a constant ADD with the given value. *)
external cst : Man.dt -> float -> t = "camlidl_cudd_avdd_cst"


let background man = cst man (Man.get_background man)

external ite : Bdd.bdd__dt -> add__t -> add__t -> add__t
	= "camlidl_add_ite"

external ite_cst : Bdd.bdd__dt -> add__t -> add__t -> add__t option
	= "camlidl_add_ite_cst"

external eval_cst : add__t -> Bdd.bdd__dt -> add__t option
	= "camlidl_add_eval_cst"

external compose : int -> Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_compose"


external _vectorcompose : Bdd.dt array -> t -> t = "camlidl_add_vectorcompose"
external _vectorcompose_memo : Memo.t -> Bdd.dt array -> t -> t = "camlidl_add_vectorcompose_memo"
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

(*  ====================================================== *)
(** {3 Variable mapping} *)
(*  ====================================================== *)

external varmap : add__t -> add__t
	= "camlidl_add_varmap"


external _permute : t -> int array -> t = "camlidl_add_permute"
external _permute_memo : Memo.t -> t -> int array -> t = "camlidl_add_permute_memo"
let permute ?memo add permut =
  match memo with
  | Some memo ->
      let arity = match memo with
	| Memo.Global -> 1
	| Memo.Cache x -> Cache.arity x
	| Memo.Hash x -> Hash.arity x
      in
      if arity<>1 then
	raise (Invalid_argument "Cudd.Add.permute: memo.arity<>1")
      ;
      _permute_memo memo add permut
  | None ->
      _permute add permut


(*  ====================================================== *)
(** {3 Logical tests} *)
(*  ====================================================== *)

(** Equality test *)
external is_equal: t -> t -> bool = "camlidl_bdd_is_equal"
(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_EquivDC}[Cudd_EquivDC]}. Are the two ADDs equal when the BDD (careset) is true ? *)
external is_equal_when: t -> t -> Bdd.dt -> bool = "camlidl_bdd_is_equal_when"


(** Variation of [Cuddaux_addEvalConst]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addEvalConst}[Cudd_addEvalConst]}. Is the ADD constant when the BDD (careset) is true, and in this case what is its value ? *)
external is_eval_cst : t -> Bdd.dt -> float option = "camlidl_cudd_avdd_is_eval_cst"

(** Is the result of [ite] constant, and if it is the case, what is its value ? *)
external is_ite_cst : Bdd.dt -> t -> t -> float option = "camlidl_cudd_avdd_is_ite_cst"

(*  ====================================================== *)
(** {3 Structural information} *)
(*  ====================================================== *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_DagSize}[Cudd_DagSize]}. Size if the ADD as a graph (the number of nodes). *)
external size :  t -> int = "camlidl_bdd_size"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPath}[Cudd_CountPath]}. Number of paths in the ADD from the root to the leafs. *)
external nbpaths : t -> float = "camlidl_bdd_nbpaths"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPathsToNonZero}[Cudd_CountPathsToNonZero]}. Number of paths in the ADD from the root to non-zero leaves. *)
external nbnonzeropaths : t -> float = "camlidl_bdd_nbtruepaths"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountMinterm}[Cudd_CountMinterm]}. Number of minterms  of the ADD knowing that it depends on the given number of variables. *)
external nbminterms : int -> t -> float = "camlidl_bdd_nbminterms"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Density}[Cudd_Density]}. Density of the ADD, which is the ratio of the number of minterms to the number of nodes. The ADD is assumed to depend on [nvars] variables. *)
external density : int -> t -> float = "camlidl_bdd_density"

external nbleaves : add__t -> int
	= "camlidl_add_nbleaves"

(*  ====================================================== *)
(** {3 Iterators} *)
(*  ====================================================== *)

(** Similar to {!Bdd.iter_cube} *)
external iter_cube: (Man.tbool array -> float -> unit) -> t -> unit = "camlidl_cudd_avdd_iter_cube"


(** Similar to {!Bdd.iter_node} *)
external iter_node: (t -> unit) -> t -> unit = "camlidl_cudd_iter_node"

(*  ====================================================== *)
(** {3 Leaves and guards} *)
(*  ====================================================== *)

external guard_of_node : add__t -> add__t -> Bdd.bdd__dt
	= "camlidl_add_guard_of_node"

external guard_of_nonbackground : add__t -> Bdd.bdd__dt
	= "camlidl_add_guard_of_nonbackground"


(** [Cuddaux_NodesBelowLevel]. [nodes_below_level f olevel max] returns all (if [max<=0]), otherwise at most [max] nodes pointed by the ADD, indexed by a variable of level greater or equal than [level], and encountered first in the top-down exploration (i.e., whenever a node is collected, its sons are not collected). If [olevel=None], then only constant nodes are collected. The background node may be in the result. *)
external nodes_below_level: t -> int option -> int -> t array = "camlidl_cudd_avdd_nodes_below_level"

(** Guard of the given leaf *)
external guard_of_leaf : t -> float -> Bdd.dt = "camlidl_cudd_avdd_guard_of_leaf"

(** Returns the set of leaf values (excluding the background value) *)
external leaves: t -> float array = "camlidl_cudd_avdd_leaves"

(** Picks (but not randomly) a non background leaf. Return [None] if the only leaf is the background leaf. *)
external pick_leaf : t -> float = "camlidl_cudd_avdd_pick_leaf"


let guardleafs add =
  let tab = leaves add in
  Array.map (fun leaf -> (guard_of_leaf add leaf,leaf)) tab


(*  ====================================================== *)
(** {3 Minimizations} *)
(*  ====================================================== *)

external constrain : add__t -> Bdd.bdd__dt -> add__t
	= "camlidl_add_constrain"

external tdconstrain : add__t -> Bdd.bdd__dt -> add__t
	= "camlidl_add_tdconstrain"

external restrict : add__t -> Bdd.bdd__dt -> add__t
	= "camlidl_add_restrict"

external tdrestrict : add__t -> Bdd.bdd__dt -> add__t
	= "camlidl_add_tdrestrict"

(*  ====================================================== *)
(** {3 Conversions} *)
(*  ====================================================== *)

external of_bdd : Bdd.bdd__dt -> add__t
	= "camlidl_add_of_bdd"

external to_bdd : add__t -> Bdd.bdd__dt
	= "camlidl_add_to_bdd"

external to_bdd_threshold : float -> add__t -> add__t
	= "camlidl_add_to_bdd_threshold"

external to_bdd_strictthreshold : float -> add__t -> add__t
	= "camlidl_add_to_bdd_strictthreshold"

external to_bdd_interval : float -> float -> add__t -> add__t
	= "camlidl_add_to_bdd_interval"

(*  ====================================================== *)
(** {3 Quantifications} *)
(*  ====================================================== *)

external exist : Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_exist"

external forall : Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_forall"

(*  ====================================================== *)
(** {3 Algebraic operations} *)
(*  ====================================================== *)

external is_leq : add__t -> add__t -> bool
	= "camlidl_add_is_leq"

external add : add__t -> add__t -> add__t
	= "camlidl_add_add"

external sub : add__t -> add__t -> add__t
	= "camlidl_add_sub"

external mul : add__t -> add__t -> add__t
	= "camlidl_add_mul"

external div : add__t -> add__t -> add__t
	= "camlidl_add_div"

external min : add__t -> add__t -> add__t
	= "camlidl_add_min"

external max : add__t -> add__t -> add__t
	= "camlidl_add_max"

external agreement : add__t -> add__t -> add__t
	= "camlidl_add_agreement"

external diff : add__t -> add__t -> add__t
	= "camlidl_add_diff"

external threshold : add__t -> add__t -> add__t
	= "camlidl_add_threshold"

external setNZ : add__t -> add__t -> add__t
	= "camlidl_add_setNZ"

external log : add__t -> add__t
	= "camlidl_add_log"

(*  ====================================================== *)
(** {3 Matrix operations} *)
(*  ====================================================== *)

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMatrixMultiply}[Cudd_addMatrixMultiply]}.

[matrix_multiply z A B] performs matrix multiplication of [A] and [B], with [z]
being the summation variables, which means that they are used to refer columns
of [A] and to rows of [B]. *)
external matrix_multiply : int array -> t -> t -> t = "camlidl_add_matrix_multiply"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTimesPlus}[Cudd_addTimesPlus]}. *)
external times_plus : int array -> t -> t -> t = "camlidl_add_times_plus"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTriangle}[Cudd_addTriangle]}. *)
external triangle : int array -> t -> t -> t = "camlidl_add_triangle"

(*  ====================================================== *)
(** {3 User operations} *)
(*  ====================================================== *)
(* ====================================================== *)
(** {4 By decomposition into guards and leaves} *)
(* ====================================================== *)

let mapleaf1
  ~(default:t)
  (f:Bdd.dt -> float -> float)
  (add:t)
  :
  t
  =
  let manager = manager add in
  let leaves = leaves add in
  let res = ref default in
  for i=0 to pred (Array.length leaves) do
    let leaf = leaves.(i) in
    let guard = guard_of_leaf add leaves.(i) in
    let nleaf = f guard leaf in
    res := ite guard (cst manager nleaf) !res
  done;
  !res

let mapleaf2
  ~(default:t)
  (f:Bdd.dt -> float -> float -> float)
  (add1:t)
  (add2:t)
  :
  t
  =
  let manager = manager add1 in
  let leaves1 = leaves add1 in
  let res = ref default in
  for i1=0 to pred (Array.length leaves1) do
    let leaf1 = leaves1.(i1) in
    let guard1 = guard_of_leaf add1 leaf1 in
    let add2 = ite guard1 add2 default in
    let leaves2 = leaves add2 in
    for i2=0 to pred (Array.length leaves2) do
      let leaf2 = leaves2.(i2) in
      let guard2 = guard_of_leaf add2 leaf2 in
      let nleaf = f guard2 leaf1 leaf2 in
      res := ite guard2 (cst manager nleaf) !res
    done
  done;
  !res

(* ====================================================== *)
(** {4 By using CUDD cache} *)
(* ====================================================== *)

(** Consult {!User} for explanations. *)

open Custom


(** {5 Type of operations} *)

type op1 = (float, float) Custom.op1
type op2 = (float, float, float) Custom.op2
type op3 = (float, float, float, float) Custom.op3
type opN = {
  commonN: Custom.common;
  closureN: Bdd.dt array -> t array -> t option;
  arityNbdd: int;
}
type opG = {
  commonG: Custom.common;
  arityGbdd: int;
  closureG: Bdd.dt array -> t array -> t option;
  oclosureBeforeRec: (int*bool -> Bdd.dt array -> t array -> (Bdd.dt array * t array)) option;
  oclosureIte: (int -> t -> t -> t) option;
}
type test2 = (float, float) Custom.test2
type exist = float Custom.exist
type existand = float Custom.existand
type existop1 = (float,float) Custom.existop1
type existandop1 = (float,float) Custom.existandop1


let make_common = User.make_common
let make_op1 ?memo op =
  let common = make_common 1 ?memo in
  { common1 = common; closure1=op }

let make_op2
    ?memo
    ?(commutative=false)
    ?(idempotent=false)
    ?special
    op
    =
  let common = make_common 2 ?memo in
  {
    common2=common;
    closure2=op;
    ospecial2=Obj.magic special;
    commutative=commutative;
    idempotent=idempotent;
  }
let make_test2
    ?memo
    ?(symetric=false)
    ?(reflexive=false)
    ?special
    op
    =
  let common = make_common 2 ?memo in
  {
    common2t=common;
    closure2t=op;
    ospecial2t=Obj.magic special;
    symetric;
    reflexive;
  }
let make_op3
    ?memo
    ?special
    op
    =
  let common = make_common 3 ?memo in
  {
    common3=common;
    closure3=op;
    ospecial3=Obj.magic special;
  }
let make_opN ?memo arityB arityN op : opN =
  let common = make_common ?memo (arityB+arityN) in
  { commonN=common; closureN=op; arityNbdd=arityB; }
let make_opG ?memo ?beforeRec ?ite arityB arityV op =
  let common = make_common ?memo (arityB+arityV) in
  {
    commonG=common;
    arityGbdd=arityB;
    closureG=op;
    oclosureBeforeRec=beforeRec;
    oclosureIte=ite;
  }
let make_exist ?memo combine =
  let common = make_common 2 ?memo in
  { commonexist=common; combineexist=combine }
let make_existand ?memo ~bottom combine =
  let common = make_common 3 ?memo in
  { commonexistand=common; combineexistand=combine; bottomexistand=bottom }
let make_existop1 ?memo ~op1 combine =
  let common = make_common 2 ?memo in
  { commonexistop1=common; combineexistop1=combine; existop1=op1 }
let make_existandop1 ?memo ~op1 ~bottom combine =
  let common = make_common 3 ?memo in
  { commonexistandop1=common; combineexistandop1=combine; existandop1=op1; bottomexistandop1=bottom }

let apply_op1 = Obj.magic User.apply_op1
let apply_op2 = Obj.magic User.apply_op2
let apply_op3 = Obj.magic User.apply_op3
let apply_opN = Obj.magic User.apply_opN
let apply_opG = Obj.magic User.apply_opG
let apply_test2 = Obj.magic User.apply_test2
let apply_exist = Obj.magic User.apply_exist
let apply_existand = Obj.magic User.apply_existand
let apply_existop1 = Obj.magic User.apply_existop1
let apply_existandop1 = Obj.magic User.apply_existandop1

let map_op1 = Obj.magic User.map_op1
let map_op2 = Obj.magic User.map_op2
let map_op3 = Obj.magic User.map_op3
let map_opN = Obj.magic User.map_opN
let map_test2 = Obj.magic User.map_test2

let clear_op1 = User.clear_op1
let clear_op2 = User.clear_op2
let clear_op3 = User.clear_op3
let clear_opN op = Memo.clear op.commonN.memo
let clear_opG op = Memo.clear op.commonG.memo
let clear_test2 = User.clear_test2
let clear_exist = User.clear_exist
let clear_existand = User.clear_existand
let clear_existop1 = User.clear_existop1
let clear_existandop1 = User.clear_existandop1

(*  ====================================================== *)
(** {3 Miscellaneous} *)
(*  ====================================================== *)

external transfer : add__t -> Man.man__dt -> add__t
	= "camlidl_add_transfer"

(*  ====================================================== *)
(** {3 Printing} *)
(*  ====================================================== *)


(** C printing function. The output may mix badly with the OCaml output. *)
external _print: t -> unit = "camlidl_cudd_print"


open Format

let print__minterm fmt dd =
  if is_cst dd then pp_print_float fmt (dval dd)
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
	fprintf fmt "%s -> %g" (Bytes.unsafe_to_string str) leaf
      end)
      dd;
    fprintf fmt "@]"
  end

let print_minterm print_id print_leaf fmt dd =
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
      fprintf fmt "%a IF %a"
	print_leaf leaf (Bdd.print_minterm print_id) bdd;
      if i > 0 then
	fprintf fmt ",@ ";
    done;
    fprintf fmt "@] }"
  end

let rec print print_id print_leaf formatter dd =
  match inspect dd with
  | Leaf(v) -> print_leaf formatter v
  | Ite(var,alors,sinon) ->
      fprintf formatter "ITE(@[<hv>%a;@,%a;@,%a)@]"
	print_id var (print print_id print_leaf) alors (print print_id print_leaf) sinon

