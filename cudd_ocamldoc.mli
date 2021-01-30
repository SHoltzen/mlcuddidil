(** Interface to CUDD library *)
(**
{2 Introduction}

User modules:
- {!Man}: CUDD managers;
- {!Bdd}: CUDD BDDs;
- {!Add}: CUDD ADDs;
- {!Mtbdd}, {!Mtbddc}: MTBDDs on OCaml values;
- {!Mapleaf}, {!User}: maps user operations from leaves to
   MTBDDs on such leaves.
- {!Memo}, relying on {!Hash} and {!Cache}: allows the control
  of memoization techniques, for permutation and vector composition functions
  on BDDs and MTBDDs, and user operations.

Internal modules:
- {!Vdd}: MTBDDs on unhashed OCaml values;
- {!Custom}: for user operations on ADDs and MTBDDs;
- {!Weakke} and {!PWeakke}: for polymorphic weak hashtables.

This library provides an OCAML interface to the
{{:http://vlsi.colorado.edu/software.html}CUDD BDD library}, as well as
additional C functions to CUDD (in cuddauxXXX files). The reader is supposed
to have looked at the {{:http://vlsi.colorado.edu/~fabio/CUDD/}user's manual}
of this library.

Most functions of the CUDD library are interfaced; with the exception of ZDDs
functions. If you need it, please tell me, I can do it quickly.

{3 Memory management}

The diagrams are implemented as abstract types, and more precisely
as OCAML {e custom objects}. These objects contain both the
manager which owns the diagram and the diagram itself. They are
garbage collected by the OCAML garbage collection. The effect of
the OCAML garbage collection is to decrease the reference count of
the diagram if it has become unreachable from the OCAML heap, and
to remove the OCAML custom object from the OCAML heap. Later, the
CUDD may possibly garbage the diagram in the C heap, if its
reference count is zero.

For technical reasons, CUDD managers come in two different flavors in the
OCaml interface: one dedicated to BDDs and standard CUDD ADDs (Algebraic
Decision Diagrams, with C {e d}ouble values at leaves) , which has the type
[Man.d Man.t], and one dedicated to BDDs and so-called VDDs, with OCaml {e
v}alues at leaves., which has the type [Man.v Man.t], see {!Man.d}, {!Man.v}
and {!Man.t}.

For efficiency reasons, it is better to link in some way the two
garbage collectors. So, when the CUDD garbage collector is
triggered, in a normal situation (during the creation of a new
node) or because of a reordering operation, it first calls the
OCAML garbage collector, in order to be able to garbage collect as
many nodes as possible.

The function {!Man.set_gc} allows to tune the OCAML garbage
collection of diagrams and the link with the CUDD garbage
collection.

It is possible to apply to the diagrams the polymorphic comparison
test ([Pervasives.compare], from which are derived [=,<=,>=,<,>])
and polymorphic hash function (polymorphic [Hashtbl.hash]). The
comparison function compares lexicographically the pair [address
of the manager, address of the node]). The hash function returns
the address of the node.

{3 This document}

Each module is described separately. For each Ocaml function, we
indicate below in typewriter font the CUDD function to which it
corresponds, whenever possible. If the order of the arguments has
been changed, we usually specify ``variation of'' before.

We do not describe in detail the functions which have a direct
CUDD equivalent. Instead, we refer the user to the original CUDD
documentation.

{3 Organization of the code}

The interface has been written with the help of the CamlIDL tool,
the input files of which are suffixed with [.idl]. CamlIDL
automatizes most of the cumbersome task of writing stub codes and
converting datatypes back and forth between C and OCAML. However,
as we implemented more than a direct interface, we also used the
M4 preprocessor on [.idl] files to simplify the task (instead of
the default cpp C preprocessor).

[.idl] files are thus filtered through M4 and transformed
according to the macro file [macros.m4], then CamlIDL generates
from them four files, suffixed with [.c], [.h], [.ml] and [.mli].

[cudd_caml.c], [cudd_caml.h] [custom_caml.c] and [custom_caml.h]
are not generated from a [.idl] file and contain code common to
all the other files.

The normal user doesn't need to understand this process, as the
library is distributed with all the C and OCAML files already
generated.

{3 Installation and Use}

See the [README] file.

You need:
{ul
{- {{:http://www.gnu.org/software/make}GNU Make}}
{- {{:http://caml.inria.fr}OBJECTIVE CAML 3.0}}
{- {{:http://caml.inria.fr/camlidl}CAMLIDL 1.05}}
{- {{:http://projects.camlcity.org/projects/findlib.html}FINDLIB}}
{- M4 preprocessor, SED, GREP
{{:http://www.gnu.org/software}GNU versions}}
}

{{:http://vlsi.colorado.edu/software.html}CUDD BDD library} is now included
in the distribution.

Flags should be properly set in [Makefile.config] (starting from
[Makefile.config.model]).

Also, the Make rules for some [example.ml] file shows how to compile
a program with the interface.
*)

(** {1 Module [ Hash]: User hashtables} *)

module Hash : sig
  (* File generated from hash.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** User hashtables *)
  
  type t
    (** Abstract type for user hashtables *)
  
  external _create : int -> int -> t
  	= "camlidl_cudd_hash__create"
  
  
  (** Internal table *)
  val table : t Weak.t ref
  
  (** [create ~size:n arity] create a hashtable of arity [arity], of the
      optional size [n] *)
  val create : ?size:int -> int -> t
  
  (** Returns the arity of the hashtable *)
  external arity : t -> int
  	= "camlidl_cudd_hash_arity"
  
  (** Clears the content of the hashtable *)
  external clear : t -> unit
  	= "camlidl_cudd_hash_clear"
  
  
  (** Clears the content of all created hashtables *)
  val clear_all : unit -> unit
  
end


(** {1 Module [ Cache]: Local caches} *)

module Cache : sig
  (* File generated from cache.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** Local caches *)
  
  type t
    (** Abstract type for local caches *)
  
  external _create : int -> int -> int -> t
  	= "camlidl_cudd_cache__create"
  
  
  val create : ?size:int -> ?maxsize:int -> arity:int -> t
  val create1 : ?size:int -> ?maxsize:int -> unit -> t
  val create2 : ?size:int -> ?maxsize:int -> unit -> t
  val create3 : ?size:int -> ?maxsize:int -> unit -> t
    (** Creates local caches of the given arity, with initial size [size] and
        maximal size [maxsize]. *)
  
  (** Returns the arity of the local cache. *)
  external arity : t -> int
  	= "camlidl_cudd_cache_arity"
  
  (** Clears the content of the local cache. *)
  external clear : t -> unit
  	= "camlidl_cudd_cache_clear"
  
end


(** {1 Module [ Memo]: Memoization policy} *)

module Memo : sig
  (* File generated from memo.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** Memoization policy *)
  
  type memo_discr =
    | Global           (** CUDD global cache (arity no more than 2, currently) *)
    | Cache
    | Hash
  
  (** Type of memoization table *)
  type t =
    | Global           (** CUDD global cache (arity no more than 2, currently) *)
    | Cache of Cache.t (** CUDD local cache *)
    | Hash of Hash.t   (** CUDD local hash table
  
  	  It is up to the user to clear regularly such a
  	  table. Forgetting to do so will prevent garbage
  	  collection of nodes stored in the table, which can only
  	  grows, unlike local caches. *)
  
  
  val clear : t -> unit
end


(** {1 Module [ Man]: CUDD Manager} *)

module Man : sig
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
  
end


(** {1 Module [ Bdd]: Binary Decision Diagrams} *)

module Bdd : sig
  (* File generated from bdd.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** Binary Decision Diagrams *)
  
  
  type 'a t
    (** Abstract type for BDDs.
  
      Objects of type ['a t] contain both the top node of the BDD and the manager to which this node belongs. ['a], which is either {!Man.d} or {!Man.v} indicates the kind of manager to which the node belongs, see module {!Man}. The manager can be retrieved with {!manager}.  These objects are automatically garbage collected.*)
  
  
  
  (** Public type for exploring the abstract type [t] *)
  type 'a bdd =
  | Bool of bool             (** Terminal value *)
  | Ite of int * 'a t * 'a t (** Decision on CUDD variable *)
  
  
  type dt = Man.d t
  type vt = Man.v t
    (** Shortcuts *)
  
  
  
  (*  ====================================================== *)
  (** {3 Extractors} *)
  (*  ====================================================== *)
  
  
  (** Returns the manager associated to the BDD *)
  external manager : 'a t -> 'a Man.t
  	= "camlidl_cudd_bdd_manager"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsConstant}[Cudd_IsConstant]}. Is the BDD constant ? *)
  external is_cst : 'a t -> bool
  	= "camlidl_cudd_bdd_is_cst"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsComplement}[Cudd_IsComplement]}. Is the BDD a complemented one ? *)
  external is_complement : 'a t -> bool
  	= "camlidl_cudd_bdd_is_complement"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_NodeReadIndex}[Cudd_NodeReadIndex]}. Returns the index of the (top node of the) BDD, raises [Invalid_argument] if given a constant BDD *)
  external topvar : 'a t -> int
  	= "camlidl_cudd_bdd_topvar"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_T}[Cudd_T]}. Returns the positive subnode of the BDD, raises [Invalid_argument] if given a constant BDD *)
  external dthen : 'a t -> 'a t
  	= "camlidl_cudd_bdd_dthen"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_E}[Cudd_E]}. Returns the negative subnode of the BDD, raises [Invalid_argument] if given a constant BDD *)
  external delse : 'a t -> 'a t
  	= "camlidl_cudd_bdd_delse"
  
  
  (** Returns the positive and negative cofactor of the BDD wrt the variable *)
  external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_bdd_cofactors"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. [cofactor bdd cube] evaluates [bdd] on the cube [cube] *)
  external cofactor : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_cofactor"
  
  (** Decomposes the top node of the BDD *)
  external inspect: 'a t -> 'a bdd = "camlidl_cudd_bdd_inspect"
  
  
  (*  ====================================================== *)
  (** {3  Supports} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Support}[Cudd_Support]}. Returns the support of the BDD *)
  external support : 'a t -> 'a t
  	= "camlidl_cudd_bdd_support"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupportSize}[Cudd_SupportSize]}. Returns the size of the support of the BDD *)
  external supportsize : 'a t -> int
  	= "camlidl_cudd_bdd_supportsize"
  
  (** [Cuddaux_IsVarIn]. Does the given variable belong the support of the BDD ? *)
  external is_var_in : int -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_var_in"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cudd_VectorSupport}[Cudd_Cudd_VectorSupport]}. Returns the support of the array of BDDs.
  
  Raises a [Failure] exception in case where the array is of size 0 (in such
  case, the manager is unknown, and we cannot return an empty support).  This
  operation does not use the global cache, unlike {!support}.  *)
  external vectorsupport : 'a t array -> 'a t = "camlidl_cudd_bdd_vectorsupport"
  
  
  (*  ====================================================== *)
  (** {3  Manipulation of supports} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLiteralSetIntersection}[Cudd_bddLiteralSetIntersection]}. Intersection of supports *)
  external support_inter : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_support_inter"
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAnd}[Cudd_bddAnd]}. Union of supports *)
  external support_union: 'a t -> 'a t -> 'a t = "camlidl_cudd_bdd_dand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. Difference of supports *)
  external support_diff: 'a t -> 'a t -> 'a t = "camlidl_cudd_bdd_cofactor"
  
  (** Converts a support into a list of variables *)
  external list_of_support: 'a t -> int list = "camlidl_cudd_list_of_support"
  
  
  
  (*  ====================================================== *)
  (** {3  Constants and Variables} *)
  (*  ====================================================== *)
  
  
  (** Returns the true BDD *)
  external dtrue : 'a Man.t -> 'a t
  	= "camlidl_cudd_bdd_dtrue"
  
  (** Returns the false BDD *)
  external dfalse : 'a Man.t -> 'a t
  	= "camlidl_cudd_bdd_dfalse"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIthVar}[Cudd_bddIthVar]}. Returns the BDD equivalent to the variable of the given index. *)
  external ithvar : 'a Man.t -> int -> 'a t
  	= "camlidl_cudd_bdd_ithvar"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNewVar}[Cudd_bddNewVar]}. Returns the BDD equivalent to the variable of the next unused index. *)
  external newvar : 'a Man.t -> 'a t
  	= "camlidl_cudd_bdd_newvar"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNewVarAtLevel}[Cudd_bddNewVarAtLevel]}. Returns the BDD equivalent to the variable of the next unused index and sets its level. *)
  external newvar_at_level : 'a Man.t -> int -> 'a t
  	= "camlidl_cudd_bdd_newvar_at_level"
  
  
  
  (*  ====================================================== *)
  (** {3  Logical tests} *)
  (*  ====================================================== *)
  
  
  (** Is it a true BDD ? *)
  external is_true : 'a t -> bool
  	= "camlidl_cudd_bdd_is_true"
  
  (** Is it a false BDD ? *)
  external is_false : 'a t -> bool
  	= "camlidl_cudd_bdd_is_false"
  
  (** Are the two BDDs equal ? *)
  external is_equal : 'a t -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_equal"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Does the first BDD implies the second one ? *)
  external is_leq : 'a t -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_leq"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Is the intersection (conjunction) of the two BDDs non empty (false) ? *)
  external is_inter_empty : 'a t -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_inter_empty"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_EquivDC}[Cudd_EquivDC]}. Are the two first BDDs equal when the third one (careset) is true ? *)
  external is_equal_when : 'a t -> 'a t -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_equal_when"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeqUnless}[Cudd_bddLeqUnless]}. Does the first BDD implies the second one when the third one (careset) is true ? *)
  external is_leq_when : 'a t -> 'a t -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_leq_when"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Same as {!is_leq} *)
  val is_included_in : 'a t -> 'a t -> bool
  (** Is the result of [ite] constant, and if it is the case, what is the constant ? *)
  external is_ite_cst : 'a t -> 'a t -> 'a t -> bool option
  	= "camlidl_cudd_bdd_is_ite_cst"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarIsDependent}[Cudd_bddVarIsDependent]}. Is the given variable dependent on others in the BDD ? *)
  external is_var_dependent : int -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_var_dependent"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIsVarEssential}[Cudd_bddIsVarEssential]}. Is the given variable with the specified phase implied by the BDD ? *)
  external is_var_essential : int -> bool -> 'a t -> bool
  	= "camlidl_cudd_bdd_is_var_essential"
  
  
  
  (*  ====================================================== *)
  (** {3  Structural information} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_DagSize}[Cudd_DagSize]}. Size if the BDD as a graph (the number of nodes). *)
  external size : 'a t -> int
  	= "camlidl_cudd_bdd_size"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPath}[Cudd_CountPath]}. Number of paths in the BDD from the root to the leaves. *)
  external nbpaths : 'a t -> float
  	= "camlidl_cudd_bdd_nbpaths"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPathsToNonZero}[Cudd_CountPathsToNonZero]}. Number of paths in the BDD from the root to the true leaf. *)
  external nbtruepaths : 'a t -> float
  	= "camlidl_cudd_bdd_nbtruepaths"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountMinterm}[Cudd_CountMinterm]}. Number of minterms  of the BDD assuming that it depends on the given number of variables. *)
  external nbminterms : int -> 'a t -> float
  	= "camlidl_cudd_bdd_nbminterms"
  
  (**
  {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Density}[Cudd_Density]}. Density
  of the BDD, which is the ratio of the number of minterms to the number of
  nodes. The BDD is assumed to depend on [nvars] variables. *)
  external density : int -> 'a t -> float
  	= "camlidl_cudd_bdd_density"
  
  
  
  (*  ====================================================== *)
  (** {3  Logical operations} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Not}[Cudd_Not]}. Negation *)
  external dnot : 'a t -> 'a t
  	= "camlidl_cudd_bdd_dnot"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAnd}[Cudd_bddAnd]}. Conjunction/Intersection *)
  external dand : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_dand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddOr}[Cudd_bddOr]}. Disjunction/Union *)
  external dor : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_dor"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXor}[Cudd_bddXor]}. Exclusive union *)
  external xor : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_xor"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNand}[Cudd_bddNand]}. *)
  external nand : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_nand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNor}[Cudd_bddNor]}. *)
  external nor : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_nor"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXnor}[Cudd_bddXnor]}. Equality *)
  external nxor : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_nxor"
  
  (** Same as {!nxor} *)
  val eq : 'a t -> 'a t -> 'a t
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIte}[Cudd_bddIte]}. If-then-else operation. *)
  external ite : 'a t -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_ite"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIteConstant}[Cudd_bddIteConstant]}. If-then-else operation that succeeds when the result is a node of the arguments. *)
  external ite_cst : 'a t -> 'a t -> 'a t -> 'a t option
  	= "camlidl_cudd_bdd_ite_cst"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCompose}[Cudd_bddCompose]}. [compose var f bdd] substitutes the variable [var] with the function [f] in [bdd]. *)
  external compose : int -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_compose"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVectorCompose}[Cudd_bddVectorCompose]}.
  [vectorcompose table bdd] performs a parallel substitution of every variable
  [var] present in the manager by [table.(var)] in [bdd]. The size of [table]
  should be at least {!Man.get_bddvar_nb}. You can optionnally control the
  memoization policy, see {!Memo}. *)
  val vectorcompose : ?memo:Memo.t -> 'a t array -> 'a t -> 'a t
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIntersect}[Cudd_bddIntersect]}. Returns a BDD included in the intersection of the arguments. *)
  external intersect : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_intersect"
  
  
  
  (*  ====================================================== *)
  (** {3  Variable mapping} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarMap}[Cudd_bddVarMap]}. Permutes the variables as it has been specified with {!Man.set_varmap}. *)
  external varmap : 'a t -> 'a t
  	= "camlidl_cudd_bdd_varmap"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddPermute}[Cudd_bddPermute]}.
  Permutes the variables as it is specified by [permut] (same format as in
  {!Man.set_varmap}). You can optionnally control the memoization policy, see
  {!Memo}. *)
  val permute : ?memo:Memo.t -> 'a t -> int array -> 'a t
  
  
  (** Swaps variables between the two arrays *)
  external swapvariables : 'a t -> int array -> int array -> 'a t
    = "camlidl_cudd_bdd_swapvariables"
  
  (** Swaps variables between the two arrays *)
  external labeled_vector_compose : 'a t -> 'a t array -> int array -> 'a t
    = "camlidl_cudd_bdd_labeled_vectorcompose"
  
  
  (*  ====================================================== *)
  (** {3  Iterators} *)
  (*  ====================================================== *)
  
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ForeachNode}[Cudd_ForeachNode]}. Apply the function [f] to each (regularized) node of the
   BDD. *)
  external iter_node: ('a t -> unit) -> 'a t -> unit = "camlidl_cudd_iter_node"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ForeachCube}[Cudd_ForeachCube]}. Apply the function [f] to each cube of the
   BDD. The cubes are specified as arrays of
  elements of type {!Man.tbool}. The size of the arrays is equal
  to {!Man.get_bddvar_nb}, the number of variables present in
  the manager. *)
  external iter_cube: (Man.tbool array -> unit) -> 'a t -> unit = "camlidl_cudd_bdd_iter_cube"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ForeachPrime}[Cudd_ForeachPrime]}. Apply the function [f] to each prime
  covering the BDD interval. The first BDD argument is the lower bound,
  the second the upper bound (which may be equal to the lower bound).
  The primes are specified as arrays of elements of type
  {!Man.tbool}. The size of the arrays is equal to
  {!Man.get_bddvar_nb}, the number of variables present in the
  manager. *)
  external iter_prime: (Man.tbool array -> unit) -> 'a t -> 'a t -> unit = "camlidl_cudd_bdd_iter_prime"
  
  
  
  (*  ====================================================== *)
  (** {3  Quantifications} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddExistAbstract}[Cudd_bddExistAbstract]}. [exist supp bdd] quantifies existentially the set of variables defined by [supp] in the BDD. *)
  external exist : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_exist"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddUnivAbstract}[Cudd_bddUnivAbstract]}. [forall supp bdd] quantifies universally the set of variables defined by [supp] in the BDD. *)
  external forall : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_forall"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAndAbstract}[Cudd_bddAndAbstract]}. Simultaneous existential quantification and intersection of BDDs. Logically, [existand supp x y = exist supp (dand x y)]. *)
  external existand : 'a t -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_existand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXorExistAbstract}[Cudd_bddXorExistAbstract]}. Simultaneous existential quantification and exclusive or of BDDs. Logically, [existxor supp x y = exist supp (xor x y)]. *)
  external existxor : 'a t -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_existxor"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddBooleanDiff}[Cudd_bddBooleanDiff]}. Boolean difference of the BDD with respect to the variable. *)
  external booleandiff : 'a t -> int -> 'a t
  	= "camlidl_cudd_bdd_booleandiff"
  
  
  
  (*  ====================================================== *)
  (** {3  Cubes} *)
  (*  ====================================================== *)
  
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_FindEssential}[Cudd_FindEssential]}. Returns the smallest cube (in the sens of inclusion) included in the BDD. *)
  external cube_of_bdd: 'a t -> 'a t = "camlidl_cudd_cube_of_bdd"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CubeArrayToBdd}[Cudd_CubeArrayToBdd]}. Converts a minterm to a BDD (which is a cube). *)
  external cube_of_minterm: 'a Man.t -> Man.tbool array -> 'a t = "camlidl_cudd_cube_of_minterm"
  
  (** Converts a cube into a list of pairs of a variable and a phase. *)
  external list_of_cube: 'a t -> (int*bool) list = "camlidl_cudd_list_of_cube"
  
  (** [Cuddaux_bddCubeUnion]. Computes the union of cubes, which is the smallest cube containing both the argument cubes. *)
  external cube_union : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_cube_union"
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddPickOneCube}[Cudd_bddPickOneCube]}. Picks randomly a minterm in the BDD. *)
  external pick_minterm : 'a t -> Man.tbool array = "camlidl_cudd_pick_minterm"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddPickOneMinterm}[Cudd_bddPickOneMinterm]}. [pick_cube_on_support bdd supp] picks randomly a minterm/cube in the BDD, in which all the variables in the support [supp] have a definite value.
  
  The support argument should contain the support of the BDD (otherwise the result may be incorrect). *)
  external pick_cube_on_support : 'a t -> 'a t -> 'a t = "camlidl_cudd_pick_cube_on_support"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddPickArbitraryMinterms}[Cudd_bddPickArbitraryMinterms]}. [pick_cubes_on_support bdd supp nb] picks  randomly [nb] minterms/cubes in the BDD, in which all the variables in the support have a definite value. The support argument should contain the support of the BDD (otherwise the result may be incorrect).
  
  Fails if the effective number of such minterms in the BDD is less than [nb]. *)
  external pick_cubes_on_support : 'a t -> 'a t -> int -> 'a t array = "camlidl_cudd_pick_cubes_on_support"
  
  
  
  (*  ====================================================== *)
  (** {3  Minimizations} *)
  (*  ====================================================== *)
  
  
  (** The 6 following functions are generalized cofactor operations. [gencof f c] returns a BDD that coincides with [f] whenever [c] is true (and which is hopefully smaller). [constrain] enjoys in addition strong properties (see papers from Madre and Coudert) *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddConstrain}[Cudd_bddConstrain]}. *)
  external constrain : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_constrain"
  
  (** [Cuddaux_bddTDConstrain]. *)
  external tdconstrain : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_tdconstrain"
  
  (** [Cuddaux_bddRestrict]. *)
  external restrict : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_restrict"
  
  (** [Cuddaux_bddTDRestrict]. *)
  external tdrestrict : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_tdrestrict"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddMinimize}[Cudd_bddMinimize]}. *)
  external minimize : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_minimize"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLICompaction}[Cudd_bddLICompaction]}. *)
  external licompaction : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_licompaction"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddSqueeze}[Cudd_bddSqueeze]}. [sqeeze lower upper] returns a (smaller) BDD which is in the functional interval [[lower,upper]]. *)
  external squeeze : 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_squeeze"
  
  
  
  (*  ====================================================== *)
  (** {3  Approximations} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddClippingAnd}[Cudd_bddClippingAnd]}.
  [clippingand f g maxdepth direction] *)
  external clippingand : 'a t -> 'a t -> int -> bool -> 'a t
  	= "camlidl_cudd_bdd_clippingand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddClippingAndAbstract}[Cudd_bddClippingAndAbstract]}.
  [clippingexistand supp f g maxdepth direction] (order of argulents changed). *)
  external clippingexistand : 'a t -> 'a t -> 'a t -> int -> bool -> 'a t
  	= "camlidl_cudd_bdd_clippingexistand"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_UnderApprox}[Cudd_UnderApprox]}.
  [underapprox nvars threshold safe quality f] *)
  external underapprox : int -> int -> bool -> float -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_underapprox"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_OverApprox}[Cudd_OverApprox]}.
  [overapprox nvars threshold safe quality f] *)
  external overapprox : int -> int -> bool -> float -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_overapprox"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_RemapUnderApprox}[Cudd_RemapUnderApprox]}.
  [remapunderapprox nvars threshold quality f] *)
  external remapunderapprox : int -> int -> float -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_remapunderapprox"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_RemapOverApprox}[Cudd_RemapOverApprox]}.
  [remapovererapprox nvars threshold quality f] *)
  external remapoverapprox : int -> int -> float -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_remapoverapprox"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BiasedUnderApprox}[Cudd_BiasedUnderApprox]}.
  [biasedunderapprox nvars threshold quality1 quality0 f g] *)
  external biasedunderapprox : int -> int -> float -> float -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_biasedunderapprox_bytecode" "camlidl_cudd_bdd_biasedunderapprox"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BiasedOverApprox}[Cudd_BiasedOverApprox]}.
  [biasedovererapprox nvars threshold quality1 quality0 f g] *)
  external biasedoverapprox : int -> int -> float -> float -> 'a t -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_biasedoverapprox_bytecode" "camlidl_cudd_bdd_biasedoverapprox"
  
  (** For the 4 next functions, the profile is [XXcompress nvars threshold f]. *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetCompress}[Cudd_SubsetCompress]}. *)
  external subsetcompress : int -> int -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_subsetcompress"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetCompress}[Cudd_SupersetCompress]}. *)
  external supersetcompress : int -> int -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_supersetcompress"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetHeavyBranch}[Cudd_SubsetHeavyBranch]}. *)
  external subsetHB : int -> int -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_subsetHB"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetHeavyBranch}[Cudd_SupersetHeavyBranch]}. *)
  external supersetHB : int -> int -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_supersetHB"
  
  (** For the 2 next functions, the profile is [XXXsetSP nvars threshold hardlimit f]. *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetShortPaths}[Cudd_SubsetShortPaths]}. *)
  external subsetSP : int -> int -> bool -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_subsetSP"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetShortPaths}[Cudd_SupersetShortPaths]}. *)
  external supersetSP : int -> int -> bool -> 'a t -> 'a t
  	= "camlidl_cudd_bdd_supersetSP"
  
  
  (** The following functions perform two-way conjunctive (disjunctive)
  decomposition of a BDD. Returns a pair if successful, [None] if no
  decomposition has been found. *)
  (** [Cudd_bddApproxConjDecomp]. *)
  external approxconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_approxconjdecomp"
  (** [Cudd_bddApproxDisjDecomp]. *)
  external approxdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_approxdisjdecomp"
  (** [Cudd_bddIterConjDecomp]. *)
  external iterconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_iterconjdecomp"
  (** [Cudd_bddIterDisjDecomp]. *)
  external iterdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_iterdisjdecomp"
  (** [Cudd_bddGenConjDecomp]. *)
  external genconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_genconjdecomp"
  (** [Cudd_bddGenDisjDecomp]. *)
  external gendisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_gendisjdecomp"
  (** [Cudd_bddVarConjDecomp]. *)
  external varconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_varconjdecomp"
  (** [Cudd_bddVarDisjDecomp]. *)
  external vardisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_vardisjdecomp"
  
  
  (*  ====================================================== *)
  (** {3  Miscellaneous} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddTransfer}[Cudd_bddTransfer]}. Transfers a BDD to a different manager. *)
  external transfer : 'a t -> 'b Man.t -> 'b t
  	= "camlidl_cudd_bdd_transfer"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCorrelation}[Cudd_bddCorrelation]}. Computes the correlation of f and g (if
  [f=g], their correlation is 1, if [f=not g], it is 0) *)
  external correlation : 'a t -> 'a t -> float
  	= "camlidl_cudd_bdd_correlation"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCorrelationWeights}[Cudd_bddCorrelationWeights]}. *)
  external correlationweights : 'a t -> 'a t -> float array -> float
  	= "camlidl_cudd_bdd_correlationweights"
  
  
  
  (*  ====================================================== *)
  (** {3  Printing} *)
  (*  ====================================================== *)
  
  
  
  (** Raw (C) printing function.  The output may mix badly with the OCAML output. *)
  external _print: 'a t -> unit = "camlidl_cudd_print"
  
  (** Prints the minterms of the BDD in the same way as {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Printminterm}[Cudd_Printminterm]}. *)
  val print__minterm: Format.formatter -> 'a t -> unit
  
  (** [print_minterm bassoc fmt bdd] prints the minterms of the BDD using
  [bassoc] to convert indices of variables to names. *)
  val print_minterm: (Format.formatter -> int -> unit) -> Format.formatter -> 'a t -> unit
  
  (** Prints a BDD by recursively decomposing it as monomial followed by a tree. *)
  val print: (Format.formatter -> int -> unit) -> Format.formatter -> 'a t -> unit
  
  val print_list: (Format.formatter -> int -> unit) -> Format.formatter -> (int *bool) list -> unit
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ReadPerm}[Cudd_ReadPerm]}. Returns the level of the variable (its order in the BDD) *)
  external wmc : 'a Man.t -> 'a t -> float array -> float
  	= "camlidl_cudd_bdd_wmc"
  
end


(** {1 Module [ Vdd]: MTBDDs with OCaml values (INTERNAL)} *)

module Vdd : sig
  (* File generated from vdd.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** MTBDDs with OCaml values (INTERNAL) *)
  
  type +'a t
    (** Type of VDDs (that are necessarily attached to a manager of type [Man.v Man.t]).
  
      Objects of this type contains both the top node of the ADD and the manager to which the node belongs. The manager can be retrieved with {!manager}. Objects of this type are automatically garbage collected. *)
  
  
  
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
  
  external manager : 'a t -> Man.v Man.t = "camlidl_cudd_bdd_manager"
  external is_cst : 'a t -> bool = "camlidl_cudd_bdd_is_cst"
  external topvar : 'a t -> int = "camlidl_cudd_bdd_topvar"
  external dthen : 'a t -> 'a t = "camlidl_cudd_add_dthen"
  external delse : 'a t -> 'a t = "camlidl_cudd_add_delse"
  external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_add_cofactors"
  external cofactor : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_cofactor"
  external dval : 'a t -> 'a = "camlidl_cudd_avdd_dval"
  external inspect: 'a t -> 'a vdd = "camlidl_cudd_avdd_inspect"
  
  (* ====================================================== *)
  (** {3 Supports} *)
  (* ====================================================== *)
  
  external support : 'a t -> Man.v Bdd.t = "camlidl_cudd_bdd_support"
  external supportsize : 'a t -> int = "camlidl_cudd_bdd_supportsize"
  external is_var_in : int -> 'a t -> bool = "camlidl_cudd_bdd_is_var_in"
  external vectorsupport : 'a t array -> Man.v Bdd.t = "camlidl_cudd_bdd_vectorsupport"
  external vectorsupport2 : Man.v Bdd.t array -> 'a t array -> Man.v Bdd.t = "camlidl_cudd_add_vectorsupport2"
  
  (* ====================================================== *)
  (** {3 Classical operations} *)
  (* ====================================================== *)
  
  
  external cst : Man.v Man.t -> 'a -> 'a t = "camlidl_cudd_avdd_cst"
  
  
  
  
  (** Be cautious, it is not type safe (if you use  {!nodes_below_level}, etc...: you can try to retrieve a constant value of some type and [()] value of the background value will be treated as another type.*)
  val _background : Man.v Man.t -> 'a t
  
  
  external ite : Man.v Bdd.t -> 'a t -> 'a t -> 'a t = "camlidl_cudd_add_ite"
  external ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a t option = "camlidl_cudd_add_ite_cst"
  external eval_cst : 'a t -> Man.v Bdd.t -> 'a t option = "camlidl_cudd_add_eval_cst"
  external compose : int -> Bdd.vt -> 'a t -> 'a t = "camlidl_cudd_add_compose"
  
  val vectorcompose : ?memo:Memo.t -> Bdd.vt array -> 'a t -> 'a t
  (* ====================================================== *)
  (** {3 Logical tests} *)
  (* ====================================================== *)
  
  external is_equal : 'a t -> 'a t -> bool = "camlidl_cudd_bdd_is_equal"
  external is_equal_when : 'a t -> 'a t -> Man.v Bdd.t -> bool = "camlidl_cudd_bdd_is_equal_when"
  external is_eval_cst : 'a t -> Man.v Bdd.t -> 'a option = "camlidl_cudd_avdd_is_eval_cst"
  external is_ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a option = "camlidl_cudd_avdd_is_ite_cst"
  
  (* ====================================================== *)
  (** {3 Structural information} *)
  (* ====================================================== *)
  
  external size : 'a t -> int = "camlidl_cudd_bdd_size"
  external nbpaths : 'a t -> float = "camlidl_cudd_bdd_nbpaths"
  external nbnonzeropaths : 'a t -> float = "camlidl_cudd_bdd_nbtruepaths"
  external nbminterms : int -> 'a t -> float = "camlidl_cudd_bdd_nbminterms"
  external density : int -> 'a t -> float = "camlidl_cudd_bdd_density"
  external nbleaves : 'a t -> int = "camlidl_cudd_add_nbleaves"
  
  (* ====================================================== *)
  (** {3 Variable mapping} *)
  (* ====================================================== *)
  
  external varmap : 'a t -> 'a t = "camlidl_cudd_add_varmap"
  
  
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
  
  external guard_of_node : 'a t -> 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_node"
  external guard_of_nonbackground : 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_nonbackground"
  
  
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
  
  external constrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_constrain"
  external tdconstrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdconstrain"
  external restrict: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_restrict"
  external tdrestrict : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdrestrict"
  
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
  
  external transfer : 'a t -> Man.v Man.t -> 'a t = "camlidl_cudd_add_transfer"
  
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
  
end


(** {1 Module [ Custom]: Type of identifiers} *)

module Custom : sig
  (* File generated from custom.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** Custom Operations on VDDs*)
  
  (** Type of identifiers *)
  type pid
  
  and mlvalue
  
  (** Common information *)
  type common = {
    pid: pid;
    arity: int;
    memo: Memo.t;
  }
  
  (** Unary operation *)
  type ('a,'b) op1 = {
    common1: common;
    closure1: 'a -> 'b;
  }
  
  (** Binary operation *)
  type ('a,'b,'c) op2 = {
    common2: common;
    closure2: 'a -> 'b -> 'c;
    ospecial2: ('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t option) option;
    commutative: bool;
    idempotent: bool;
  }
  
  (** Binary test *)
  type ('a,'b) test2 = {
    common2t: common;
    closure2t: 'a -> 'b -> bool;
    ospecial2t: ('a Vdd.t -> 'b Vdd.t -> bool option) option;
    symetric: bool;
    reflexive: bool;
  }
  
  (** Ternary operation *)
  type ('a,'b,'c,'d) op3 = {
    common3: common;
    closure3: 'a -> 'b -> 'c -> 'd;
    ospecial3: ('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t option) option;
  }
  
  (** N-ary operation *)
  type ('a,'b) opN = {
    commonN: common;
    arityNbdd: int;
    closureN: Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option;
  }
  
  (** N-ary general operation *)
  type ('a,'b) opG = {
    commonG: common;
    arityGbdd: int;
    closureG: Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option;
    oclosureBeforeRec: (int*bool -> Bdd.vt array -> 'a Vdd.t array -> (Bdd.vt array * 'a Vdd.t array)) option;
    oclosureIte: (int -> 'b Vdd.t -> 'b Vdd.t -> 'b Vdd.t) option;
  }
  
  (** Existential quantification *)
  type 'a exist = {
    commonexist: common;
    combineexist: ('a,'a,'a) op2;
  }
  
  (** Existential quantification combined with intersection *)
  type 'a existand = {
    commonexistand: common;
    combineexistand: ('a,'a,'a) op2;
    bottomexistand: 'a;
  }
  
  (** Existop1ential quantification *)
  type ('a,'b) existop1 = {
    commonexistop1: common;
    combineexistop1: ('b,'b,'b) op2;
    existop1: ('a,'b) op1;
  }
  
  (** Existential quantification combined with intersection *)
  type ('a,'b) existandop1 = {
    commonexistandop1: common;
    combineexistandop1: ('b,'b,'b) op2;
    existandop1: ('a,'b) op1;
    bottomexistandop1: 'b;
  }
  
  external newpid : unit -> pid
  	= "camlidl_custom_newpid"
  
  external apply_op1 : ('a,'b) op1 -> 'a Vdd.t -> 'b Vdd.t
  	= "camlidl_custom_apply_op1"
  
  external apply_op2 : ('a,'b,'c) op2 -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t
  	= "camlidl_custom_apply_op2"
  
  external apply_test2 : ('a,'b) test2 -> 'a Vdd.t -> 'b Vdd.t -> bool
  	= "camlidl_custom_apply_test2"
  
  external apply_op3 : ('a,'b,'c,'d) op3 -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t
  	= "camlidl_custom_apply_op3"
  
  
  external apply_opN : ('a,'b) opN -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t = "camlidl_cudd_apply_opN"
  external apply_opG : ('a,'b) opG -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t = "camlidl_cudd_apply_opG"
  
  external _apply_exist : 'a exist -> Bdd.vt -> 'a Vdd.t -> 'a Vdd.t
  	= "camlidl_custom__apply_exist"
  
  external _apply_existand : 'a existand -> Bdd.vt -> Bdd.vt -> 'a Vdd.t -> 'a Vdd.t
  	= "camlidl_custom__apply_existand"
  
  external _apply_existop1 : ('a,'b) existop1 -> Bdd.vt -> 'a Vdd.t -> 'b Vdd.t
  	= "camlidl_custom__apply_existop1"
  
  external _apply_existandop1 : ('a,'b) existandop1 -> Bdd.vt -> Bdd.vt -> 'a Vdd.t -> 'b Vdd.t
  	= "camlidl_custom__apply_existandop1"
  
end


(** {1 Module [ Weakke]: Hash tables of weak pointers.} *)

module Weakke : sig
  (***********************************************************************)
  (*                                                                     *)
  (*                           Objective Caml                            *)
  (*                                                                     *)
  (*            Damien Doligez, projet Para, INRIA Rocquencourt          *)
  (*                                                                     *)
  (*  Copyright 1997 Institut National de Recherche en Informatique et   *)
  (*  en Automatique.  All rights reserved.  This file is distributed    *)
  (*  under the terms of the GNU Library General Public License, with    *)
  (*  the special exception on linking described in file ../LICENSE.     *)
  (*                                                                     *)
  (***********************************************************************)
  
  (* $Id: weak.mli,v 1.16.2.1 2008/11/13 10:39:46 doligez Exp $ *)
  
  (** Hash tables of weak pointers. *)
  
  (** Original [Weak] module of OCaml distribution modified by
      Bertrand Jeannet with a [Custom] (polymorphic) module.
  *)
  
  (** A weak hash table is a hashed set of values.  Each value may
      magically disappear from the set when it is not used by the
      rest of the program any more.  This is normally used to share
      data structures without inducing memory leaks.
      Weak hash tables are defined on values from a {!Hashtbl.HashedType}
      module; the [equal] relation and [hash] function are taken from that
      module.  We will say that [v] is an instance of [x] if [equal x v]
      is [true].
  
      The [equal] relation must be able to work on a shallow copy of
      the values and give the same result as with the values themselves.
  *)
  
  type 'a t
  type 'a hashtbl = 'a t
  type 'a compare = { hash : 'a -> int; equal : 'a -> 'a -> bool; }
  
  val create : int -> 'a t
  val clear : 'a t -> unit
  val merge : 'a t -> 'a -> 'a
  val merge_map : 'a t -> 'a -> ('a -> 'a) -> 'a
  val add : 'a t -> 'a -> unit
  val remove : 'a t -> 'a -> unit
  val find : 'a t -> 'a -> 'a
  val find_all : 'a t -> 'a -> 'a list
  val mem : 'a t -> 'a -> bool
  val iter : ('a -> 'b) -> 'a t -> unit
  val fold : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
  val count : 'a t -> int
  val stats : 'a t -> int * int * int * int * int * int
  val print :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    (Format.formatter -> 'a -> unit) ->
    Format.formatter -> 'a t -> unit
  
  module type S = sig
    type data
      (** The type of the elements stored in the table. *)
    type t
      (** The type of tables that contain elements of type [data].
  	Note that weak hash tables cannot be marshaled using
  	{!Pervasives.output_value} or the functions of the {!Marshal}
  	module. *)
    val create : int -> t
      (** [create n] creates a new empty weak hash table, of initial
  	size [n].  The table will grow as needed. *)
    val clear : t -> unit
      (** Remove all elements from the table. *)
    val merge : t -> data -> data
      (** [merge t x] returns an instance of [x] found in [t] if any,
  	or else adds [x] to [t] and return [x]. *)
    val merge_map : t -> data -> (data -> data) -> data
      (** Variant of [merge]: [merge_map t x f] is equivalent to
  	[try find t x with Not_found -> let y = f x in add t y; Some y].
  	bE CAUTIOUS: [f x] is assumed to be equal to [x].
      *)
    val add : t -> data -> unit
      (** [add t x] adds [x] to [t].  If there is already an instance
  	of [x] in [t], it is unspecified which one will be
  	returned by subsequent calls to [find] and [merge]. *)
    val remove : t -> data -> unit
      (** [remove t x] removes from [t] one instance of [x].  Does
  	nothing if there is no instance of [x] in [t]. *)
    val find : t -> data -> data
      (** [find t x] returns an instance of [x] found in [t].
  	Raise [Not_found] if there is no such element. *)
    val find_all : t -> data -> data list
      (** [find_all t x] returns a list of all the instances of [x]
  	found in [t]. *)
    val mem : t -> data -> bool
      (** [mem t x] returns [true] if there is at least one instance
  	of [x] in [t], false otherwise. *)
    val iter : (data -> unit) -> t -> unit
      (** [iter f t] calls [f] on each element of [t], in some unspecified
  	order.  It is not specified what happens if [f] tries to change
  	[t] itself. *)
    val fold : (data -> 'a -> 'a) -> t -> 'a -> 'a
      (** [fold f t init] computes [(f d1 (... (f dN init)))] where
  	[d1 ... dN] are the elements of [t] in some unspecified order.
  	It is not specified what happens if [f] tries to change [t]
  	itself. *)
    val count : t -> int
      (** Count the number of elements in the table.  [count t] gives the
  	same result as [fold (fun _ n -> n+1) t 0] but does not delay the
  	deallocation of the dead elements. *)
    val stats : t -> int * int * int * int * int * int
      (** Return statistics on the table.  The numbers are, in order:
  	table length, number of entries, sum of bucket lengths,
  	smallest bucket length, median bucket length, biggest bucket length. *)
    val print :
      ?first:(unit, Format.formatter, unit) format ->
      ?sep:(unit, Format.formatter, unit) format ->
      ?last:(unit, Format.formatter, unit) format ->
      (Format.formatter -> data -> unit) ->
      Format.formatter -> t -> unit
      (** Printing function *)
  end;;
  (** The output signature of the functor {!Weak.Make}. *)
  
  module Make (H : Hashtbl.HashedType) : S with type data = H.t;;
  (** Functor building an implementation of the weak hash table structure. *)
  
  module Compare : sig
    val add : 'a compare -> 'a t -> 'a -> unit
    val find_or : 'a compare -> 'a t -> 'a -> (int -> int -> 'a) -> 'a
    val merge : 'a compare -> 'a t -> 'a -> 'a
    val merge_map : 'a compare -> 'a t -> 'a -> ('a -> 'a) -> 'a
    val find : 'a compare -> 'a t -> 'a -> 'a
    val find_shadow :
      'a compare -> 'a t -> 'a -> ('a Weak.t -> int -> 'b) -> 'b -> 'b
    val remove : 'a compare -> 'a t -> 'a -> unit
    val mem : 'a compare -> 'a t -> 'a -> bool
    val find_all : 'a compare -> 'a t -> 'a -> 'a list
  end
end


(** {1 Module [ PWeakke]: Hash tables of weak pointers, parametrized polymorphic version.} *)

module PWeakke : sig
  (** Hash tables of weak pointers, parametrized polymorphic version. *)
  
  (** Same interface as {!Weakke}. *)
  
  type 'a compare = 'a Weakke.compare = {
    hash : 'a -> int;
    equal : 'a -> 'a -> bool;
  }
  
  type 'a t = {
    compare : 'a compare;
    hashtbl : 'a Weakke.t
  }
  
  val create : ('a -> int) -> ('a -> 'a -> bool) -> int -> 'a t
  val clear : 'a t -> unit
  val merge : 'a t -> 'a -> 'a
  val merge_map : 'a t -> 'a -> ('a -> 'a) -> 'a
  val add : 'a t -> 'a -> unit
  val remove : 'a t -> 'a -> unit
  val find : 'a t -> 'a -> 'a
  val find_all : 'a t -> 'a -> 'a list
  val mem : 'a t -> 'a -> bool
  val iter : ('a -> 'b) -> 'a t -> unit
  val fold : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
  val count : 'a t -> int
  val stats : 'a t -> int * int * int * int * int * int
  val print :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    (Format.formatter -> 'a -> unit) ->
    Format.formatter -> 'a t -> unit
end


(** {1 Module [ Mtbdd]: MTBDDs with OCaml values} *)

module Mtbdd : sig
  (** MTBDDs with OCaml values *)
  
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  type 'a unique
    (** Type of unique representants of MTBDD leaves of type ['a].
  
        For technical reason, type ['a] should not be implemented as
        a custom block with finalization function. (This is checked
        and the program aborts with an error message).
  
        Use {!Mtbddc} module if your type does not fulfill this
        requirement.  [Mtbddc] modules automatically encapsulate the
        value into a ML type. *)
  
  type 'a t = 'a unique Vdd.t
    (** Type of MTBDDs.
  
        Objects of this type contains both the top node of the MTBDD
        and the manager to which the node belongs. The manager can
        be retrieved with {!manager}. Objects of this type are
        automatically garbage collected.  *)
  
  type 'a table = 'a unique PWeakke.t
    (** Hashtable to manage unique constants *)
  
  val print_table :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    (Format.formatter -> 'a -> unit) ->
    Format.formatter -> 'a table -> unit
  
  val make_table : hash:('a -> int) -> equal:('a -> 'a -> bool) -> 'a table
    (** Building a table *)
  
  val unique : 'a table -> 'a -> 'a unique
    (** Building a unique constant *)
  val get : 'a unique -> 'a
    (** Type conversion (no computation) *)
  
  (** Public type for exploring the abstract type [t] *)
  type 'a mtbdd =
    | Leaf of 'a unique      (** Terminal value *)
    | Ite of int * 'a t * 'a t (** Decision on CUDD variable *)
  
  (** We refer to the modules {!Add} and {!Vdd} for the description
      of the interface. *)
  
  (* ====================================================== *)
  (** {3 Extractors} *)
  (* ====================================================== *)
  
  external manager : 'a t -> Man.v Man.t = "camlidl_cudd_bdd_manager"
    (** Returns the manager associated to the MTBDD *)
  
  external is_cst : 'a t -> bool = "camlidl_cudd_bdd_is_cst"
    (** Is the MTBDD constant ? *)
  
  external topvar : 'a t -> int = "camlidl_cudd_bdd_topvar"
    (** Returns the index of the top node of the MTBDD (65535 for a
        constant MTBDD) *)
  
  external dthen : 'a t -> 'a t = "camlidl_cudd_add_dthen"
    (** Returns the positive subnode of the MTBDD *)
  
  external delse : 'a t -> 'a t = "camlidl_cudd_add_delse"
    (** Returns the negative subnode of the MTBDD *)
  
  external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_add_cofactors"
    (** Returns the positive and negative cofactor of the MTBDD wrt
        the variable *)
  
  external cofactor : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_cofactor"
    (** [cofactor mtbdd cube] evaluates [mtbbdd] on the cube [cube] *)
  
  val dval_u : 'a t -> 'a unique
  val dval : 'a t -> 'a
    (** Returns the value of the assumed constant MTBDD *)
  
  val inspect : 'a t -> 'a mtbdd
    (** Decompose the MTBDD *)
  
  (* ====================================================== *)
  (** {3 Supports} *)
  (* ====================================================== *)
  
  external support : 'a t -> Man.v Bdd.t = "camlidl_cudd_bdd_support"
  external supportsize : 'a t -> int = "camlidl_cudd_bdd_supportsize"
  external is_var_in : int -> 'a t -> bool = "camlidl_cudd_bdd_is_var_in"
  external vectorsupport : 'a t array -> Man.v Bdd.t = "camlidl_cudd_bdd_vectorsupport"
  external vectorsupport2 : Man.v Bdd.t array -> 'a t array -> Man.v Bdd.t = "camlidl_cudd_add_vectorsupport2"
  
  (* ====================================================== *)
  (** {3 Classical operations} *)
  (* ====================================================== *)
  
  val cst_u : Man.v Man.t -> 'a unique -> 'a t
  val cst : Man.v Man.t -> 'a table -> 'a -> 'a t
  
  external ite : Man.v Bdd.t -> 'a t -> 'a t -> 'a t = "camlidl_cudd_add_ite"
  external ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a t option = "camlidl_cudd_add_ite_cst"
  external eval_cst : 'a t -> Man.v Bdd.t -> 'a t option = "camlidl_cudd_add_eval_cst"
  external compose : int -> Man.v Bdd.t -> 'a t -> 'a t = "camlidl_cudd_add_compose"
  val vectorcompose: ?memo:Memo.t -> Man.v Bdd.t array -> 'a t -> 'a t
  
  (* ====================================================== *)
  (** {3 Logical tests} *)
  (* ====================================================== *)
  
  external is_equal : 'a t -> 'a t -> bool = "camlidl_cudd_bdd_is_equal"
  external is_equal_when : 'a t -> 'a t -> Man.v Bdd.t -> bool = "camlidl_cudd_bdd_is_equal_when"
  
  
  val is_eval_cst_u : 'a t -> Man.v Bdd.t -> 'a unique option
  val is_ite_cst_u : Man.v Bdd.t -> 'a t -> 'a t -> 'a unique option
  val is_eval_cst : 'a t -> Man.v Bdd.t -> 'a option
  val is_ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a option
  
  (* ====================================================== *)
  (** {3 Structural information} *)
  (* ====================================================== *)
  
  external size : 'a t -> int = "camlidl_cudd_bdd_size"
  external nbpaths : 'a t -> float = "camlidl_cudd_bdd_nbpaths"
  external nbnonzeropaths : 'a t -> float = "camlidl_cudd_bdd_nbtruepaths"
  external nbminterms : int -> 'a t -> float = "camlidl_cudd_bdd_nbminterms"
  external density : int -> 'a t -> float = "camlidl_cudd_bdd_density"
  external nbleaves : 'a t -> int = "camlidl_cudd_add_nbleaves"
  
  (* ====================================================== *)
  (** {3 Variable mapping} *)
  (* ====================================================== *)
  
  external varmap : 'a t -> 'a t = "camlidl_cudd_add_varmap"
  val permute : ?memo:Memo.t -> 'a t -> int array -> 'a t
  
  (* ====================================================== *)
  (** {3 Iterators} *)
  (* ====================================================== *)
  
  val iter_cube_u : (Man.tbool array -> 'a unique -> unit) -> 'a t -> unit
  val iter_cube : (Man.tbool array -> 'a -> unit) -> 'a t -> unit
  
  
  external iter_node: ('a t -> unit) -> 'a t -> unit = "camlidl_cudd_iter_node"
  
  (* ====================================================== *)
  (** {3 Leaves and guards} *)
  (* ====================================================== *)
  
  external guard_of_node : 'a t -> 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_node"
  external guard_of_nonbackground : 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_nonbackground"
  val nodes_below_level: ?max:int -> 'a t -> int option -> 'a t array
  
  (** Guard of the given leaf *)
  val guard_of_leaf_u : 'a t -> 'a unique -> Man.v Bdd.t
  val guard_of_leaf : 'a table -> 'a t -> 'a -> Man.v Bdd.t
  
  (** Returns the set of leaf values (excluding the background value) *)
  val leaves_u: 'a t -> 'a unique array
  val leaves: 'a t -> 'a array
  
  (** Picks (but not randomly) a non background leaf. Return [None] if the only leaf is the background leaf. *)
  val pick_leaf_u : 'a t -> 'a unique
  val pick_leaf : 'a t -> 'a
  
  (** Returns the set of leaf values together with their guard in the ADD *)
  val guardleafs_u : 'a t -> (Man.v Bdd.t * 'a unique) array
  val guardleafs : 'a t -> (Man.v Bdd.t * 'a) array
  
  val fold_guardleaves_u: (Man.v Bdd.t -> 'a unique -> 'b -> 'b) -> 'a t -> 'b -> 'b
  val fold_guardleaves: (Man.v Bdd.t -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b
  
  (* ====================================================== *)
  (** {3 Minimizations} *)
  (* ====================================================== *)
  
  external constrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_constrain"
  external tdconstrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdconstrain"
  external restrict: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_restrict"
  external tdrestrict : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdrestrict"
  
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
  
  external transfer : 'a t -> Man.v Man.t -> 'a t = "camlidl_cudd_add_transfer"
  
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
end


(** {1 Module [ Mtbddc]: MTBDDs with finalized OCaml values.} *)

module Mtbddc : sig
  (** MTBDDs with finalized OCaml values. *)
  
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  type 'a capsule = private {
    content : 'a
  }
  type 'a unique
    (** Type of unique representants of MTBDD leaves of type ['a].
  
        Use this module rather than {!Mtbdd} when ['a] is implemented as a
        a custom block with finalization function. *)
  
  type 'a t = 'a unique Vdd.t
    (** Type of MTBDDs.
  
        Objects of this type contains both the top node of the MTBDD
        and the manager to which the node belongs. The manager can
        be retrieved with {!manager}. Objects of this type are
        automatically garbage collected.  *)
  
  type 'a table = 'a unique PWeakke.t
    (** Hashtable to manage unique constants *)
  
  val print_table :
    ?first:(unit, Format.formatter, unit) format ->
    ?sep:(unit, Format.formatter, unit) format ->
    ?last:(unit, Format.formatter, unit) format ->
    (Format.formatter -> 'a -> unit) ->
    Format.formatter -> 'a table -> unit
  
  val make_table : hash:('a -> int) -> equal:('a -> 'a -> bool) -> 'a table
    (** Building a table *)
  
  val unique : 'a table -> 'a -> 'a unique
    (** Building a unique constant *)
  val get : 'a unique -> 'a
    (** Type conversion (no computation) *)
  
  (** Public type for exploring the abstract type [t] *)
  type 'a mtbdd =
    | Leaf of 'a unique        (** Terminal value *)
    | Ite of int * 'a t * 'a t (** Decision on CUDD variable *)
  
  (** We refer to the modules {!Add} and {!Vdd} for the description
      of the interface. *)
  
  (* ====================================================== *)
  (** {3 Extractors} *)
  (* ====================================================== *)
  
  external manager : 'a t -> Man.v Man.t = "camlidl_cudd_bdd_manager"
    (** Returns the manager associated to the MTBDD *)
  
  external is_cst : 'a t -> bool = "camlidl_cudd_bdd_is_cst"
    (** Is the MTBDD constant ? *)
  
  external topvar : 'a t -> int = "camlidl_cudd_bdd_topvar"
    (** Returns the index of the top node of the MTBDD (65535 for a
        constant MTBDD) *)
  
  external dthen : 'a t -> 'a t = "camlidl_cudd_add_dthen"
    (** Returns the positive subnode of the MTBDD *)
  
  external delse : 'a t -> 'a t = "camlidl_cudd_add_delse"
    (** Returns the negative subnode of the MTBDD *)
  
  external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_add_cofactors"
    (** Returns the positive and negative cofactor of the MTBDD wrt
        the variable *)
  
  external cofactor : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_cofactor"
    (** [cofactor mtbdd cube] evaluates [mtbbdd] on the cube [cube] *)
  
  val dval_u : 'a t -> 'a unique
  val dval : 'a t -> 'a
    (** Returns the value of the assumed constant MTBDD *)
  
  val inspect : 'a t -> 'a mtbdd
    (** Decompose the MTBDD *)
  
  (* ====================================================== *)
  (** {3 Supports} *)
  (* ====================================================== *)
  
  external support : 'a t -> Man.v Bdd.t = "camlidl_cudd_bdd_support"
  external supportsize : 'a t -> int = "camlidl_cudd_bdd_supportsize"
  external is_var_in : int -> 'a t -> bool = "camlidl_cudd_bdd_is_var_in"
  external vectorsupport : 'a t array -> Man.v Bdd.t = "camlidl_cudd_bdd_vectorsupport"
  external vectorsupport2 : Man.v Bdd.t array -> 'a t array -> Man.v Bdd.t = "camlidl_cudd_add_vectorsupport2"
  
  (* ====================================================== *)
  (** {3 Classical operations} *)
  (* ====================================================== *)
  
  val cst_u : Man.v Man.t -> 'a unique -> 'a t
  val cst : Man.v Man.t -> 'a table -> 'a -> 'a t
  
  external ite : Man.v Bdd.t -> 'a t -> 'a t -> 'a t = "camlidl_cudd_add_ite"
  external ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a t option = "camlidl_cudd_add_ite_cst"
  external eval_cst : 'a t -> Man.v Bdd.t -> 'a t option = "camlidl_cudd_add_eval_cst"
  external compose : int -> Man.v Bdd.t -> 'a t -> 'a t = "camlidl_cudd_add_compose"
  external vectorcompose: Man.v Bdd.t array -> 'a t -> 'a t = "camlidl_cudd_add_vectorcompose"
  
  (* ====================================================== *)
  (** {3 Logical tests} *)
  (* ====================================================== *)
  
  external is_equal : 'a t -> 'a t -> bool = "camlidl_cudd_bdd_is_equal"
  external is_equal_when : 'a t -> 'a t -> Man.v Bdd.t -> bool = "camlidl_cudd_bdd_is_equal_when"
  
  
  val is_eval_cst_u : 'a t -> Man.v Bdd.t -> 'a unique option
  val is_ite_cst_u : Man.v Bdd.t -> 'a t -> 'a t -> 'a unique option
  val is_eval_cst : 'a t -> Man.v Bdd.t -> 'a option
  val is_ite_cst : Man.v Bdd.t -> 'a t -> 'a t -> 'a option
  
  (* ====================================================== *)
  (** {3 Structural information} *)
  (* ====================================================== *)
  
  external size : 'a t -> int = "camlidl_cudd_bdd_size"
  external nbpaths : 'a t -> float = "camlidl_cudd_bdd_nbpaths"
  external nbnonzeropaths : 'a t -> float = "camlidl_cudd_bdd_nbtruepaths"
  external nbminterms : int -> 'a t -> float = "camlidl_cudd_bdd_nbminterms"
  external density : int -> 'a t -> float = "camlidl_cudd_bdd_density"
  external nbleaves : 'a t -> int = "camlidl_cudd_add_nbleaves"
  
  (* ====================================================== *)
  (** {3 Variable mapping} *)
  (* ====================================================== *)
  
  external varmap : 'a t -> 'a t = "camlidl_cudd_add_varmap"
  external permute : 'a t -> int array -> 'a t = "camlidl_cudd_add_permute"
  
  (* ====================================================== *)
  (** {3 Iterators} *)
  (* ====================================================== *)
  
  val iter_cube_u : (Man.tbool array -> 'a unique -> unit) -> 'a t -> unit
  val iter_cube : (Man.tbool array -> 'a -> unit) -> 'a t -> unit
  
  
  external iter_node: ('a t -> unit) -> 'a t -> unit = "camlidl_cudd_iter_node"
  
  (* ====================================================== *)
  (** {3 Leaves and guards} *)
  (* ====================================================== *)
  
  external guard_of_node : 'a t -> 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_node"
  external guard_of_nonbackground : 'a t -> Man.v Bdd.t = "camlidl_cudd_add_guard_of_nonbackground"
  val nodes_below_level: ?max:int -> 'a t -> int option -> 'a t array
  
  (** Guard of the given leaf *)
  val guard_of_leaf_u : 'a t -> 'a unique -> Man.v Bdd.t
  val guard_of_leaf : 'a table -> 'a t -> 'a -> Man.v Bdd.t
  
  (** Returns the set of leaf values (excluding the background value) *)
  val leaves_u: 'a t -> 'a unique array
  val leaves: 'a t -> 'a array
  
  (** Picks (but not randomly) a non background leaf. Return [None] if the only leaf is the background leaf. *)
  val pick_leaf_u : 'a t -> 'a unique
  val pick_leaf : 'a t -> 'a
  
  (** Returns the set of leaf values together with their guard in the ADD *)
  val guardleafs_u : 'a t -> (Man.v Bdd.t * 'a unique) array
  val guardleafs : 'a t -> (Man.v Bdd.t * 'a) array
  
  (** See {!Vdd.fold_guardleaves} *)
  val fold_guardleaves_u : (Man.v Bdd.t -> 'a unique -> 'b -> 'b) -> 'a t -> 'b -> 'b
  val fold_guardleaves : (Man.v Bdd.t -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b
  
  (* ====================================================== *)
  (** {3 Minimizations} *)
  (* ====================================================== *)
  
  external constrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_constrain"
  external tdconstrain: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdconstrain"
  external restrict: 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_restrict"
  external tdrestrict : 'a t -> Man.v Bdd.t -> 'a t = "camlidl_cudd_add_tdrestrict"
  
  (* ====================================================== *)
  (** {3 Conversions} *)
  (* ====================================================== *)
  
  (* ====================================================== *)
  (** {3 User operations} *)
  (* ====================================================== *)
  
  (**
  Two options:
  - By decomposition into guards and leafs: see module {!Mapleaf};
  - By using CUDD cache: see module {!User}.
  *)
  
  (* ====================================================== *)
  (** {3 Miscellaneous} *)
  (* ====================================================== *)
  
  external transfer : 'a t -> Man.v Man.t -> 'a t = "camlidl_cudd_add_transfer"
  
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
end


(** {1 Module [ User]: Custom operations for MTBDDs} *)

module User : sig
  (** Custom operations for MTBDDs *)
  
  (** Important note: The OCaml closure defining the custom
      operation should not use free variables that may be modified
      and so impact its result: they would act as hidden parameters
      that are not taken into account in the memoization table.
  
      If such hidden parameters are modified, the cache should be
      cleared with [Memo.clear], if it is local, otherwise the global
      cache should be cleared with {!Man.flush}. *)
  
  (*  ********************************************************************** *)
  (** {3 Types and values} *)
  (*  ********************************************************************** *)
  
  (*  ====================================================================== *)
  (** {4 Type of registered operations} *)
  (*  ====================================================================== *)
  
  (** Identifiers of closures used in shared memoization tables *)
  type pid = Custom.pid
  
  (** Common information to all operations *)
  type common = Custom.common = {
    pid: pid;
      (** Identifiers for shared memoization tables *)
    arity: int;
      (** Arity of the operations *)
    memo: Memo.t;
      (** Memoization table *)
  }
  
  val newpid : unit -> Custom.pid
  val make_common : ?memo:Memo.t -> int -> common
  
  (*  ********************************************************************** *)
  (** {3 Unary operations} *)
  (*  ********************************************************************** *)
  
  type ('a,'b) op1 = ('a,'b) Custom.op1 = private {
    common1: common;
    closure1: 'a -> 'b;
      (** Operation on leaves *)
  }
  val make_op1 : ?memo:Memo.t -> ('a -> 'b) -> ('a, 'b) op1
    (** Makes a binary operation, with the given memoization policy. *)
  val apply_op1 : ('a, 'b) op1 -> 'a Vdd.t -> 'b Vdd.t
  
  
  (** {5 Example:}
  
      Assuming [type t = bool Vdd.t], and corresponding diagrams
      [bdd:t] and [bdd2:t] (with type [bool], it is safe to use
      directly VDDs, and it simplifies the examples).
  
      We want to negate every leaf of [bdd1] and [bdd2].
  
      {ul
      {- We register the operation:
  
      [let op = make_op1 ~memo:(Cache (Cache.create 1)) (fun b -> not b);;]
      }
      {- Later we apply it on [bdd1] and [bdd2] with
  
      [let res1 = apply_op1 op bdd1 and res2 = apply_op1 op bdd2;;]
      }
      {- The local cache is reused between the two calls to
      [apply_op1], which is nice if [bdd1] and [bdd2] share common
      nodes. The cache is automatically garbage collected when
      needed.  But even if diagrams in the caches entries may be
      garbage collected, the cache itself takes memory. You can
      clear it with [Cache.clear] or [Memo.clear].  }
      {- If [~memo::(Cache (Cache.create 1))] is replaced by
      [~memo::(Hash (Hash.create 1))], then diagrams in the table
      are referenced and cannot be gabage collected.  You should
      clear them explicitly with [Hash.clear] or [Memo.clear].  }
      {- The third option is to use the CUDD global regular cache,
      which is automatically garbage collected when needed:
      }
      {- If the operation is applied only once to one diagram, it is simpler to write
      [let res1 = map_op1 (fun b -> not b) bdd1;;]
      }
      }
  *)
  
  (*  ********************************************************************** *)
  (** {3 Binary operations} *)
  (*  ********************************************************************** *)
  
  type ('a,'b,'c) op2 = ('a,'b,'c) Custom.op2 = private {
    common2: common;
    closure2: 'a -> 'b -> 'c;
      (** Operation on leaves *)
    ospecial2: ('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t option) option;
      (** Special case operation *)
    commutative: bool;
      (** Is the operation commutative ? *)
    idempotent: bool;
      (** Is the operation idempotent ([op x x = x]) ? *)
  }
  val make_op2 :
    ?memo:Memo.t ->
    ?commutative:bool ->
    ?idempotent:bool ->
    ?special:('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t option) ->
    ('a -> 'b -> 'c) -> ('a, 'b, 'c) op2
    (** Makes a binary operation, with the given memoization policy.
  
        [commutative] (default: [false]), when [true], allows to
        optimize the cache usage (hence the speed) when the operation
        is commutative.
  
        [idempotent] (default: [false]) allows similarly some
        optimization when op is idempotent: [op x x = x].
        This makes sense only if ['a='b='c] (the case will never
        happens otherwise).
  
        [?special] (default: [None]), if equal to [Some
        specialcase], modifies [op] as follows: it is applied to
        every pair of node during the recursive descend, and if
        [specialcase vdda vddb = (Some vddc)], then [vddc] is
        assumed to be the result of [map_op2 op vdda vddb].  This
        allows not to perform a full recursive descend when a
        special case is encountered. See the example below.
    *)
  val apply_op2 : ('a, 'b, 'c) op2 -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t
  
  (** {5 Example:}
  
      Assuming as for unary operation example [type t = bool Vdd.t]
      and corresponding diagrams [bdd1:t] and [bdd2:t].
  
      We can compute their conjunction with
  
      {[let res = map_op2
    ~commutative:true ~idempotent:true
    ~special:(fun bdd1 bdd2 ->
      if Vdd.is_cst bdd1 && Vdd.dval bdd1 = false then Some(bdd1)
      else if Vdd.is_cst bdd2 && Vdd.dval bdd2 = false then Some(bdd2)
      else None
    (fun b1 b2 -> b1 && b2) bdd1 bdd2;;]}
  *)
  
  (*  ********************************************************************** *)
  (** {3 Ternary operations} *)
  (*  ********************************************************************** *)
  
  type ('a,'b,'c,'d) op3 = ('a,'b,'c,'d) Custom.op3 = private {
    common3: common;
    closure3: 'a -> 'b -> 'c -> 'd;
      (** Operation on leaves *)
    ospecial3: ('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t option) option;
      (** Special cases *)
  }
  val make_op3 :
    ?memo:Memo.t ->
    ?special:('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t option) ->
    ('a -> 'b -> 'c -> 'd) -> ('a, 'b, 'c, 'd) op3
  val apply_op3 :
    ('a, 'b, 'c, 'd) op3 -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t
    (** Combine the two previous operations.
        if [?memo=None], then a hash table is used, and cleared at the end. *)
  
  (** {5 Example:}
  
      Still assuming [type t = bool Vdd.t]
      and corresponding diagrams [bdd1:t], [bdd2:t], [bdd3:t].
  
      We can define [if-then-else] with
  {[let res = map_op3
    ~special:(fun bdd1 bdd2 bdd3 ->
      if Vdd.is_cst bdd1
      then Some(if Vdd.dval bdd1 (* = true *) then bdd2 else bdd3)
      else None
    )
    (fun b1 b2 b3 -> if b1 then b2 else b3) bdd1 bdd2 bdd3]}
  *)
  
  (*  ********************************************************************** *)
  (** {3 Nary operations} *)
  (*  ********************************************************************** *)
  
  (** N-ary operation *)
  type ('a,'b) opN = ('a,'b) Custom.opN = private {
    commonN: common;
    arityNbdd : int;
    closureN: Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option;
      (** Operation on leaves *)
  }
  val make_opN :
    ?memo:Memo.t ->
    int -> int ->
    (Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option) ->
    ('a, 'b) opN
  val apply_opN : ('a, 'b) opN -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t
  
  (** N-ary general operation *)
  type ('a,'b) opG = ('a,'b) Custom.opG = private {
    commonG: common;
    arityGbdd: int;
    closureG: Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option;
    oclosureBeforeRec: (int*bool -> Bdd.vt array -> 'a Vdd.t array -> (Bdd.vt array * 'a Vdd.t array)) option;
    oclosureIte: (int -> 'b Vdd.t -> 'b Vdd.t -> 'b Vdd.t) option;
  }
  val make_opG :
    ?memo:Memo.t ->
    ?beforeRec:(int*bool -> Bdd.vt array -> 'a Vdd.t array -> (Bdd.vt array * 'a Vdd.t array)) ->
    ?ite:(int -> 'b Vdd.t -> 'b Vdd.t -> 'b Vdd.t) ->
    int -> int ->
    (Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option) ->
    ('a, 'b) opG
  val apply_opG : ('a, 'b) opG -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t
  
  (*  ********************************************************************** *)
  (** {3 Binary tests} *)
  (*  ********************************************************************** *)
  
  type ('a,'b) test2 = ('a,'b) Custom.test2 = private {
    common2t: common;
    closure2t: 'a -> 'b -> bool;
      (** Test on leaves *)
    ospecial2t: ('a Vdd.t -> 'b Vdd.t -> bool option) option;
      (** Special cases *)
    symetric: bool;
      (** Is the relation symetric ? *)
    reflexive: bool;
      (** Is the relation reflexive ? ([test x x = true]) ? *)
  }
  val make_test2 :
    ?memo:Memo.t ->
    ?symetric:bool ->
    ?reflexive:bool ->
    ?special:('a Vdd.t -> 'b Vdd.t -> bool option) ->
    ('a -> 'b -> bool) -> ('a, 'b) test2
    (** Register a binary test, with the given memoization policy,
  
        [symetric] (default: [false]), when [true], allows to
        optimize the cache usage (hence the speed) when the relation is symetric.
  
        [reflexive] (default: [false]) allows similarly some
        optimization when the relation is reflexive: [test x x = true].
        This makes sense only if ['a='b] (the case will never
        happen otherwise).
  
        [?special] (default: [None]) has the same semantics as for
        binary operation above.
    *)
  val apply_test2 : ('a, 'b) test2 -> 'a Vdd.t -> 'b Vdd.t -> bool
  
  (*  ********************************************************************** *)
  (** {3 Quantification} *)
  (*  ********************************************************************** *)
  
  type 'a exist = 'a Custom.exist = private {
    commonexist: common;
    combineexist: ('a,'a,'a) op2;
      (** Combining operation when a decision is eliminated *)
  }
  val make_exist : ?memo:Memo.t -> ('a, 'a, 'a) op2 -> 'a exist
    (** Make an existential quantification operation, with the given
        memoization policy, and the given underlying binary
        operation, assumed to be commutative and idempotent, that
        combines the two branch of the diagram when a decision is
        quantified out. *)
  
  val apply_exist : 'a exist -> supp:Bdd.vt -> 'a Vdd.t -> 'a Vdd.t
  
  (** {5 Example:}
  
      Still assuming [type t = bool Vdd.t]
      and corresponding diagrams [bdd:t]
  
      We define ordinary existential quantification with
  
  {[let dor = make_op2 ~commutative:true ~idempotent:true ( || );;
  let exist = make_exist dor;;
  let res = apply_exist exist ~supp bdd;;
  ]}
  
      We can define ordinary universal quantification by replacing
      [||] with [&&].
  *)
  
  (*  ********************************************************************** *)
  (** {3 Quantification combined with intersection} *)
  (*  ********************************************************************** *)
  
  type 'a existand = 'a Custom.existand = private {
    commonexistand: common;
    combineexistand: ('a,'a,'a) op2;
      (** Combining operation when a decision is eliminated *)
    bottomexistand: 'a;
      (** Value returned when intersecting with [Bdd.dfalse] *)
  }
  val make_existand :
    ?memo:Memo.t -> bottom:'a -> ('a, 'a, 'a) op2 -> 'a existand
  val apply_existand :
    'a existand -> supp:Bdd.vt -> Bdd.vt -> 'a Vdd.t -> 'a Vdd.t
  
  (** [existand ~bottom op2 supp bdd f] is equivalent to
      [exist op2 supp (ite bdd f bottom)].
  
      The leaf operation [op2:'a -> 'a -> 'a] is assumed to be
      commutative, idempotent, and also [op2 f bottom = f]. *)
  
  (*  ********************************************************************** *)
  (** {3 Quantification combined with unary operation} *)
  (*  ********************************************************************** *)
  
  type ('a,'b) existop1 = ('a,'b) Custom.existop1 = private {
    commonexistop1: common;
    combineexistop1: ('b,'b,'b) op2;
      (** Combining operation when a decision is eliminated *)
    existop1: ('a,'b) op1;
      (** Unary operations applied before elimination *)
  }
  val make_existop1 :
    ?memo:Memo.t -> op1:('a, 'b) op1 -> ('b, 'b, 'b) op2 -> ('a, 'b) existop1
  val apply_existop1 :
    ('a, 'b) existop1 -> supp:Bdd.vt -> 'a Vdd.t -> 'b Vdd.t
  
  (** Type of unary operation, conjunction and quantification
  
      [existop1 op1 op2 supp f] is equivalent to
      [exist op2 supp (op1 f)].
  
      The leaf operation [op2:'b -> 'b -> 'b] is assumed to be
      commutative and idempotent.
  *)
  
  (*  ********************************************************************** *)
  (** {3 Quantification combined with intersection and unary operation} *)
  (*  ********************************************************************** *)
  
  type ('a,'b) existandop1 = ('a,'b) Custom.existandop1 = private {
    commonexistandop1: common;
    combineexistandop1: ('b,'b,'b) op2;
      (** Combining operation when a decision is eliminated *)
    existandop1: ('a,'b) op1;
      (** Unary operations applied before elimination *)
    bottomexistandop1: 'b;
      (** Value returned when intersecting with [Bdd.dfalse] *)
  }
  val make_existandop1 :
    ?memo:Memo.t ->
    op1:('a, 'b) op1 -> bottom:'b -> ('b, 'b, 'b) op2 -> ('a, 'b) existandop1
  val apply_existandop1 :
    ('a, 'b) existandop1 ->supp: Bdd.vt -> Bdd.vt -> 'a Vdd.t -> 'b Vdd.t
  
  (**
     [existandop1 ~bottom op op1 supp bdd f] is equivalent to
     [exist op2 supp (ite bdd (op1 f) bottom))].
  
     The leaf operation [op2:'b -> 'b -> 'b] is assumed to be
     commutative, idempotent, and also [op2 f bottom = f]. *)
  
  (*  ********************************************************************** *)
  (** {3 Clearing memoization tables} *)
  (*  ********************************************************************** *)
  
  val clear_common	: common -> unit
  
  val clear_op1		: ('a, 'b) op1		-> unit
  val clear_op2		: ('a, 'b, 'c) op2	-> unit
  val clear_op3		: ('a, 'b, 'c, 'd) op3	-> unit
  val clear_opN		: ('a, 'b) opN		-> unit
  val clear_opG		: ('a, 'b) opG		-> unit
  val clear_test2		: ('a, 'b) test2	-> unit
  val clear_exist		: 'a exist		-> unit
  val clear_existand	: 'a existand		-> unit
  val clear_existop1	: ('a, 'b) existop1	-> unit
  val clear_existandop1	: ('a, 'b) existandop1	-> unit
  
  (*  ********************************************************************** *)
  (** {3 Map operations} *)
  (*  ********************************************************************** *)
  
  (** These operations combine [make_opXXX] and [apply_opXXX]
      operations.
  
      if [?memo=None], then a hash table is used, and cleared at the
      end. *)
  
  val map_op1 : ?memo:Memo.t -> ('a -> 'b) -> 'a Vdd.t -> 'b Vdd.t
  val map_op2 :
    ?memo:Memo.t ->
    ?commutative:bool ->
    ?idempotent:bool ->
    ?special:('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t option) ->
    ('a -> 'b -> 'c) -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t
  val map_op3 :
    ?memo:Memo.t ->
    ?special:('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t option) ->
    ('a -> 'b -> 'c -> 'd) ->
    'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t -> 'd Vdd.t
  val map_opN :
    ?memo:Memo.t ->
    (Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t option) ->
    Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t
  val map_test2 :
    ?memo:Memo.t ->
    ?symetric:bool ->
    ?reflexive:bool ->
    ?special:('a Vdd.t -> 'b Vdd.t -> bool option) ->
    ('a -> 'b -> bool) -> 'a Vdd.t -> 'b Vdd.t -> bool
end


(** {1 Module [ Mapleaf]: Lifting operation on leaves to operations on MTBDDs} *)

module Mapleaf : sig
  (** Lifting operation on leaves to operations on MTBDDs *)
  
  (** This module offers functions to lift operations on leaves to
      operations on MTBDDs on such leaves. Algorithmically, this is done
      by decomposing MTBDDs in lists of pairs [(guard,leaf)].
  
      An alternative, which may be more efficient but a bit less
      flexible, is to use functions of module {!User}.
  
      In order to be usable with both modules {!Mtbdd} and
      {!Mtbddc}, the signature of the functions of this modules use
      the type ['a Vdd.t], but Vdds should not be used directly. *)
  
  
  (*  ********************************************************************** *)
  (** {3 Global option} *)
  (*  ********************************************************************** *)
  
  val restrict : bool ref
    (** If [true], simplifies in some functions
        MTBDDs using {!Mtbdd.restrict} or {!Mtbddc.restrict}. *)
  
  (*  ********************************************************************** *)
  (** {3 Functions of arity 1} *)
  (*  ********************************************************************** *)
  
  (** In the following documentation, the pair [guard,leaf] is
      implicitly iterated on all such pairs contained in the argument
      MTBDD. *)
  
  val mapleaf1 : ('a -> 'b) -> 'a Vdd.t -> 'b Vdd.t
    (** Return the MTBDD [\/ guard -> f leaf] *)
  
  val retractivemapleaf1 :
    default:'a Vdd.t ->
    (Bdd.vt -> 'b -> Bdd.vt * 'a) -> 'b Vdd.t -> 'a Vdd.t
    (** Assuming that the new guards delivered by the function [f]
        are disjoint, return the MTBDD [default \/ (\/ nguard ->
        nleaf)] with [(nguard,nleaf) = f guard leaf]. *)
  
  val expansivemapleaf1 :
    default:'a Vdd.t ->
    merge:('a Vdd.t -> 'a Vdd.t -> 'a Vdd.t) ->
    (Bdd.vt -> 'b -> Bdd.vt * 'a) -> 'b Vdd.t -> 'a Vdd.t
    (** Same as above, but with [\/] replaced by [merge] (supposed
        to be commutative and associative). *)
  
  val combineleaf1 :
    default:'c ->
    combine:('b -> 'c -> 'c) ->
    (Bdd.vt -> 'a -> 'b) -> 'a Vdd.t -> 'c
    (** Generic function, instanciated above.  The result [acc]
        (kind of accumulator) is initialized with [default], to
        which one progressively add [combine acc (f guard leaf)].
  
        [combine] should not be sensitive to the order in which one
        iterates on guards and leaves.  *)
  
  (*  ********************************************************************** *)
  (** {3 Functions of arity 2} *)
  (*  ********************************************************************** *)
  
  (** In the following documentation, the pair [guard1,leaf1]
      (resp. [guard2,leaf2]) is implicitly iterated on all such
      pairs contained in the first (resp. second) argument MTBDD. *)
  
  val mapleaf2 : ('a -> 'b -> 'c) -> 'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t
    (** Return the MTBDD [\/ guard1 /\ guard2 -> f leaf1 leaf2] *)
  
  val retractivemapleaf2 :
    default:'a Vdd.t ->
    (Bdd.vt -> 'b -> 'c -> Bdd.vt * 'a) ->
    'b Vdd.t -> 'c Vdd.t -> 'a Vdd.t
    (** Assuming that the new guards delivered by the function [f]
        are disjoint, return the MTBDD 
        [default \/ (\/ nguard -> nleaf)] with 
        [(nguard,nleaf) = f (guard1 /\ guard2) leaf1 leaf2]. *)
  val expansivemapleaf2 :
    default:'a Vdd.t ->
    merge:('a Vdd.t -> 'a Vdd.t -> 'a Vdd.t) ->
    (Bdd.vt -> 'b -> 'c -> Bdd.vt * 'a) ->
    'b Vdd.t -> 'c Vdd.t -> 'a Vdd.t
    (** Same as above, but with [\/] replaced by [merge] (supposed
        to be commutative and associative). *)
  
  val combineleaf2 :
    default:'d ->
    combine:('c -> 'd -> 'd) ->
    (Bdd.vt -> 'a -> 'b -> 'c) ->
    'a Vdd.t -> 'b Vdd.t -> 'd
    (** Generic function, instanciated above.  The result [acc]
        (kind of accumulator) is initialized with [default], to
        which one progressively add [combine acc (f (guard1 /\
        guard2) leaf1 leaf2)].
  
        [combine] should not be sensitive to the order in which one
        iterates on guards and leaves.  *)
  
  (*  ********************************************************************** *)
  (** {3 Functions on arrays} *)
  (*  ********************************************************************** *)
  
  (** In the following documentation, [tguard,tleaves] denotes
      resp. the conjunctions of guards (of the array of MTBDD) and
      the associated array of leaves. *)
  
  val combineleaf_array :
    default:'c ->
    combine:('b -> 'c -> 'c) ->
    tabsorbant:('a -> bool) option array ->
    (Bdd.vt -> 'a array -> 'b) -> 'a Vdd.t array -> 'c
    (** Generic function,.  The result [acc] (kind of accumulator)
        is initialized with [default], to which one progressively
        add [combine acc (f (/\ tguard) tleaves)].  
  
        The arrays are assumed to be non-empty.
  
        If for some [i], [tabsorbant.(i)=Some abs] and [absorbant
        tleaves.(i)=true], then [f (/\ tguard) tleaves] is assumed
        to return [default] (this allows optimisation).
  
        [combine] should not be sensitive to the order in which one
        iterates on guards and leaves.  *)
  
  val combineleaf1_array :
    default:'d ->
    combine:('c -> 'd -> 'd) ->
    ?absorbant:('a -> bool) ->
    tabsorbant:('b -> bool) option array ->
    (Bdd.vt -> 'a -> 'b array -> 'c) ->
    'a Vdd.t -> 'b Vdd.t array -> 'd
  val combineleaf2_array :
    default:'e ->
    combine:('d -> 'e -> 'e) ->
    ?absorbant1:('a -> bool) ->
    ?absorbant2:('b -> bool) ->
    tabsorbant:('c -> bool) option array ->
    (Bdd.vt -> 'a -> 'b -> 'c array -> 'd) ->
    'a Vdd.t -> 'b Vdd.t -> 'c Vdd.t array -> 'e
    (** Functions similar to [combineleaf_array], but in which the
        first (resp. first and second) leaves (and MTBDD) type may be
        different. *)
  
  (*  ********************************************************************** *)
  (** {3 Internal functions} *)
  (*  ********************************************************************** *)
  
  val combineretractive : Bdd.vt * 'a -> 'a Vdd.t -> 'a Vdd.t
    (** [combinetractive (guard,leaf) vdd = Vdd.ite guard leaf vdd].
        Used in cases where [guard] and the guard of ``interesting
        things'' in [vdd] are disjoint, hence the name.
    *)
  
  val combineexpansive :
    default:'a Vdd.t ->
    merge:('a Vdd.t -> 'b Vdd.t -> 'c Vdd.t) ->
    Bdd.vt * 'a -> 'b Vdd.t -> 'c Vdd.t
    (** [combineexpansive ~default ~merge (guard,leaf) vdd = merge
        (Vdd.ite guard leaf default) vdd]. Implements in some way an
        ``union'' of [(guard,leaf)] and [vdd]. *)
end


(** {1 Module [ Add]: MTBDDs with floats (CUDD ADDs)} *)

module Add : sig
  (* File generated from add.idl *)
  (* This file is part of the MLCUDDIDL Library, released under LGPL license.
     Please read the COPYING file packaged in the distribution  *)
  
  (** MTBDDs with floats (CUDD ADDs) *)
  
  type t
    (** Abstract type for ADDs (that are necessarily attached to a manager of type [Man.d Man.t]).
  
      Objects of this type contains both the top node of the ADD and the manager to which the node belongs. The manager can be retrieved with {!manager}. Objects of this type are automatically garbage collected. *)
  
  
  (** Public type for exploring the abstract type [t] *)
  type add =
  | Leaf of float      (** Terminal value *)
  | Ite of int * t * t (** Decision on CUDD variable *)
  
  
  
  (*  ====================================================== *)
  (** {3 Extractors} *)
  (*  ====================================================== *)
  
  (** Returns the manager associated to the ADD *)
  external manager : t -> Man.dt = "camlidl_cudd_bdd_manager"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsConstant}[Cudd_IsConstant]}. Is the ADD constant ? *)
  external is_cst : t -> bool = "camlidl_cudd_bdd_is_cst"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_NodeReadIndex}[Cudd_NodeReadIndex]}. Returns the index of the ADD (65535 for a constant ADD) *)external topvar : t -> int = "camlidl_cudd_bdd_topvar"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_T}[Cudd_T]}. Returns the positive subnode of the ADD *)
  external dthen : t -> t
  	= "camlidl_cudd_add_dthen"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_E}[Cudd_E]}. Returns the negative subnode of the ADD *)
  external delse : t -> t
  	= "camlidl_cudd_add_delse"
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_V}[Cudd_V]}. Returns the value of the assumed constant ADD *)
  external dval : t -> float = "camlidl_cudd_avdd_dval"
  
  
  (** Returns the positive and negative cofactor of the ADD wrt the variable *)
  external cofactors : int -> t -> t*t = "camlidl_cudd_add_cofactors"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. [cofactor add cube] evaluates [add] on the cube [cube] *)
  external cofactor : t -> Bdd.dt -> t
  	= "camlidl_cudd_add_cofactor"
  
  
  (** Decomposes the top node of the ADD *)
  external inspect: t -> add = "camlidl_cudd_avdd_inspect"
  
  
  (*  ====================================================== *)
  (** {3 Supports} *)
  (*  ====================================================== *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Support}[Cudd_Support]}. Returns the support (positive cube) of the ADD *)
  external support : t -> Bdd.dt = "camlidl_cudd_bdd_support"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupportSize}[Cudd_SupportSize]}. Returns the size of the support of the ADD *)
  external supportsize : t -> int = "camlidl_cudd_bdd_supportsize"
  
  (** [Cuddaux_IsVarIn]. Does the given variable belong to the support of the ADD ? *)
  external is_var_in : int -> t -> bool = "camlidl_cudd_bdd_is_var_in"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_VectorSupport}[Cudd_VectorSupport]}. Returns the support of the array of ADDs.
  
  Raises a [Failure] exception in case where the array is of size 0 (in such
  case, the manager is unknown, and we cannot return an empty support). *)
  external vectorsupport : t array -> Bdd.dt = "camlidl_cudd_bdd_vectorsupport"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_VectorSupport}[Cudd_VectorSupport]}. Returns the support of the BDDs and ADDs arrays.
  
  Raises a [Failure] exception when both arrays are of size 0 (in such
  case, the manager is unknown, and we cannot return an empty support). *)
  external vectorsupport2 : Bdd.dt array -> t array -> Bdd.dt = "camlidl_cudd_add_vectorsupport2"
  
  (*  ====================================================== *)
  (** {3 Classical operations} *)
  (*  ====================================================== *)
  
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addConst}[Cudd_addConst]}. Return a constant ADD with the given value. *)
  external cst : Man.dt -> float -> t = "camlidl_cudd_avdd_cst"
  
  val background : Man.dt -> t
  (** [Cuddaux_addIte]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addIte}[Cudd_addIte]}. If-then-else operation, with the condition being a BDD. *)
  external ite : Bdd.dt -> t -> t -> t
  	= "camlidl_cudd_add_ite"
  
  (** [Cuddaux_addIteConstant]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addIteConstant}[Cudd_addIteConstant]}. If-then-else operation, which succeeds only if the resulting node belongs to one of the two ADD. *)
  external ite_cst : Bdd.dt -> t -> t -> t option
  	= "camlidl_cudd_add_ite_cst"
  
  (** [Cuddaux_addEvalConst]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addEvalConst}[Cudd_addEvalConst]}. *)
  external eval_cst : t -> Bdd.dt -> t option
  	= "camlidl_cudd_add_eval_cst"
  
  (** [Cuddaux_addCompose]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addCompose}[Cudd_addCompose]}. Substitutes the variable with the BDD in the ADD. *)
  external compose : int -> Bdd.dt -> t -> t
  	= "camlidl_cudd_add_compose"
  
  
  (** [Cuddaux_addVectorCompose]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addVectorCompose}[Cudd_addVectorCompose]}.
  Parallel substitution of every variable [var] present in the manager by the
  BDD [table.(var)] in the ADD. You can optionnally control the memoization
  policy, see {!Memo}. *)
  val vectorcompose : ?memo:Memo.t -> Bdd.dt array -> t -> t
  
  (*  ====================================================== *)
  (** {3 Variable mapping} *)
  (*  ====================================================== *)
  
  (** [Cuddaux_addVarMap]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarMap}[Cudd_bddVarMap]}. Permutes the variables as it has been specified with {!Man.set_varmap}. *)
  external varmap : t -> t
  	= "camlidl_cudd_add_varmap"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addPermute}[Cudd_addPermute]}.
  Permutes the variables as it is specified by [permut] (same format as in
  {!Man.set_varmap}). You can optionnally control the memoization policy, see
  {!Memo}. *)
  val permute : ?memo:Memo.t -> t -> int array -> t
  
  
  (*  ====================================================== *)
  (** {3 Logical tests} *)
  (*  ====================================================== *)
  
  (** Equality test *)
  external is_equal: t -> t -> bool = "camlidl_cudd_bdd_is_equal"
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_EquivDC}[Cudd_EquivDC]}. Are the two ADDs equal when the BDD (careset) is true ? *)
  external is_equal_when: t -> t -> Bdd.dt -> bool = "camlidl_cudd_bdd_is_equal_when"
  
  
  (** Variation of [Cuddaux_addEvalConst]/{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addEvalConst}[Cudd_addEvalConst]}. Is the ADD constant when the BDD (careset) is true, and in this case what is its value ? *)
  external is_eval_cst : t -> Bdd.dt -> float option = "camlidl_cudd_avdd_is_eval_cst"
  
  (** Is the result of [ite] constant, and if it is the case, what is its value ? *)
  external is_ite_cst : Bdd.dt -> t -> t -> float option = "camlidl_cudd_avdd_is_ite_cst"
  
  (*  ====================================================== *)
  (** {3 Structural information} *)
  (*  ====================================================== *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_DagSize}[Cudd_DagSize]}. Size if the ADD as a graph (the number of nodes). *)
  external size :  t -> int = "camlidl_cudd_bdd_size"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPath}[Cudd_CountPath]}. Number of paths in the ADD from the root to the leafs. *)
  external nbpaths : t -> float = "camlidl_cudd_bdd_nbpaths"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPathsToNonZero}[Cudd_CountPathsToNonZero]}. Number of paths in the ADD from the root to non-zero leaves. *)
  external nbnonzeropaths : t -> float = "camlidl_cudd_bdd_nbtruepaths"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountMinterm}[Cudd_CountMinterm]}. Number of minterms  of the ADD knowing that it depends on the given number of variables. *)
  external nbminterms : int -> t -> float = "camlidl_cudd_bdd_nbminterms"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Density}[Cudd_Density]}. Density of the ADD, which is the ratio of the number of minterms to the number of nodes. The ADD is assumed to depend on [nvars] variables. *)
  external density : int -> t -> float = "camlidl_cudd_bdd_density"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountLeaves}[Cudd_CountLeaves]}. Number of leaves. *)
  external nbleaves : t -> int
  	= "camlidl_cudd_add_nbleaves"
  
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
  external guard_of_node : t -> t -> Bdd.dt
  	= "camlidl_cudd_add_guard_of_node"
  
  (** Guard of non background leaves *)
  external guard_of_nonbackground : t -> Bdd.dt
  	= "camlidl_cudd_add_guard_of_nonbackground"
  
  
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
  
  external constrain : t -> Bdd.dt -> t
  	= "camlidl_cudd_add_constrain"
  
  external tdconstrain : t -> Bdd.dt -> t
  	= "camlidl_cudd_add_tdconstrain"
  
  external restrict : t -> Bdd.dt -> t
  	= "camlidl_cudd_add_restrict"
  
  external tdrestrict : t -> Bdd.dt -> t
  	= "camlidl_cudd_add_tdrestrict"
  
  (*  ====================================================== *)
  (** {3 Conversions} *)
  (*  ====================================================== *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BddToAdd}[Cudd_BddToAdd]}. Conversion from BDD to 0-1 ADD *)
  external of_bdd : Bdd.dt -> t
  	= "camlidl_cudd_add_of_bdd"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddPattern}[Cudd_addBddPattern]}. Conversion from ADD to BDD by replacing all leaves different from 0  by true. *)
  external to_bdd : t -> Bdd.dt
  	= "camlidl_cudd_add_to_bdd"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddThreshold}[Cudd_addBddThreshold]}. Conversion from ADD to BDD by replacing all leaves greater than or equal to the threshold by true. *)
  external to_bdd_threshold : float -> t -> t
  	= "camlidl_cudd_add_to_bdd_threshold"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddStrictThreshold}[Cudd_addBddStrictThreshold]}. Conversion from ADD to BDD by replacing all leaves strictly greater than the threshold by true.*)
  external to_bdd_strictthreshold : float -> t -> t
  	= "camlidl_cudd_add_to_bdd_strictthreshold"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addBddInterval}[Cudd_addBddInterval]}. Conversion from ADD to BDD  by replacing all leaves in the interval by true. *)
  external to_bdd_interval : float -> float -> t -> t
  	= "camlidl_cudd_add_to_bdd_interval"
  
  (*  ====================================================== *)
  (** {3 Quantifications} *)
  (*  ====================================================== *)
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addExistAbstract}[Cudd_addExistAbstract]}. Abstracts all the variables in the cube from the ADD by summing over all possible values taken by those variables. *)
  external exist : Bdd.dt -> t -> t
  	= "camlidl_cudd_add_exist"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addUnivAbstract}[Cudd_addUnivAbstract]}. Abstracts all the variables in the cube from the ADD by taking the product over all possible values taken by those variables. *)
  external forall : Bdd.dt -> t -> t
  	= "camlidl_cudd_add_forall"
  
  (*  ====================================================== *)
  (** {3 Algebraic operations} *)
  (*  ====================================================== *)
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html# Cudd_addLeq}[ Cudd_addLeq]}. *)
  external is_leq : t -> t -> bool
  	= "camlidl_cudd_add_is_leq"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addPlus}[Cudd_addPlus]}. *)
  external add : t -> t -> t
  	= "camlidl_cudd_add_add"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMinus}[Cudd_addMinus]}. *)
  external sub : t -> t -> t
  	= "camlidl_cudd_add_sub"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTimes}[Cudd_addTimes]}. *)
  external mul : t -> t -> t
  	= "camlidl_cudd_add_mul"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addDivide}[Cudd_addDivide]}. *)
  external div : t -> t -> t
  	= "camlidl_cudd_add_div"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMinimum}[Cudd_addMinimum]}. *)
  external min : t -> t -> t
  	= "camlidl_cudd_add_min"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMaximum}[Cudd_addMaximum]}. *)
  external max : t -> t -> t
  	= "camlidl_cudd_add_max"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addAgreement}[Cudd_addAgreement]}. *)
  external agreement : t -> t -> t
  	= "camlidl_cudd_add_agreement"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addDiff}[Cudd_addDiff]}. *)
  external diff : t -> t -> t
  	= "camlidl_cudd_add_diff"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addThreshold}[Cudd_addThreshold]}. *)
  external threshold : t -> t -> t
  	= "camlidl_cudd_add_threshold"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addSetNZ}[Cudd_addSetNZ]}. *)
  external setNZ : t -> t -> t
  	= "camlidl_cudd_add_setNZ"
  
  (** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addLog}[Cudd_addLog]}. *)
  external log : t -> t
  	= "camlidl_cudd_add_log"
  
  (*  ====================================================== *)
  (** {3 Matrix operations} *)
  (*  ====================================================== *)
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addMatrixMultiply}[Cudd_addMatrixMultiply]}.
  
  [matrix_multiply z A B] performs matrix multiplication of [A] and [B], with [z]
  being the summation variables, which means that they are used to refer columns
  of [A] and to rows of [B]. *)
  external matrix_multiply : int array -> t -> t -> t = "camlidl_cudd_add_matrix_multiply"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTimesPlus}[Cudd_addTimesPlus]}. *)
  external times_plus : int array -> t -> t -> t = "camlidl_cudd_add_times_plus"
  
  (** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_addTriangle}[Cudd_addTriangle]}. *)
  external triangle : int array -> t -> t -> t = "camlidl_cudd_add_triangle"
  
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
  external transfer : t -> Man.d Man.t -> t
  	= "camlidl_cudd_add_transfer"
  
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
  
end

