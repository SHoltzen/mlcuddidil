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


val string_of_reorder : reorder -> string
val string_of_error : error -> string
(** Printing functions *)



(*  ====================================================== *)
(** {3 Global settings} *)
(*  ====================================================== *)



(** Parameter for printing functions: specify the maximum number of minterms to
be printed. Above this numbers, only statistics on the BDD is printed. *)
val print_limit : int ref



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


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Srandom}[Cudd_Srandom]}. Initializes the seed for the CUDD rnadom number generator (used in a number of functions, like {!Bdd.pick_cubes_on_support}. *)
external srandom : 'a t -> int -> unit
	= "camlidl_cudd_man_srandom"



(*  ====================================================== *)
(** {3 Managers} *)
(*  ====================================================== *)


(** Internal, do not use ! *)
external _make : bool -> int -> int -> int -> int -> int -> 'a t
	= "camlidl_cudd_man__make_bytecode" "camlidl_cudd_man__make"


val make_d : ?numVars:int -> ?numVarsZ:int -> ?numSlots:int -> ?cacheSize:int -> ?maxMemory:int -> unit -> d t
val make_v : ?numVars:int -> ?numVarsZ:int -> ?numSlots:int -> ?cacheSize:int -> ?maxMemory:int -> unit -> v t
(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Init}[Cudd_Init]}.

[make_d ~numVars ~numVarsZ ~numSlots ~cacheSize ~maxMemory ()] creates a manager with the
given parameters. [make_d ()] is OK. In addition, the function sets a hook
function to be called whenever a CUDD garbage collection occurs, and a
(dummy) hook function to be called whenever a CUDD reordering occurs. The defaults can be modified with {!set_gc}. *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_DebugCheck}[Cudd_DebugCheck]}.
Returns [false] if it is OK, [true] if there is a problem, and throw
a [Failure] exception in case of [OUT_OF_MEM]. *) 
external debugcheck : 'a t -> bool
	= "camlidl_cudd_man_debugcheck"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CheckKeys}[Cudd_CheckKeys]}. *)
external check_keys : 'a t -> int
	= "camlidl_cudd_man_check_keys"

(** Internal use: duplicate a block to the major heap. Used by {!Mtbdd} and {!Mtbddc} modules *)
external copy_shr : 'a -> 'a = "camlidl_cudd_custom_copy_shr"



(*  ====================================================== *)
(** {3 Variables, Reordering and Mapping} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadPerm}[Cudd_ReadPerm]}. Returns the level of the variable (its order in the BDD) *)
external level_of_var : 'a t -> int -> int
	= "camlidl_cudd_man_level_of_var"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadInvPerm}[Cudd_ReadInvPerm]}. Returns the variable associated to the given level. *)
external var_of_level : 'a t -> int -> int
	= "camlidl_cudd_man_var_of_level"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReduceHeap}[Cudd_ReduceHeap]}. Main reordering function, that applies the given heuristic. The provided integer is a bound below which no reordering takes place. *)
external reduce_heap : 'a t -> reorder -> int -> unit
	= "camlidl_cudd_man_reduce_heap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ShuffleHeap}[Cudd_ShuffleHeap]}. Reorder variables according to the given permutation. *)
external shuffle_heap : 'a t -> int array -> unit
	= "camlidl_cudd_man_shuffle_heap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddAllDet.html#cuddGarbageCollect}[cuddGarbageCollect]}. Force a garbage collection (with cache clearing) *)
external garbage_collect : 'a t -> int
	= "camlidl_cudd_man_garbage_collect"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddAllDet.html#cuddCacheFlush}[cuddCacheFlush]}. Clear the global cache *)
external flush : 'a t -> unit
	= "camlidl_cudd_man_cache_flush"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_AutodynEnable}[Cudd_AutodynEnable]}. Enables dynamic reordering with the given heuristics. *)
external enable_autodyn : 'a t -> reorder -> unit
	= "camlidl_cudd_man_enable_autodyn"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_AutodynDisable}[Cudd_AutodynDisable]}. Disables dynamic reordering. *)
external disable_autodyn : 'a t -> unit
	= "camlidl_cudd_man_disable_autodyn"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReorderingStatus}[Cudd_ReorderingStatus]}. Returns [None] if dynamic reordering is disables, [Some(heuristic)] otherwise. *)
external autodyn_status : 'a t -> reorder option
	= "camlidl_cudd_man_autodyn_status"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_MakeTreeNode}[Cudd_MakeTreeNode]}.
[group man low size typ] creates a new variable group, ranging from index [low] to index [low+size-1], in which [typ] specifies if reordering is allowed inside the group. *)
external group : 'a t -> int -> int -> mtr -> unit
	= "camlidl_cudd_man_group"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_FreeTree}[Cudd_FreeTree]}. Removes all the groups in the manager. *)
external ungroupall : 'a t -> unit
	= "camlidl_cudd_man_ungroupall"

(**
[Cuddaux_SetVarMap]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetVarMap}[Cudd_SetVarMap]}. Initializes
the global mapping table, used by functions {!Bdd.varmap}, {!Vdd.varmap},
{!Mtbdd.varmap}, {!Mtbddc.varmap},... Convenient when the same mapping is
applied several times, because the the different calls reuse the same
cache. *)
external set_varmap : 'a t -> int array -> unit
	= "camlidl_cudd_man_set_varmap"



(*  ====================================================== *)
(** {3 Parameters} *)
(*  ====================================================== *)




(*  ------------------------------------------------------ *)
(** {4 RDDs} *)
(*  ------------------------------------------------------ *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadBackground}[Cudd_ReadBackground]}. *)
external get_background : dt -> float
	= "camlidl_cudd_man_get_background"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetBackground}[Cudd_SetBackground]}. *)
external set_background : dt -> float -> unit
	= "camlidl_cudd_man_set_background"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadEpsilon}[Cudd_ReadEpsilon]}. *)
external get_epsilon : dt -> float
	= "camlidl_cudd_man_get_epsilon"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetEpsilon}[Cudd_SetEpsilon]}. *)
external set_epsilon : dt -> float -> unit
	= "camlidl_cudd_man_set_epsilon"



(*  ------------------------------------------------------ *)
(** {4 Cache related} *)
(*  ------------------------------------------------------ *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMinHit}[Cudd_ReadMinHit]}. *)
external get_min_hit : 'a t -> int
	= "camlidl_cudd_man_get_min_hit"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMinHit}[Cudd_SetMinHit]}. *)
external set_min_hit : 'a t -> int -> unit
	= "camlidl_cudd_man_set_min_hit"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxCacheHard}[Cudd_ReadMaxCacheHard]}. *)
external get_max_cache_hard : 'a t -> int
	= "camlidl_cudd_man_get_max_cache_hard"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxCacheHard}[Cudd_SetMaxCacheHard]}. *)
external set_max_cache_hard : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_cache_hard"



(*  ------------------------------------------------------ *)
(** {4 Manager} *)
(*  ------------------------------------------------------ *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadLooseUpTo}[Cudd_ReadLooseUpTo]}. *)
external get_looseupto : 'a t -> int
	= "camlidl_cudd_man_get_looseupto"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetLooseUpTo}[Cudd_SetLooseUpTo]}. *)
external set_looseupto : 'a t -> int -> unit
	= "camlidl_cudd_man_set_looseupto"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxLive}[Cudd_ReadMaxLive]}. *)
external get_max_live : 'a t -> int
	= "camlidl_cudd_man_get_max_live"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxLive}[Cudd_SetMaxLive]}. *)
external set_max_live : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_live"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxMemory}[Cudd_ReadMaxMemory]}. *)
external get_max_mem : 'a t -> int64
	= "camlidl_cudd_man_get_max_mem"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxMemory}[Cudd_SetMaxMemory]}. *)
external set_max_mem : 'a t -> int64 -> unit
	= "camlidl_cudd_man_set_max_mem"



(*  ------------------------------------------------------ *)
(** {4 Reordering methods} *)
(*  ------------------------------------------------------ *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSiftMaxSwap}[Cudd_ReadSiftMaxSwap]}. *)
external get_sift_max_swap : 'a t -> int
	= "camlidl_cudd_man_get_sift_max_swap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetSiftMaxSwap}[Cudd_SetSiftMaxSwap]}. *)
external set_sift_max_swap : 'a t -> int -> unit
	= "camlidl_cudd_man_set_sift_max_swap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSiftMaxVar}[Cudd_ReadSiftMaxVar]}. *)
external get_sift_max_var : 'a t -> int
	= "camlidl_cudd_man_get_sift_max_var"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetSiftMaxVar}[Cudd_SetSiftMaxVar]}. *)
external set_sift_max_var : 'a t -> int -> unit
	= "camlidl_cudd_man_set_sift_max_var"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadGroupcheck}[Cudd_ReadGroupcheck]}. *)
external get_groupcheck : 'a t -> aggregation
	= "camlidl_cudd_man_get_groupcheck"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetGroupcheck}[Cudd_SetGroupcheck]}. *)
external set_groupcheck : 'a t -> aggregation -> unit
	= "camlidl_cudd_man_set_groupcheck"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadArcviolation}[Cudd_ReadArcviolation]}. *)
external get_arcviolation : 'a t -> int
	= "camlidl_cudd_man_get_arcviolation"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetArcviolation}[Cudd_SetArcviolation]}. *)
external set_arcviolation : 'a t -> int -> unit
	= "camlidl_cudd_man_set_arcviolation"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadNumberXovers}[Cudd_ReadNumberXovers]}. *)
external get_crossovers : 'a t -> int
	= "camlidl_cudd_man_get_crossovers"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetNumberXovers}[Cudd_SetNumberXovers]}. *)
external set_crossovers : 'a t -> int -> unit
	= "camlidl_cudd_man_set_crossovers"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadPopulationSize}[Cudd_ReadPopulationSize]}. *)
external get_population : 'a t -> int
	= "camlidl_cudd_man_get_population"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetPopulationSize}[Cudd_SetPopulationSize]}. *)
external set_population : 'a t -> int -> unit
	= "camlidl_cudd_man_set_population"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadRecomb}[Cudd_ReadRecomb]}. *)
external get_recomb : 'a t -> int
	= "camlidl_cudd_man_get_recomb"

(** [(Cudd_SetRecomb]. *)
external set_recomb : 'a t -> int -> unit
	= "camlidl_cudd_man_set_recomb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSymmviolation}[Cudd_ReadSymmviolation]}. *)
external get_symmviolation : 'a t -> int
	= "camlidl_cudd_man_get_symmviolation"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetSymmviolation}[Cudd_SetSymmviolation]}. *)
external set_symmviolation : 'a t -> int -> unit
	= "camlidl_cudd_man_set_symmviolation"



(*  ------------------------------------------------------ *)
(** {4 Dynamic reordering} *)
(*  ------------------------------------------------------ *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxGrowth}[Cudd_ReadMaxGrowth]}. *)
external get_max_growth : 'a t -> float
	= "camlidl_cudd_man_get_max_growth"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxGrowth}[Cudd_SetMaxGrowth]}. *)
external set_max_growth : 'a t -> float -> unit
	= "camlidl_cudd_man_set_max_growth"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxGrowthAlternate}[Cudd_ReadMaxGrowthAlternate]}. *)
external get_max_growth_alt : 'a t -> float
	= "camlidl_cudd_man_get_max_growth_alt"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxGrowthAlternate}[Cudd_SetMaxGrowthAlternate]}. *)
external set_max_growth_alt : 'a t -> float -> unit
	= "camlidl_cudd_man_set_max_growth_alt"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadReorderingCycle}[Cudd_ReadReorderingCycle]}. *)
external get_reordering_cycle : 'a t -> int
	= "camlidl_cudd_man_get_reordering_cycle"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetReorderingCycle}[Cudd_SetReorderingCycle]}. *)
external set_reordering_cycle : 'a t -> int -> unit
	= "camlidl_cudd_man_set_reordering_cycle"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxReorderings}[Cudd_ReadMaxReorderings]}. *)
external get_max_reorderings : 'a t -> int
	= "camlidl_cudd_man_get_max_reorderings"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetMaxReorderings}[Cudd_SetMaxReorderings]}. *)
external set_max_reorderings : 'a t -> int -> unit
	= "camlidl_cudd_man_set_max_reorderings"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadNextReordering}[Cudd_ReadNextReordering]}. *)
external get_next_autodyn : 'a t -> int
	= "camlidl_cudd_man_get_next_autodyn"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SetNextReordering}[Cudd_SetNextReordering]}. *)
external set_next_autodyn : 'a t -> int -> unit
	= "camlidl_cudd_man_set_next_autodyn"



(*  ====================================================== *)
(** {3 Statistics} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadCacheHits}[Cudd_ReadCacheHits]}. *)
external get_cache_hits : 'a t -> float
	= "camlidl_cudd_man_get_cache_hits"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadCacheLookUps}[Cudd_ReadCacheLookUps]}. *)
external get_cache_lookups : 'a t -> float
	= "camlidl_cudd_man_get_cache_lookups"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadCacheSlots}[Cudd_ReadCacheSlots]}. *)
external get_cache_slots : 'a t -> int
	= "camlidl_cudd_man_get_cache_slots"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadCacheUsedSlots}[Cudd_ReadCacheUsedSlots]}. *)
external get_cache_used_slots : 'a t -> float
	= "camlidl_cudd_man_get_cache_used_slots"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadDead}[Cudd_ReadDead]}. *)
external get_dead : 'a t -> int
	= "camlidl_cudd_man_get_dead"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadErrorCode}[Cudd_ReadErrorCode]}. *)
external get_error : 'a t -> error
	= "camlidl_cudd_man_get_error"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadGarbageCollectionTime}[Cudd_ReadGarbageCollectionTime]}. *)
external get_gc_time : 'a t -> int
	= "camlidl_cudd_man_get_gc_time"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadGarbageCollections}[Cudd_ReadGarbageCollections]}. *)
external get_gc_nb : 'a t -> int
	= "camlidl_cudd_man_get_gc_nb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadKeys}[Cudd_ReadKeys]}. *)
external get_keys : 'a t -> int
	= "camlidl_cudd_man_get_keys"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadLinear}[Cudd_ReadLinear]}. *)
external get_linear : 'a t -> int -> int -> int
	= "camlidl_cudd_man_get_linear"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMaxCache}[Cudd_ReadMaxCache]}. *)
external get_max_cache : 'a t -> int
	= "camlidl_cudd_man_get_max_cache"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadMinDead}[Cudd_ReadMinDead]}. *)
external get_min_dead : 'a t -> int
	= "camlidl_cudd_man_get_min_dead"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadNodeCount}[Cudd_ReadNodeCount]}. *)
external get_node_count : 'a t -> int
	= "camlidl_cudd_man_get_node_count"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadPeakNodeCount}[Cudd_ReadPeakNodeCount]}. *)
external get_node_count_peak : 'a t -> int
	= "camlidl_cudd_man_get_node_count_peak"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadReorderingTime}[Cudd_ReadReorderingTime]}. *)
external get_reordering_time : 'a t -> int
	= "camlidl_cudd_man_get_reordering_time"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadReorderings}[Cudd_ReadReorderings]}. *)
external get_reordering_nb : 'a t -> int
	= "camlidl_cudd_man_get_reordering_nb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSize}[Cudd_ReadSize]}. *)
external get_bddvar_nb : 'a t -> int
	= "camlidl_cudd_man_get_bddvar_nb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadZddSize}[Cudd_ReadZddSize]}. *)
external get_zddvar_nb : 'a t -> int
	= "camlidl_cudd_man_get_zddvar_nb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSlots}[Cudd_ReadSlots]}. *)
external get_slots : 'a t -> int
	= "camlidl_cudd_man_get_slots"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadUsedSlots}[Cudd_ReadUsedSlots]}. *)
external get_used_slots : 'a t -> float
	= "camlidl_cudd_man_get_used_slots"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadSwapSteps}[Cudd_ReadSwapSteps]}. *)
external get_swap_nb : 'a t -> float
	= "camlidl_cudd_man_get_swap_nb"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_PrintInfo}[Cudd_PrintInfo]}. *)
external print_info : 'a t -> unit
	= "camlidl_cudd_man_print_info"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadPerm}[Cudd_ReadPerm]}. Returns the level of the variable (its order in the BDD) *)
external num_recursive_calls : 'a t -> float
	= "camlidl_cudd_man_num_recursive_calls"

