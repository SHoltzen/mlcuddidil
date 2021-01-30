(* File generated from man.idl *)
(* This file is part of the MLCUDDIDL Library, released under LGPL license.
   Please read the COPYING file packaged in the distribution  *)

(** CUDD Manager *)

type d
  (** Indicates that a CUDD manager manipulates standard ADDs with leaves of type C double *)

type v
  (** Indicates that a CUDD manager manipulates ``custom'' ADDs with leaves of type an [OCaml] value, see modules {!Mtbdd} and {!Mtbddc}. A manager cannot manipulate the two types of ADDs (for garbage collection reasons) *)

type 'a t
  (** Type of CUDD managers, where ['a] is either [d] or [v]*)

(** Reordering method. *)
type reorder =
  | REORDER_SAME
  | REORDER_NONE
  | REORDER_RANDOM
  | REORDER_RANDOM_PIVOT
  | REORDER_SIFT
  | REORDER_SIFT_CONVERGE
  | REORDER_SYMM_SIFT
  | REORDER_SYMM_SIFT_CONV
  | REORDER_WINDOW2
  | REORDER_WINDOW3
  | REORDER_WINDOW4
  | REORDER_WINDOW2_CONV
  | REORDER_WINDOW3_CONV
  | REORDER_WINDOW4_CONV
  | REORDER_GROUP_SIFT
  | REORDER_GROUP_SIFT_CONV
  | REORDER_ANNEALING
  | REORDER_GENETIC
  | REORDER_LINEAR
  | REORDER_LINEAR_CONVERGE
  | REORDER_LAZY_SIFT
  | REORDER_EXACT

(** Type of aggregation methods. *)
type aggregation =
  | NO_CHECK
  | GROUP_CHECK
  | GROUP_CHECK2
  | GROUP_CHECK3
  | GROUP_CHECK4
  | GROUP_CHECK5
  | GROUP_CHECK6
  | GROUP_CHECK7
  | GROUP_CHECK8
  | GROUP_CHECK9

(** Group type for lazy sifting. *)
type lazygroup =
  | LAZY_NONE
  | LAZY_SOFT_GROUP
  | LAZY_HARD_GROUP
  | LAZY_UNGROUP

(** Variable type. Currently used only in lazy sifting. *)
type vartype =
  | VAR_PRIMARY_INPUT
  | VAR_PRESENT_STATE
  | VAR_NEXT_STATE

(** Is variable order inside group fixed or not ? *)
type mtr =
  | MTR_DEFAULT
  | MTR_FIXED

(** Type of error when CUDD raises an exception. *)
type error =
  | NO_ERROR
  | MEMORY_OUT
  | TOO_MANY_NODES
  | MAX_MEM_EXCEEDED
  | INVALID_ARG
  | INTERNAL_ERROR


type dt = d t
type vt = v t
  (** Shortcuts *)

type tbool = False | True | Top
  (** Ternary Boolean type, used to defines minterms where [Top] means [True]
      or [False] *)



(** Printing functions *)
let string_of_reorder = function
  | REORDER_SAME -> "SAME"
  | REORDER_NONE -> "NONE"
  | REORDER_RANDOM -> "RANDOM"
  | REORDER_RANDOM_PIVOT -> "RANDOM_PIVOT"
  | REORDER_SIFT -> "SIFT"
  | REORDER_SIFT_CONVERGE -> "SIFT_CONVERGE"
  | REORDER_SYMM_SIFT -> "SYMM_SIFT"
  | REORDER_SYMM_SIFT_CONV -> "SYMM_SIFT_CONV"
  | REORDER_WINDOW2 -> "WINDOW2"
  | REORDER_WINDOW3 -> "WINDOW3"
  | REORDER_WINDOW4 -> "WINDOW4"
  | REORDER_WINDOW2_CONV -> "WINDOW2_CONV"
  | REORDER_WINDOW3_CONV -> "WINDOW3_CONV"
  | REORDER_WINDOW4_CONV -> "WINDOW4_CONV"
  | REORDER_GROUP_SIFT -> "GROUP_SIFT"
  | REORDER_GROUP_SIFT_CONV -> "GROUP_SIFT_CONV"
  | REORDER_ANNEALING -> "ANNEALING"
  | REORDER_GENETIC -> "GENETIC"
  | REORDER_LINEAR -> "LINEAR"
  | REORDER_LINEAR_CONVERGE -> "LINEAR_CONVERGE"
  | REORDER_LAZY_SIFT -> "LAZY_SIFT"
  | REORDER_EXACT -> "EXACT"
let string_of_error = function
  | NO_ERROR -> "NO_ERROR"
  | MEMORY_OUT -> "MEMORY_OUT"
  | TOO_MANY_NODES -> "TOO_MANY_NODES"
  | MAX_MEM_EXCEEDED -> "MAX_MEM_EXCEEDED"
  | INVALID_ARG -> "INVALID_ARG"
  | INTERNAL_ERROR -> "INTERNAL_ERROR"



(*  ====================================================== *)
(** {3 Global settings} *)
(*  ====================================================== *)


let print_limit = ref 30


(** [set_gc max gc reordering] performs several things:
- It sets the ratio used/max for BDDs abstract values to [1/max] (see
the OCaml manual for details). 1 000 000 is a good value.
- It also sets for all the future managers that will be created the hook
function to be called before a CUDD garbage collection, and the hook
function to be called before a CUDD reordering. You may typically specify
a OCaml garbage collection function for both hooks, in order to make
OCaml dereference unused nodes, thus allowing CUDD to remove
them. Default values are [Gc.full_major()] for both hooks. *)
external set_gc: int -> (unit -> unit) -> (unit -> unit) ->
unit = "camlidl_cudd_set_gc"
external srandom : 'a t -> int -> unit
	= "camlidl_cudd_man_srandom"



(*  ====================================================== *)
(** {3 Managers} *)
(*  ====================================================== *)


(** Internal, do not use ! *)
external _make : bool -> int -> int -> int -> int -> int -> 'a t
	= "camlidl_cudd_man__make_bytecode" "camlidl_cudd_man__make"


let make_d ?(numVars=0) ?(numVarsZ=0) ?(numSlots=0) ?(cacheSize=0) ?(maxMemory=0) () =
  _make false numVars numVarsZ numSlots cacheSize maxMemory
let make_v ?(numVars=0) ?(numVarsZ=0) ?(numSlots=0) ?(cacheSize=0) ?(maxMemory=0) () =
  _make true numVars numVarsZ numSlots cacheSize maxMemory

external debugcheck : 'a t -> bool
	= "camlidl_cudd_man_debugcheck"

external check_keys : 'a t -> int
	= "camlidl_cudd_man_check_keys"

(** Internal use: duplicate a block to the major heap. Used by {!Mtbdd} and {!Mtbddc} modules *)
external copy_shr : 'a -> 'a = "camlidl_cudd_custom_copy_shr"



(*  ====================================================== *)
(** {3 Variables, Reordering and Mapping} *)
(*  ====================================================== *)


external level_of_var : 'a t -> int -> int
	= "camlidl_cudd_man_level_of_var"

external var_of_level : 'a t -> int -> int
	= "camlidl_cudd_man_var_of_level"

external reduce_heap : 'a t -> reorder -> int -> unit
	= "camlidl_cudd_man_reduce_heap"

external shuffle_heap : 'a t -> int array -> unit
	= "camlidl_cudd_man_shuffle_heap"

external garbage_collect : 'a t -> int
	= "camlidl_cudd_man_garbage_collect"

external flush : 'a t -> unit
	= "camlidl_cudd_man_cache_flush"

external enable_autodyn : 'a t -> reorder -> unit
	= "camlidl_cudd_man_enable_autodyn"

external disable_autodyn : 'a t -> unit
	= "camlidl_cudd_man_disable_autodyn"

external autodyn_status : 'a t -> reorder option
	= "camlidl_cudd_man_autodyn_status"

external group : 'a t -> int -> int -> mtr -> unit
	= "camlidl_cudd_man_group"

external ungroupall : 'a t -> unit
	= "camlidl_cudd_man_ungroupall"

external set_varmap : 'a t -> int array -> unit
	= "camlidl_cudd_man_set_varmap"



(*  ====================================================== *)
(** {3 Parameters} *)
(*  ====================================================== *)




(*  ------------------------------------------------------ *)
(** {4 RDDs} *)
(*  ------------------------------------------------------ *)


external get_background : dt -> float
	= "camlidl_cudd_man_get_background"

external set_background : dt -> float -> unit
	= "camlidl_cudd_man_set_background"

external get_epsilon : dt -> float
	= "camlidl_cudd_man_get_epsilon"

external set_epsilon : dt -> float -> unit
	= "camlidl_cudd_man_set_epsilon"



(*  ------------------------------------------------------ *)
(** {4 Cache related} *)
(*  ------------------------------------------------------ *)


external get_min_hit : 'a t -> int
	= "camlidl_cudd_man_get_min_hit"

external set_min_hit : 'a t -> int -> unit
	= "camlidl_cudd_man_set_min_hit"

external get_max_cache_hard : 'a t -> int
	= "camlidl_cudd_man_get_max_cache_hard"

external set_max_cache_hard : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_cache_hard"



(*  ------------------------------------------------------ *)
(** {4 Manager} *)
(*  ------------------------------------------------------ *)


external get_looseupto : 'a t -> int
	= "camlidl_cudd_man_get_looseupto"

external set_looseupto : 'a t -> int -> unit
	= "camlidl_cudd_man_set_looseupto"

external get_max_live : 'a t -> int
	= "camlidl_cudd_man_get_max_live"

external set_max_live : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_live"

external get_max_mem : 'a t -> int64
	= "camlidl_cudd_man_get_max_mem"

external set_max_mem : 'a t -> int64 -> unit
	= "camlidl_cudd_man_set_max_mem"



(*  ------------------------------------------------------ *)
(** {4 Reordering methods} *)
(*  ------------------------------------------------------ *)


external get_sift_max_swap : 'a t -> int
	= "camlidl_cudd_man_get_sift_max_swap"

external set_sift_max_swap : 'a t -> int -> unit
	= "camlidl_cudd_man_set_sift_max_swap"

external get_sift_max_var : 'a t -> int
	= "camlidl_cudd_man_get_sift_max_var"

external set_sift_max_var : 'a t -> int -> unit
	= "camlidl_cudd_man_set_sift_max_var"

external get_groupcheck : 'a t -> aggregation
	= "camlidl_cudd_man_get_groupcheck"

external set_groupcheck : 'a t -> aggregation -> unit
	= "camlidl_cudd_man_set_groupcheck"

external get_arcviolation : 'a t -> int
	= "camlidl_cudd_man_get_arcviolation"

external set_arcviolation : 'a t -> int -> unit
	= "camlidl_cudd_man_set_arcviolation"

external get_crossovers : 'a t -> int
	= "camlidl_cudd_man_get_crossovers"

external set_crossovers : 'a t -> int -> unit
	= "camlidl_cudd_man_set_crossovers"

external get_population : 'a t -> int
	= "camlidl_cudd_man_get_population"

external set_population : 'a t -> int -> unit
	= "camlidl_cudd_man_set_population"

external get_recomb : 'a t -> int
	= "camlidl_cudd_man_get_recomb"

external set_recomb : 'a t -> int -> unit
	= "camlidl_cudd_man_set_recomb"

external get_symmviolation : 'a t -> int
	= "camlidl_cudd_man_get_symmviolation"

external set_symmviolation : 'a t -> int -> unit
	= "camlidl_cudd_man_set_symmviolation"



(*  ------------------------------------------------------ *)
(** {4 Dynamic reordering} *)
(*  ------------------------------------------------------ *)


external get_max_growth : 'a t -> float
	= "camlidl_cudd_man_get_max_growth"

external set_max_growth : 'a t -> float -> unit
	= "camlidl_cudd_man_set_max_growth"

external get_max_growth_alt : 'a t -> float
	= "camlidl_cudd_man_get_max_growth_alt"

external set_max_growth_alt : 'a t -> float -> unit
	= "camlidl_cudd_man_set_max_growth_alt"

external get_reordering_cycle : 'a t -> int
	= "camlidl_cudd_man_get_reordering_cycle"

external set_reordering_cycle : 'a t -> int -> unit
	= "camlidl_cudd_man_set_reordering_cycle"

external get_max_reorderings : 'a t -> int
	= "camlidl_cudd_man_get_max_reorderings"

external set_max_reorderings : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_reorderings"

external get_next_autodyn : 'a t -> int
	= "camlidl_cudd_man_get_next_autodyn"

external set_next_autodyn : 'a t -> int -> unit
	= "camlidl_cudd_man_set_next_autodyn"



(*  ====================================================== *)
(** {3 Statistics} *)
(*  ====================================================== *)


external get_cache_hits : 'a t -> float
	= "camlidl_cudd_man_get_cache_hits"

external get_cache_lookups : 'a t -> float
	= "camlidl_cudd_man_get_cache_lookups"

external get_cache_slots : 'a t -> int
	= "camlidl_cudd_man_get_cache_slots"

external get_cache_used_slots : 'a t -> float
	= "camlidl_cudd_man_get_cache_used_slots"

external get_dead : 'a t -> int
	= "camlidl_cudd_man_get_dead"

external get_error : 'a t -> error
	= "camlidl_cudd_man_get_error"

external get_gc_time : 'a t -> int
	= "camlidl_cudd_man_get_gc_time"

external get_gc_nb : 'a t -> int
	= "camlidl_cudd_man_get_gc_nb"

external get_keys : 'a t -> int
	= "camlidl_cudd_man_get_keys"

external get_linear : 'a t -> int -> int -> int
	= "camlidl_cudd_man_get_linear"

external get_max_cache : 'a t -> int
	= "camlidl_cudd_man_get_max_cache"

external get_min_dead : 'a t -> int
	= "camlidl_cudd_man_get_min_dead"

external get_node_count : 'a t -> int
	= "camlidl_cudd_man_get_node_count"

external get_node_count_peak : 'a t -> int
	= "camlidl_cudd_man_get_node_count_peak"

external get_reordering_time : 'a t -> int
	= "camlidl_cudd_man_get_reordering_time"

external get_reordering_nb : 'a t -> int
	= "camlidl_cudd_man_get_reordering_nb"

external get_bddvar_nb : 'a t -> int
	= "camlidl_cudd_man_get_bddvar_nb"

external get_zddvar_nb : 'a t -> int
	= "camlidl_cudd_man_get_zddvar_nb"

external get_slots : 'a t -> int
	= "camlidl_cudd_man_get_slots"

external get_used_slots : 'a t -> float
	= "camlidl_cudd_man_get_used_slots"

external get_swap_nb : 'a t -> float
	= "camlidl_cudd_man_get_swap_nb"

external print_info : 'a t -> unit
	= "camlidl_cudd_man_print_info"


let _ = set_gc 1000000 Gc.full_major (fun () -> ())
let _ = Callback.register_exception "invalid argument exception" (Invalid_argument "")

external num_recursive_calls : 'a t -> float
	= "camlidl_cudd_man_num_recursive_calls"

