(* File generated from bdd.idl *)

type bdd__dt
and bdd__vt
and bdd__t


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
external manager : bdd__t -> Man.man__t
	= "camlidl_bdd_manager"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsConstant}[Cudd_IsConstant]}. Is the BDD constant ? *)
external is_cst : bdd__t -> bool
	= "camlidl_bdd_is_cst"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_IsComplement}[Cudd_IsComplement]}. Is the BDD a complemented one ? *)
external is_complement : bdd__t -> bool
	= "camlidl_bdd_is_complement"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_NodeReadIndex}[Cudd_NodeReadIndex]}. Returns the index of the (top node of the) BDD, raises [Invalid_argument] if given a constant BDD *)
external topvar : bdd__t -> int
	= "camlidl_bdd_topvar"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_T}[Cudd_T]}. Returns the positive subnode of the BDD, raises [Invalid_argument] if given a constant BDD *)
external dthen : bdd__t -> bdd__t
	= "camlidl_bdd_dthen"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_E}[Cudd_E]}. Returns the negative subnode of the BDD, raises [Invalid_argument] if given a constant BDD *)
external delse : bdd__t -> bdd__t
	= "camlidl_bdd_delse"


(** Returns the positive and negative cofactor of the BDD wrt the variable *)
external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_bdd_cofactors"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. [cofactor bdd cube] evaluates [bdd] on the cube [cube] *)
external cofactor : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_cofactor"

(** Decomposes the top node of the BDD *)
external inspect: bdd__t -> 'a bdd = "camlidl_bdd_inspect"


(*  ====================================================== *)
(** {3  Supports} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Support}[Cudd_Support]}. Returns the support of the BDD *)
external support : bdd__t -> bdd__t
	= "camlidl_bdd_support"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupportSize}[Cudd_SupportSize]}. Returns the size of the support of the BDD *)
external supportsize : bdd__t -> int
	= "camlidl_bdd_supportsize"

(** [Cuddaux_IsVarIn]. Does the given variable belong the support of the BDD ? *)
external is_var_in : int -> bdd__t -> bool
	= "camlidl_bdd_is_var_in"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cudd_VectorSupport}[Cudd_Cudd_VectorSupport]}. Returns the support of the array of BDDs.

Raises a [Failure] exception in case where the array is of size 0 (in such
case, the manager is unknown, and we cannot return an empty support).  This
operation does not use the global cache, unlike {!support}.  *)
external vectorsupport : 'a t array -> 'a t = "camlidl_bdd_vectorsupport"


(*  ====================================================== *)
(** {3  Manipulation of supports} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLiteralSetIntersection}[Cudd_bddLiteralSetIntersection]}. Intersection of supports *)
external support_inter : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_support_inter"


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAnd}[Cudd_bddAnd]}. Union of supports *)
external support_union: 'a t -> 'a t -> 'a t = "camlidl_bdd_dand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Cofactor}[Cudd_Cofactor]}. Difference of supports *)
external support_diff: 'a t -> 'a t -> 'a t = "camlidl_bdd_cofactor"

(** Converts a support into a list of variables *)
external list_of_support: 'a t -> int list = "camlidl_cudd_list_of_support"



(*  ====================================================== *)
(** {3  Constants and Variables} *)
(*  ====================================================== *)


(** Returns the true BDD *)
external dtrue : Man.man__t -> bdd__t
	= "camlidl_bdd_dtrue"

(** Returns the false BDD *)
external dfalse : Man.man__t -> bdd__t
	= "camlidl_bdd_dfalse"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIthVar}[Cudd_bddIthVar]}. Returns the BDD equivalent to the variable of the given index. *)
external ithvar : Man.man__t -> int -> bdd__t
	= "camlidl_bdd_ithvar"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNewVar}[Cudd_bddNewVar]}. Returns the BDD equivalent to the variable of the next unused index. *)
external newvar : Man.man__t -> bdd__t
	= "camlidl_bdd_newvar"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNewVarAtLevel}[Cudd_bddNewVarAtLevel]}. Returns the BDD equivalent to the variable of the next unused index and sets its level. *)
external newvar_at_level : Man.man__t -> int -> bdd__t
	= "camlidl_bdd_newvar_at_level"



(*  ====================================================== *)
(** {3  Logical tests} *)
(*  ====================================================== *)


(** Is it a true BDD ? *)
external is_true : bdd__t -> bool
	= "camlidl_bdd_is_true"

(** Is it a false BDD ? *)
external is_false : bdd__t -> bool
	= "camlidl_bdd_is_false"

(** Are the two BDDs equal ? *)
external is_equal : bdd__t -> bdd__t -> bool
	= "camlidl_bdd_is_equal"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Does the first BDD implies the second one ? *)
external is_leq : bdd__t -> bdd__t -> bool
	= "camlidl_bdd_is_leq"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Is the intersection (conjunction) of the two BDDs non empty (false) ? *)
external is_inter_empty : bdd__t -> bdd__t -> bool
	= "camlidl_bdd_is_inter_empty"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_EquivDC}[Cudd_EquivDC]}. Are the two first BDDs equal when the third one (careset) is true ? *)
external is_equal_when : bdd__t -> bdd__t -> bdd__t -> bool
	= "camlidl_bdd_is_equal_when"

(** Variation of {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeqUnless}[Cudd_bddLeqUnless]}. Does the first BDD implies the second one when the third one (careset) is true ? *)
external is_leq_when : bdd__t -> bdd__t -> bdd__t -> bool
	= "camlidl_bdd_is_leq_when"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLeq}[Cudd_bddLeq]}. Same as {!is_leq} *)
val is_included_in : 'a t -> 'a t -> bool
(** Is the result of [ite] constant, and if it is the case, what is the constant ? *)
external is_ite_cst : bdd__t -> bdd__t -> bdd__t -> bool option
	= "camlidl_bdd_is_ite_cst"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarIsDependent}[Cudd_bddVarIsDependent]}. Is the given variable dependent on others in the BDD ? *)
external is_var_dependent : int -> bdd__t -> bool
	= "camlidl_bdd_is_var_dependent"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIsVarEssential}[Cudd_bddIsVarEssential]}. Is the given variable with the specified phase implied by the BDD ? *)
external is_var_essential : int -> bool -> bdd__t -> bool
	= "camlidl_bdd_is_var_essential"



(*  ====================================================== *)
(** {3  Structural information} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_DagSize}[Cudd_DagSize]}. Size if the BDD as a graph (the number of nodes). *)
external size : bdd__t -> int
	= "camlidl_bdd_size"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPath}[Cudd_CountPath]}. Number of paths in the BDD from the root to the leaves. *)
external nbpaths : bdd__t -> float
	= "camlidl_bdd_nbpaths"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountPathsToNonZero}[Cudd_CountPathsToNonZero]}. Number of paths in the BDD from the root to the true leaf. *)
external nbtruepaths : bdd__t -> float
	= "camlidl_bdd_nbtruepaths"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_CountMinterm}[Cudd_CountMinterm]}. Number of minterms  of the BDD assuming that it depends on the given number of variables. *)
external nbminterms : int -> bdd__t -> float
	= "camlidl_bdd_nbminterms"

(**
{{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Density}[Cudd_Density]}. Density
of the BDD, which is the ratio of the number of minterms to the number of
nodes. The BDD is assumed to depend on [nvars] variables. *)
external density : int -> bdd__t -> float
	= "camlidl_bdd_density"



(*  ====================================================== *)
(** {3  Logical operations} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_Not}[Cudd_Not]}. Negation *)
external dnot : bdd__t -> bdd__t
	= "camlidl_bdd_dnot"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAnd}[Cudd_bddAnd]}. Conjunction/Intersection *)
external dand : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_dand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddOr}[Cudd_bddOr]}. Disjunction/Union *)
external dor : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_dor"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXor}[Cudd_bddXor]}. Exclusive union *)
external xor : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_xor"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNand}[Cudd_bddNand]}. *)
external nand : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_nand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddNor}[Cudd_bddNor]}. *)
external nor : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_nor"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXnor}[Cudd_bddXnor]}. Equality *)
external nxor : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_nxor"

(** Same as {!nxor} *)
val eq : 'a t -> 'a t -> 'a t

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIte}[Cudd_bddIte]}. If-then-else operation. *)
external ite : bdd__t -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_ite"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIteConstant}[Cudd_bddIteConstant]}. If-then-else operation that succeeds when the result is a node of the arguments. *)
external ite_cst : bdd__t -> bdd__t -> bdd__t -> bdd__t option
	= "camlidl_bdd_ite_cst"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCompose}[Cudd_bddCompose]}. [compose var f bdd] substitutes the variable [var] with the function [f] in [bdd]. *)
external compose : int -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_compose"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVectorCompose}[Cudd_bddVectorCompose]}.
[vectorcompose table bdd] performs a parallel substitution of every variable
[var] present in the manager by [table.(var)] in [bdd]. The size of [table]
should be at least {!Man.get_bddvar_nb}. You can optionnally control the
memoization policy, see {!Memo}. *)
val vectorcompose : ?memo:Memo.t -> 'a t array -> 'a t -> 'a t


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddIntersect}[Cudd_bddIntersect]}. Returns a BDD included in the intersection of the arguments. *)
external intersect : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_intersect"



(*  ====================================================== *)
(** {3  Variable mapping} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddVarMap}[Cudd_bddVarMap]}. Permutes the variables as it has been specified with {!Man.set_varmap}. *)
external varmap : bdd__t -> bdd__t
	= "camlidl_bdd_varmap"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddPermute}[Cudd_bddPermute]}.
Permutes the variables as it is specified by [permut] (same format as in
{!Man.set_varmap}). You can optionnally control the memoization policy, see
{!Memo}. *)
val permute : ?memo:Memo.t -> 'a t -> int array -> 'a t



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
external iter_cube: (Man.tbool array -> unit) -> 'a t -> unit = "camlidl_bdd_iter_cube"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_ForeachPrime}[Cudd_ForeachPrime]}. Apply the function [f] to each prime
covering the BDD interval. The first BDD argument is the lower bound,
the second the upper bound (which may be equal to the lower bound).
The primes are specified as arrays of elements of type
{!Man.tbool}. The size of the arrays is equal to
{!Man.get_bddvar_nb}, the number of variables present in the
manager. *)
external iter_prime: (Man.tbool array -> unit) -> 'a t -> 'a t -> unit = "camlidl_bdd_iter_prime"



(*  ====================================================== *)
(** {3  Quantifications} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddExistAbstract}[Cudd_bddExistAbstract]}. [exist supp bdd] quantifies existentially the set of variables defined by [supp] in the BDD. *)
external exist : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_exist"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddUnivAbstract}[Cudd_bddUnivAbstract]}. [forall supp bdd] quantifies universally the set of variables defined by [supp] in the BDD. *)
external forall : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_forall"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddAndAbstract}[Cudd_bddAndAbstract]}. Simultaneous existential quantification and intersection of BDDs. Logically, [existand supp x y = exist supp (dand x y)]. *)
external existand : bdd__t -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_existand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddXorExistAbstract}[Cudd_bddXorExistAbstract]}. Simultaneous existential quantification and exclusive or of BDDs. Logically, [existxor supp x y = exist supp (xor x y)]. *)
external existxor : bdd__t -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_existxor"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddBooleanDiff}[Cudd_bddBooleanDiff]}. Boolean difference of the BDD with respect to the variable. *)
external booleandiff : bdd__t -> int -> bdd__t
	= "camlidl_bdd_booleandiff"



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
external cube_union : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_cube_union"


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
external constrain : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_constrain"

(** [Cuddaux_bddTDConstrain]. *)
external tdconstrain : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_tdconstrain"

(** [Cuddaux_bddRestrict]. *)
external restrict : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_restrict"

(** [Cuddaux_bddTDRestrict]. *)
external tdrestrict : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_tdrestrict"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddMinimize}[Cudd_bddMinimize]}. *)
external minimize : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_minimize"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddLICompaction}[Cudd_bddLICompaction]}. *)
external licompaction : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_licompaction"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddSqueeze}[Cudd_bddSqueeze]}. [sqeeze lower upper] returns a (smaller) BDD which is in the functional interval [[lower,upper]]. *)
external squeeze : bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_squeeze"



(*  ====================================================== *)
(** {3  Approximations} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddClippingAnd}[Cudd_bddClippingAnd]}.
[clippingand f g maxdepth direction] *)
external clippingand : bdd__t -> bdd__t -> int -> bool -> bdd__t
	= "camlidl_bdd_clippingand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddClippingAndAbstract}[Cudd_bddClippingAndAbstract]}.
[clippingexistand supp f g maxdepth direction] (order of argulents changed). *)
external clippingexistand : bdd__t -> bdd__t -> bdd__t -> int -> bool -> bdd__t
	= "camlidl_bdd_clippingexistand"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_UnderApprox}[Cudd_UnderApprox]}.
[underapprox nvars threshold safe quality f] *)
external underapprox : int -> int -> bool -> float -> bdd__t -> bdd__t
	= "camlidl_bdd_underapprox"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_OverApprox}[Cudd_OverApprox]}.
[overapprox nvars threshold safe quality f] *)
external overapprox : int -> int -> bool -> float -> bdd__t -> bdd__t
	= "camlidl_bdd_overapprox"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_RemapUnderApprox}[Cudd_RemapUnderApprox]}.
[remapunderapprox nvars threshold quality f] *)
external remapunderapprox : int -> int -> float -> bdd__t -> bdd__t
	= "camlidl_bdd_remapunderapprox"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_RemapOverApprox}[Cudd_RemapOverApprox]}.
[remapovererapprox nvars threshold quality f] *)
external remapoverapprox : int -> int -> float -> bdd__t -> bdd__t
	= "camlidl_bdd_remapoverapprox"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BiasedUnderApprox}[Cudd_BiasedUnderApprox]}.
[biasedunderapprox nvars threshold quality1 quality0 f g] *)
external biasedunderapprox : int -> int -> float -> float -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_biasedunderapprox_bytecode" "camlidl_bdd_biasedunderapprox"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_BiasedOverApprox}[Cudd_BiasedOverApprox]}.
[biasedovererapprox nvars threshold quality1 quality0 f g] *)
external biasedoverapprox : int -> int -> float -> float -> bdd__t -> bdd__t -> bdd__t
	= "camlidl_bdd_biasedoverapprox_bytecode" "camlidl_bdd_biasedoverapprox"

(** For the 4 next functions, the profile is [XXcompress nvars threshold f]. *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetCompress}[Cudd_SubsetCompress]}. *)
external subsetcompress : int -> int -> bdd__t -> bdd__t
	= "camlidl_bdd_subsetcompress"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetCompress}[Cudd_SupersetCompress]}. *)
external supersetcompress : int -> int -> bdd__t -> bdd__t
	= "camlidl_bdd_supersetcompress"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetHeavyBranch}[Cudd_SubsetHeavyBranch]}. *)
external subsetHB : int -> int -> bdd__t -> bdd__t
	= "camlidl_bdd_subsetHB"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetHeavyBranch}[Cudd_SupersetHeavyBranch]}. *)
external supersetHB : int -> int -> bdd__t -> bdd__t
	= "camlidl_bdd_supersetHB"

(** For the 2 next functions, the profile is [XXXsetSP nvars threshold hardlimit f]. *)

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SubsetShortPaths}[Cudd_SubsetShortPaths]}. *)
external subsetSP : int -> int -> bool -> bdd__t -> bdd__t
	= "camlidl_bdd_subsetSP"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_SupersetShortPaths}[Cudd_SupersetShortPaths]}. *)
external supersetSP : int -> int -> bool -> bdd__t -> bdd__t
	= "camlidl_bdd_supersetSP"


(** The following functions perform two-way conjunctive (disjunctive)
decomposition of a BDD. Returns a pair if successful, [None] if no
decomposition has been found. *)
(** [Cudd_bddApproxConjDecomp]. *)
external approxconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_approxconjdecomp"
(** [Cudd_bddApproxDisjDecomp]. *)
external approxdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_approxdisjdecomp"
(** [Cudd_bddIterConjDecomp]. *)
external iterconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_iterconjdecomp"
(** [Cudd_bddIterDisjDecomp]. *)
external iterdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_iterdisjdecomp"
(** [Cudd_bddGenConjDecomp]. *)
external genconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_genconjdecomp"
(** [Cudd_bddGenDisjDecomp]. *)
external gendisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_gendisjdecomp"
(** [Cudd_bddVarConjDecomp]. *)
external varconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_varconjdecomp"
(** [Cudd_bddVarDisjDecomp]. *)
external vardisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_bdd_vardisjdecomp"


(*  ====================================================== *)
(** {3  Miscellaneous} *)
(*  ====================================================== *)


(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddTransfer}[Cudd_bddTransfer]}. Transfers a BDD to a different manager. *)
external transfer : bdd__t -> Man.man__t -> bdd__t
	= "camlidl_bdd_transfer"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCorrelation}[Cudd_bddCorrelation]}. Computes the correlation of f and g (if
[f=g], their correlation is 1, if [f=not g], it is 0) *)
external correlation : bdd__t -> bdd__t -> float
	= "camlidl_bdd_correlation"

(** {{:http://vlsi.colorado.edu/~fabio/CUDD/cuddExtDet.html#Cudd_bddCorrelationWeights}[Cudd_bddCorrelationWeights]}. *)
external correlationweights : bdd__t -> bdd__t -> float array -> float
	= "camlidl_bdd_correlationweights"



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

