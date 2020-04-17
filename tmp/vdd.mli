(* File generated from vdd.idl *)

type vdd__t


(** Public type for exploring the abstract type [t] *)
type +'a vdd =
| Leaf of 'a         (** Terminal value *)
| Ite of int * 'a t * 'a t (** Decision on CUDD variable *)
	


(** We refer to the module {!Add} for the description of the interface, as
it is nearly identical to {!Add}, except that real leaves are replaced by
OCaml leaves.

IMPORTANT NOTE: this is an internal module, which assumes that leaves are
either immediate values (booleans, integers, constant sums),
or values allocated with caml_alloc_shr (that can
be moved only during a memory compaction).

The only case where you may use directly {!Vdd} without worrying is when the
leaves are represented as immediate values (booleans, integers, constant
sums) in the heap.

Otherwise, use module {!Mtbdd} or {!Mtbddc} to be safe, and also to ensure
that you do not have two constant MTBDDs pointing to different but
semantically equivalent values.
 *)


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




(** Be cautious, it is not type safe (if you use  {!nodes_below_level}, etc...: you can try to retrieve a constant value of some type and [()] value of the background value will be treated as another type.*)
val _background : Man.v Man.t -> 'a t


external ite : Man.v Bdd.t -> 'a t -> 'a t -> 'a t = "camlidl_add_ite"
external ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a t option = "camlidl_cudd_add_ite_cst"
external eval_cst : 'a t -> Man.v Bdd.t -> 'a t option = "camlidl_cudd_add_eval_cst"
external compose : int -> Bdd.vt -> 'a t -> 'a t = "camlidl_add_compose"

val vectorcompose : ?memo:Memo.t -> Bdd.vt array -> 'a t -> 'a t
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


(** Variant with controllable memoization policy. *)
val permute : ?memo:Memo.t -> 'a t -> int array -> 'a t
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


(** [Cuddaux_NodesBelowLevel]. [nodes_below_level ?max f olevel] returns all (if [max=None]), otherwise at most [Some max] nodes pointed by the ADD, indexed by a variable of level greater or equal than [level], and encountered first in the top-down exploration (i.e., whenever a node is collected, its sons are not collected). If [olevel=None], then only constant nodes are collected. *)
val nodes_below_level: ?max:int -> 'a t -> int option -> 'a t array


(** Guard of the given leaf *)
external guard_of_leaf : 'a t -> 'a -> Man.v Bdd.t = "camlidl_cudd_avdd_guard_of_leaf"

(** Returns the set of leaf values (excluding the background value) *)
external leaves: 'a t -> 'a array = "camlidl_cudd_avdd_leaves"

(** Picks (but not randomly) a non background leaf. Return [None] if the only leaf is the background leaf. *)
external pick_leaf : 'a t -> 'a = "camlidl_cudd_avdd_pick_leaf"


(** Returns the set of leaf values together with their guard in the ADD *)
val guardleafs : 'a t -> (Man.v Bdd.t * 'a) array


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

val print__minterm:
  (Format.formatter -> 'a -> unit) ->
  Format.formatter -> 'a t -> unit
val print_minterm:
  (Format.formatter -> int -> unit) ->
  (Format.formatter -> 'a -> unit) ->
  Format.formatter -> 'a t -> unit
val print:
  (Format.formatter -> Man.v Bdd.t -> unit) ->
  (Format.formatter -> 'a -> unit) ->
  Format.formatter -> 'a t -> unit

