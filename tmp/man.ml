(* File generated from man.idl *)

type man__dt
and man__vt
and man__t
and reorder =
  | CUDD_REORDER_SAME
  | CUDD_REORDER_NONE
  | CUDD_REORDER_RANDOM
  | CUDD_REORDER_RANDOM_PIVOT
  | CUDD_REORDER_SIFT
  | CUDD_REORDER_SIFT_CONVERGE
  | CUDD_REORDER_SYMM_SIFT
  | CUDD_REORDER_SYMM_SIFT_CONV
  | CUDD_REORDER_WINDOW2
  | CUDD_REORDER_WINDOW3
  | CUDD_REORDER_WINDOW4
  | CUDD_REORDER_WINDOW2_CONV
  | CUDD_REORDER_WINDOW3_CONV
  | CUDD_REORDER_WINDOW4_CONV
  | CUDD_REORDER_GROUP_SIFT
  | CUDD_REORDER_GROUP_SIFT_CONV
  | CUDD_REORDER_ANNEALING
  | CUDD_REORDER_GENETIC
  | CUDD_REORDER_LINEAR
  | CUDD_REORDER_LINEAR_CONVERGE
  | CUDD_REORDER_LAZY_SIFT
  | CUDD_REORDER_EXACT
and aggregation =
  | CUDD_NO_CHECK
  | CUDD_GROUP_CHECK
  | CUDD_GROUP_CHECK2
  | CUDD_GROUP_CHECK3
  | CUDD_GROUP_CHECK4
  | CUDD_GROUP_CHECK5
  | CUDD_GROUP_CHECK6
  | CUDD_GROUP_CHECK7
  | CUDD_GROUP_CHECK8
  | CUDD_GROUP_CHECK9
and lazygroup =
  | CUDD_LAZY_NONE
  | CUDD_LAZY_SOFT_GROUP
  | CUDD_LAZY_HARD_GROUP
  | CUDD_LAZY_UNGROUP
and vartype =
  | CUDD_VAR_PRIMARY_INPUT
  | CUDD_VAR_PRESENT_STATE
  | CUDD_VAR_NEXT_STATE
and mtr =
  | MTR_DEFAULT
  | MTR_FIXED
and error =
  | CUDD_NO_ERROR
  | CUDD_MEMORY_OUT
  | CUDD_TOO_MANY_NODES
  | CUDD_MAX_MEM_EXCEEDED
  | CUDD_INVALID_ARG
  | CUDD_INTERNAL_ERROR


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
external srandom : man__t -> int -> unit
	= "camlidl_man_srandom"



(*  ====================================================== *)
(** {3 Managers} *)
(*  ====================================================== *)


(** Internal, do not use ! *)
external _make : bool -> int -> int -> int -> int -> int -> man__t
	= "camlidl_man__make_bytecode" "camlidl_man__make"


let make_d ?(numVars=0) ?(numVarsZ=0) ?(numSlots=0) ?(cacheSize=0) ?(maxMemory=0) () =
  _make false numVars numVarsZ numSlots cacheSize maxMemory
let make_v ?(numVars=0) ?(numVarsZ=0) ?(numSlots=0) ?(cacheSize=0) ?(maxMemory=0) () =
  _make true numVars numVarsZ numSlots cacheSize maxMemory

external debugcheck : man__t -> bool
	= "camlidl_man_debugcheck"

external check_keys : man__t -> int
	= "camlidl_man_check_keys"

(** Internal use: duplicate a block to the major heap. Used by {!Mtbdd} and {!Mtbddc} modules *)
external copy_shr : 'a -> 'a = "camlidl_cudd_custom_copy_shr"



(*  ====================================================== *)
(** {3 Variables, Reordering and Mapping} *)
(*  ====================================================== *)


external level_of_var : man__t -> int -> int
	= "camlidl_man_level_of_var"

external var_of_level : man__t -> int -> int
	= "camlidl_man_var_of_level"

external reduce_heap : man__t -> reorder -> int -> unit
	= "camlidl_man_reduce_heap"

external shuffle_heap : man__t -> int array -> unit
	= "camlidl_man_shuffle_heap"

external garbage_collect : man__t -> int
	= "camlidl_man_garbage_collect"

external cache_flush : man__t -> unit
	= "camlidl_man_cache_flush"

external enable_autodyn : man__t -> reorder -> unit
	= "camlidl_man_enable_autodyn"

external disable_autodyn : man__t -> unit
	= "camlidl_man_disable_autodyn"

external autodyn_status : man__t -> reorder option
	= "camlidl_man_autodyn_status"

external group : man__t -> int -> int -> mtr -> unit
	= "camlidl_man_group"

external ungroupall : man__t -> unit
	= "camlidl_man_ungroupall"

external set_varmap : man__t -> int array -> unit
	= "camlidl_man_set_varmap"



(*  ====================================================== *)
(** {3 Parameters} *)
(*  ====================================================== *)




(*  ------------------------------------------------------ *)
(** {4 RDDs} *)
(*  ------------------------------------------------------ *)


external get_background : man__dt -> float
	= "camlidl_man_get_background"

external set_background : man__dt -> float -> unit
	= "camlidl_man_set_background"

external get_epsilon : man__dt -> float
	= "camlidl_man_get_epsilon"

external set_epsilon : man__dt -> float -> unit
	= "camlidl_man_set_epsilon"



(*  ------------------------------------------------------ *)
(** {4 Cache related} *)
(*  ------------------------------------------------------ *)


external get_min_hit : man__t -> int
	= "camlidl_man_get_min_hit"

external set_min_hit : man__t -> int -> unit
	= "camlidl_man_set_min_hit"

external get_max_cache_hard : man__t -> int
	= "camlidl_man_get_max_cache_hard"

external set_max_cache_hard : man__t -> int -> unit
	= "camlidl_man_set_max_cache_hard"



(*  ------------------------------------------------------ *)
(** {4 Manager} *)
(*  ------------------------------------------------------ *)


external get_looseupto : man__t -> int
	= "camlidl_man_get_looseupto"

external set_looseupto : man__t -> int -> unit
	= "camlidl_man_set_looseupto"

external get_max_live : man__t -> int
	= "camlidl_man_get_max_live"

external set_max_live : man__t -> int -> unit
	= "camlidl_man_set_max_live"

external get_max_mem : man__t -> int64
	= "camlidl_man_get_max_mem"

external set_max_mem : man__t -> int64 -> unit
	= "camlidl_man_set_max_mem"



(*  ------------------------------------------------------ *)
(** {4 Reordering methods} *)
(*  ------------------------------------------------------ *)


external get_sift_max_swap : man__t -> int
	= "camlidl_man_get_sift_max_swap"

external set_sift_max_swap : man__t -> int -> unit
	= "camlidl_man_set_sift_max_swap"

external get_sift_max_var : man__t -> int
	= "camlidl_man_get_sift_max_var"

external set_sift_max_var : man__t -> int -> unit
	= "camlidl_man_set_sift_max_var"

external get_groupcheck : man__t -> aggregation
	= "camlidl_man_get_groupcheck"

external set_groupcheck : man__t -> aggregation -> unit
	= "camlidl_man_set_groupcheck"

external get_arcviolation : man__t -> int
	= "camlidl_man_get_arcviolation"

external set_arcviolation : man__t -> int -> unit
	= "camlidl_man_set_arcviolation"

external get_crossovers : man__t -> int
	= "camlidl_man_get_crossovers"

external set_crossovers : man__t -> int -> unit
	= "camlidl_man_set_crossovers"

external get_population : man__t -> int
	= "camlidl_man_get_population"

external set_population : man__t -> int -> unit
	= "camlidl_man_set_population"

external get_recomb : man__t -> int
	= "camlidl_man_get_recomb"

external set_recomb : man__t -> int -> unit
	= "camlidl_man_set_recomb"

external get_symmviolation : man__t -> int
	= "camlidl_man_get_symmviolation"

external set_symmviolation : man__t -> int -> unit
	= "camlidl_man_set_symmviolation"



(*  ------------------------------------------------------ *)
(** {4 Dynamic reordering} *)
(*  ------------------------------------------------------ *)


external get_max_growth : man__t -> float
	= "camlidl_man_get_max_growth"

external set_max_growth : man__t -> float -> unit
	= "camlidl_man_set_max_growth"

external get_max_growth_alt : man__t -> float
	= "camlidl_man_get_max_growth_alt"

external set_max_growth_alt : man__t -> float -> unit
	= "camlidl_man_set_max_growth_alt"

external get_reordering_cycle : man__t -> int
	= "camlidl_man_get_reordering_cycle"

external set_reordering_cycle : man__t -> int -> unit
	= "camlidl_man_set_reordering_cycle"

external get_max_reorderings : man__t -> int
	= "camlidl_man_get_max_reorderings"

external set_max_reorderings : man__t -> int -> unit
	= "camlidl_man_set_max_reorderings"

external get_next_autodyn : man__t -> int
	= "camlidl_man_get_next_autodyn"

external set_next_autodyn : man__t -> int -> unit
	= "camlidl_man_set_next_autodyn"



(*  ====================================================== *)
(** {3 Statistics} *)
(*  ====================================================== *)


external get_cache_hits : man__t -> float
	= "camlidl_man_get_cache_hits"

external get_cache_lookups : man__t -> float
	= "camlidl_man_get_cache_lookups"

external get_cache_slots : man__t -> int
	= "camlidl_man_get_cache_slots"

external get_cache_used_slots : man__t -> float
	= "camlidl_man_get_cache_used_slots"

external get_dead : man__t -> int
	= "camlidl_man_get_dead"

external get_error : man__t -> error
	= "camlidl_man_get_error"

external get_gc_time : man__t -> int
	= "camlidl_man_get_gc_time"

external get_gc_nb : man__t -> int
	= "camlidl_man_get_gc_nb"

external get_keys : man__t -> int
	= "camlidl_man_get_keys"

external get_linear : man__t -> int -> int -> int
	= "camlidl_man_get_linear"

external get_max_cache : man__t -> int
	= "camlidl_man_get_max_cache"

external get_min_dead : man__t -> int
	= "camlidl_man_get_min_dead"

external get_node_count : man__t -> int
	= "camlidl_man_get_node_count"

external get_node_count_peak : man__t -> int
	= "camlidl_man_get_node_count_peak"

external get_reordering_time : man__t -> int
	= "camlidl_man_get_reordering_time"

external get_reordering_nb : man__t -> int
	= "camlidl_man_get_reordering_nb"

external get_bddvar_nb : man__t -> int
	= "camlidl_man_get_bddvar_nb"

external get_zddvar_nb : man__t -> int
	= "camlidl_man_get_zddvar_nb"

external get_slots : man__t -> int
	= "camlidl_man_get_slots"

external get_used_slots : man__t -> float
	= "camlidl_man_get_used_slots"

external get_swap_nb : man__t -> float
	= "camlidl_man_get_swap_nb"

external print_info : man__t -> unit
	= "camlidl_man_print_info"


let _ = set_gc 1000000 Gc.full_major (fun () -> ())
let _ = Callback.register_exception "invalid argument exception" (Invalid_argument "")

external num_recursive_calls : man__t -> float
	= "camlidl_man_num_recursive_calls"

