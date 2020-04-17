(* File generated from add.idl *)

type add__t

(** Public type for exploring the abstract type [t] *)
type add =
| Leaf of float      (** Terminal value *)
| Ite of int * t * t (** Decision on CUDD variable *)



(*  ====================================================== *)
(** {3 Extractors} *)
(*  ====================================================== *)

(** Returns the manager associated to the ADD *)
external manager : t -> Man.dt = "camlidl_bdd_manager"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsConstant}[Cudd_IsConstant]}. Is the ADD constant ? *)
external is_cst : t -> bool = "camlidl_bdd_is_cst"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_NodeReadIndex}[Cudd_NodeReadIndex]}. Returns the index of the ADD (65535 for a constant ADD) *)external topvar : t -> int = "camlidl_bdd_topvar"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_T}[Cudd_T]}. Returns the positive subnode of the ADD *)
external dthen : add__t -> add__t
	= "camlidl_add_dthen"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_E}[Cudd_E]}. Returns the negative subnode of the ADD *)
external delse : add__t -> add__t
	= "camlidl_add_delse"


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_V}[Cudd_V]}. Returns the value of the assumed constant ADD *)
external dval : t -> float = "camlidl_cudd_avdd_dval"


(** Returns the positive and negative cofactor of the ADD wrt the variable *)
external cofactors : int -> t -> t*t = "camlidl_cudd_add_cofactors"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. [cofactor add cube] evaluates [add] on the cube [cube] *)
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

val background : Man.dt -> t
(** [Cuddaux_addIte]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addIte}[Cudd_addIte]}. If-then-else operation, with the condition being a BDD. *)
external ite : Bdd.bdd__dt -> add__t -> add__t -> add__t
	= "camlidl_add_ite"

(** [Cuddaux_addIteConstant]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addIteConstant}[Cudd_addIteConstant]}. If-then-else operation, which succeeds only if the resulting node belongs to one of the two ADD. *)
external ite_cst : Bdd.bdd__dt -> add__t -> add__t -> add__t option
	= "camlidl_add_ite_cst"

(** [Cuddaux_addEvalConst]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addEvalConst}[Cudd_addEvalConst]}. *)
external eval_cst : add__t -> Bdd.bdd__dt -> add__t option
	= "camlidl_add_eval_cst"

(** [Cuddaux_addCompose]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addCompose}[Cudd_addCompose]}. Substitutes the variable with the BDD in the ADD. *)
external compose : int -> Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_compose"


(** [Cuddaux_addVectorCompose]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addVectorCompose}[Cudd_addVectorCompose]}.
Parallel substitution of every variable [var] present in the manager by the
BDD [table.(var)] in the ADD. You can optionnally control the memoization
policy, see {!Memo}. *)
val vectorcompose : ?memo:Memo.t -> Bdd.dt array -> t -> t

(*  ====================================================== *)
(** {3 Variable mapping} *)
(*  ====================================================== *)

(** [Cuddaux_addVarMap]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarMap}[Cudd_bddVarMap]}. Permutes the variables as it has been specified with {!Man.set_varmap}. *)
external varmap : add__t -> add__t
	= "camlidl_add_varmap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addPermute}[Cudd_addPermute]}.
Permutes the variables as it is specified by [permut] (same format as in
{!Man.set_varmap}). You can optionnally control the memoization policy, see
{!Memo}. *)
val permute : ?memo:Memo.t -> t -> int array -> t


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

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountLeaves}[Cudd_CountLeaves]}. Number of leaves. *)
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

(** [Cuddaux_addGuardOfNode]. [guard_of_node f node] returns the sum of the paths leading from the root node [f] to the node [node] of [f]. *)
external guard_of_node : add__t -> add__t -> Bdd.bdd__dt
	= "camlidl_add_guard_of_node"

(** Guard of non background leaves *)
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


(** Returns the set of leaf values together with their guard in the ADD *)
val guardleafs : t -> (Bdd.dt * float) array


(*  ====================================================== *)
(** {3 Minimizations} *)
(*  ====================================================== *)

(** See {!Bdd.constrain}, {!Bdd.tdconstrain}, {!Bdd.restrict}, {!Bdd.tdrestrict} *)

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

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BddToAdd}[Cudd_BddToAdd]}. Conversion from BDD to 0-1 ADD *)
external of_bdd : Bdd.bdd__dt -> add__t
	= "camlidl_add_of_bdd"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddPattern}[Cudd_addBddPattern]}. Conversion from ADD to BDD by replacing all leaves different from 0  by true. *)
external to_bdd : add__t -> Bdd.bdd__dt
	= "camlidl_add_to_bdd"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddThreshold}[Cudd_addBddThreshold]}. Conversion from ADD to BDD by replacing all leaves greater than or equal to the threshold by true. *)
external to_bdd_threshold : float -> add__t -> add__t
	= "camlidl_add_to_bdd_threshold"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddStrictThreshold}[Cudd_addBddStrictThreshold]}. Conversion from ADD to BDD by replacing all leaves strictly greater than the threshold by true.*)
external to_bdd_strictthreshold : float -> add__t -> add__t
	= "camlidl_add_to_bdd_strictthreshold"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddInterval}[Cudd_addBddInterval]}. Conversion from ADD to BDD  by replacing all leaves in the interval by true. *)
external to_bdd_interval : float -> float -> add__t -> add__t
	= "camlidl_add_to_bdd_interval"

(*  ====================================================== *)
(** {3 Quantifications} *)
(*  ====================================================== *)

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addExistAbstract}[Cudd_addExistAbstract]}. Abstracts all the variables in the cube from the ADD by summing over all possible values taken by those variables. *)
external exist : Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_exist"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addUnivAbstract}[Cudd_addUnivAbstract]}. Abstracts all the variables in the cube from the ADD by taking the product over all possible values taken by those variables. *)
external forall : Bdd.bdd__dt -> add__t -> add__t
	= "camlidl_add_forall"

(*  ====================================================== *)
(** {3 Algebraic operations} *)
(*  ====================================================== *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html# Cudd_addLeq}[ Cudd_addLeq]}. *)
external is_leq : add__t -> add__t -> bool
	= "camlidl_add_is_leq"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addPlus}[Cudd_addPlus]}. *)
external add : add__t -> add__t -> add__t
	= "camlidl_add_add"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMinus}[Cudd_addMinus]}. *)
external sub : add__t -> add__t -> add__t
	= "camlidl_add_sub"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTimes}[Cudd_addTimes]}. *)
external mul : add__t -> add__t -> add__t
	= "camlidl_add_mul"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addDivide}[Cudd_addDivide]}. *)
external div : add__t -> add__t -> add__t
	= "camlidl_add_div"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMinimum}[Cudd_addMinimum]}. *)
external min : add__t -> add__t -> add__t
	= "camlidl_add_min"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMaximum}[Cudd_addMaximum]}. *)
external max : add__t -> add__t -> add__t
	= "camlidl_add_max"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addAgreement}[Cudd_addAgreement]}. *)
external agreement : add__t -> add__t -> add__t
	= "camlidl_add_agreement"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addDiff}[Cudd_addDiff]}. *)
external diff : add__t -> add__t -> add__t
	= "camlidl_add_diff"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addThreshold}[Cudd_addThreshold]}. *)
external threshold : add__t -> add__t -> add__t
	= "camlidl_add_threshold"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addSetNZ}[Cudd_addSetNZ]}. *)
external setNZ : add__t -> add__t -> add__t
	= "camlidl_add_setNZ"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addLog}[Cudd_addLog]}. *)
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

val mapleaf1 : default:t -> (Bdd.dt -> float -> float) -> t -> t
val mapleaf2 : default:t -> (Bdd.dt -> float -> float -> float) -> t -> t -> t

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


(** {5 Making operations} *)
val make_op1 : ?memo:Memo.t -> (float -> float) -> op1
val make_op2 :
  ?memo:Memo.t ->
  ?commutative:bool -> ?idempotent:bool ->
  ?special:(t -> t -> t option) ->
  (float -> float -> float) -> op2
val make_op3 :
  ?memo:Memo.t ->
  ?special:(t -> t -> t -> t option) ->
  (float -> float -> float -> float) -> op3
val make_opN :
  ?memo:Memo.t ->
  int -> int ->
  (Bdd.dt array -> t array -> t option) ->
  opN
val make_opG :
  ?memo:Memo.t ->
  ?beforeRec:(int*bool -> Bdd.dt array -> t array -> (Bdd.dt array * t array)) ->
  ?ite:(int -> t -> t -> t) ->
  int -> int ->
  (Bdd.dt array -> t array -> t option) ->
  opG
val make_test2 :
  ?memo:Memo.t ->
  ?symetric:bool -> ?reflexive:bool ->
  ?special:(t -> t -> bool option) ->
  (float -> float -> bool) -> test2
val make_exist : ?memo:Memo.t -> op2 -> exist
val make_existand : ?memo:Memo.t -> bottom:float -> op2 -> existand
val make_existop1 : ?memo:Memo.t -> op1:op1 -> op2 -> existop1
val make_existandop1 :
  ?memo:Memo.t -> op1:op1 -> bottom:float -> op2 -> existandop1

(** {5 Clearing memoization tables} *)

val clear_op1 : op1 -> unit
val clear_op2 : op2 -> unit
val clear_op3 : op3 -> unit
val clear_opN : opN -> unit
val clear_opG : opG -> unit
val clear_test2 : test2 -> unit
val clear_exist : exist -> unit
val clear_existand : existand -> unit
val clear_existop1 : existop1 -> unit
val clear_existandop1 : existandop1 -> unit

(** {5 Applying operations} *)

val apply_op1 : op1 -> t -> t
val apply_op2 : op2 -> t -> t -> t
val apply_op3 : op3 -> t -> t -> t
val apply_opN : opN -> Bdd.dt array -> t array -> t
val apply_opG : opG -> Bdd.dt array -> t array -> t
val apply_test2 : test2 -> t -> t -> bool
val apply_exist : exist -> supp:Bdd.dt -> t -> t
val apply_existand : existand -> supp:Bdd.dt -> Bdd.dt -> t -> t
val apply_existop1 : existop1 -> supp:Bdd.dt -> t -> t
val apply_existandop1 : existandop1 -> supp:Bdd.dt -> Bdd.dt -> t -> t

(** {5 Map functions} *)

val map_op1 : ?memo:Memo.t -> (float -> float) -> t -> t
val map_op2 :
  ?memo:Memo.t ->
  ?commutative:bool -> ?idempotent:bool ->
  ?special:(t -> t -> t option) ->
  (float -> float -> float) -> t -> t -> t
val map_op3 :
  ?memo:Memo.t ->
  ?special:(t -> t -> t -> t option) ->
  (float -> float -> float -> float) -> t -> t -> t -> t
val map_opN :
  ?memo:Memo.t ->
  (Bdd.dt array -> t array -> t option) ->
  Bdd.dt array -> t array -> t
val map_test2 :
  ?memo:Memo.t ->
  ?symetric:bool -> ?reflexive:bool ->
  ?special:(t -> t -> bool option) ->
  (float -> float -> bool) -> t -> t -> bool

(*  ====================================================== *)
(** {3 Miscellaneous} *)
(*  ====================================================== *)

(** [Cuddaux_addTransfer]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddTransfer}[Cudd_bddTransfer]}. Transfers a ADD to a different manager. *)
external transfer : add__t -> Man.man__dt -> add__t
	= "camlidl_add_transfer"

(*  ====================================================== *)
(** {3 Printing} *)
(*  ====================================================== *)


(** C printing function. The output may mix badly with the OCaml output. *)
external _print: t -> unit = "camlidl_cudd_print"


(** Prints the minterms of the BDD in the same way as {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Printminterm}[Cudd_Printminterm]}. *)
val print__minterm: Format.formatter -> t -> unit

(** [print_minterm print_id print_leaf fmt bdd] prints the minterms of the BDD using [print_id] to print indices of variables and [print_leaf] to print leaf values. *)
val print_minterm:
  (Format.formatter -> int -> unit) ->
  (Format.formatter -> float -> unit) ->
  Format.formatter -> t -> unit

(** Prints a BDD by recursively decomposing it as monomial followed by a tree. *)
val print:
  (Format.formatter -> int -> unit) ->
  (Format.formatter -> float -> unit) ->
  Format.formatter -> t -> unit

