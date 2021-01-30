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


external manager : 'a t -> 'a Man.t
	= "camlidl_cudd_bdd_manager"

external is_cst : 'a t -> bool
	= "camlidl_cudd_bdd_is_cst"

external is_complement : 'a t -> bool
	= "camlidl_cudd_bdd_is_complement"

external topvar : 'a t -> int
	= "camlidl_cudd_bdd_topvar"

external dthen : 'a t -> 'a t
	= "camlidl_cudd_bdd_dthen"

external delse : 'a t -> 'a t
	= "camlidl_cudd_bdd_delse"


(** Returns the positive and negative cofactor of the BDD wrt the variable *)
external cofactors : int -> 'a t -> 'a t * 'a t = "camlidl_cudd_bdd_cofactors"

external cofactor : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_cofactor"

external inspect: 'a t -> 'a bdd = "camlidl_cudd_bdd_inspect"


(*  ====================================================== *)
(** {3  Supports} *)
(*  ====================================================== *)


external support : 'a t -> 'a t
	= "camlidl_cudd_bdd_support"

external supportsize : 'a t -> int
	= "camlidl_cudd_bdd_supportsize"

external is_var_in : int -> 'a t -> bool
	= "camlidl_cudd_bdd_is_var_in"

external vectorsupport : 'a t array -> 'a t = "camlidl_cudd_bdd_vectorsupport"


(*  ====================================================== *)
(** {3  Manipulation of supports} *)
(*  ====================================================== *)


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


external dtrue : 'a Man.t -> 'a t
	= "camlidl_cudd_bdd_dtrue"

external dfalse : 'a Man.t -> 'a t
	= "camlidl_cudd_bdd_dfalse"

external ithvar : 'a Man.t -> int -> 'a t
	= "camlidl_cudd_bdd_ithvar"

external newvar : 'a Man.t -> 'a t
	= "camlidl_cudd_bdd_newvar"

external newvar_at_level : 'a Man.t -> int -> 'a t
	= "camlidl_cudd_bdd_newvar_at_level"



(*  ====================================================== *)
(** {3  Logical tests} *)
(*  ====================================================== *)


external is_true : 'a t -> bool
	= "camlidl_cudd_bdd_is_true"

external is_false : 'a t -> bool
	= "camlidl_cudd_bdd_is_false"

external is_equal : 'a t -> 'a t -> bool
	= "camlidl_cudd_bdd_is_equal"

external is_leq : 'a t -> 'a t -> bool
	= "camlidl_cudd_bdd_is_leq"

external is_inter_empty : 'a t -> 'a t -> bool
	= "camlidl_cudd_bdd_is_inter_empty"

external is_equal_when : 'a t -> 'a t -> 'a t -> bool
	= "camlidl_cudd_bdd_is_equal_when"

external is_leq_when : 'a t -> 'a t -> 'a t -> bool
	= "camlidl_cudd_bdd_is_leq_when"

let is_included_in = is_leq
external is_ite_cst : 'a t -> 'a t -> 'a t -> bool option
	= "camlidl_cudd_bdd_is_ite_cst"

external is_var_dependent : int -> 'a t -> bool
	= "camlidl_cudd_bdd_is_var_dependent"

external is_var_essential : int -> bool -> 'a t -> bool
	= "camlidl_cudd_bdd_is_var_essential"



(*  ====================================================== *)
(** {3  Structural information} *)
(*  ====================================================== *)


external size : 'a t -> int
	= "camlidl_cudd_bdd_size"

external nbpaths : 'a t -> float
	= "camlidl_cudd_bdd_nbpaths"

external nbtruepaths : 'a t -> float
	= "camlidl_cudd_bdd_nbtruepaths"

external nbminterms : int -> 'a t -> float
	= "camlidl_cudd_bdd_nbminterms"

external density : int -> 'a t -> float
	= "camlidl_cudd_bdd_density"



(*  ====================================================== *)
(** {3  Logical operations} *)
(*  ====================================================== *)


external dnot : 'a t -> 'a t
	= "camlidl_cudd_bdd_dnot"

external dand : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_dand"

external dor : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_dor"

external xor : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_xor"

external nand : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_nand"

external nor : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_nor"

external nxor : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_nxor"

let eq = nxor
external ite : 'a t -> 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_ite"

external ite_cst : 'a t -> 'a t -> 'a t -> 'a t option
	= "camlidl_cudd_bdd_ite_cst"

external compose : int -> 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_compose"


external _vectorcompose : 'a t array -> 'a t -> 'a t = "camlidl_cudd_bdd_vectorcompose"
external _vectorcompose_memo : Memo.t -> 'a t array -> 'a t -> 'a t = "camlidl_cudd_bdd_vectorcompose_memo"
let vectorcompose ?memo tbdd bdd =
  match memo with
  | Some(memo) ->
      let arity = match memo with
	| Memo.Global -> 1
	| Memo.Cache x -> Cache.arity x
	| Memo.Hash x -> Hash.arity x
      in
      if arity<>1 then
	raise (Invalid_argument "Cudd.Bdd.vectorcompose_memo: memo.arity<>1")
      ;
      _vectorcompose_memo memo tbdd bdd
  | None ->
      _vectorcompose tbdd bdd

external intersect : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_intersect"



(*  ====================================================== *)
(** {3  Variable mapping} *)
(*  ====================================================== *)


external varmap : 'a t -> 'a t
	= "camlidl_cudd_bdd_varmap"


external _permute : 'a t -> int array -> 'a t = "camlidl_cudd_bdd_permute"
external _permute_memo : Memo.t -> 'a t -> int array -> 'a t = "camlidl_cudd_bdd_permute_memo"
let permute ?memo bdd permut =
  match memo with
  | Some memo ->
      let arity = match memo with
	| Memo.Global -> 1
	| Memo.Cache x -> Cache.arity x
	| Memo.Hash x -> Hash.arity x
      in
      if arity<>1 then
	raise (Invalid_argument "Cudd.Bdd.permute: memo.arity<>1")
      ;
      _permute_memo memo bdd permut
  | None ->
      _permute bdd permut


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


external constrain : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_constrain"

external tdconstrain : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_tdconstrain"

external restrict : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_restrict"

external tdrestrict : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_tdrestrict"

external minimize : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_minimize"

external licompaction : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_licompaction"

external squeeze : 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_squeeze"



(*  ====================================================== *)
(** {3  Approximations} *)
(*  ====================================================== *)


external clippingand : 'a t -> 'a t -> int -> bool -> 'a t
	= "camlidl_cudd_bdd_clippingand"

external clippingexistand : 'a t -> 'a t -> 'a t -> int -> bool -> 'a t
	= "camlidl_cudd_bdd_clippingexistand"

external underapprox : int -> int -> bool -> float -> 'a t -> 'a t
	= "camlidl_cudd_bdd_underapprox"

external overapprox : int -> int -> bool -> float -> 'a t -> 'a t
	= "camlidl_cudd_bdd_overapprox"

external remapunderapprox : int -> int -> float -> 'a t -> 'a t
	= "camlidl_cudd_bdd_remapunderapprox"

external remapoverapprox : int -> int -> float -> 'a t -> 'a t
	= "camlidl_cudd_bdd_remapoverapprox"

external biasedunderapprox : int -> int -> float -> float -> 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_biasedunderapprox_bytecode" "camlidl_cudd_bdd_biasedunderapprox"

external biasedoverapprox : int -> int -> float -> float -> 'a t -> 'a t -> 'a t
	= "camlidl_cudd_bdd_biasedoverapprox_bytecode" "camlidl_cudd_bdd_biasedoverapprox"

external subsetcompress : int -> int -> 'a t -> 'a t
	= "camlidl_cudd_bdd_subsetcompress"

external supersetcompress : int -> int -> 'a t -> 'a t
	= "camlidl_cudd_bdd_supersetcompress"

external subsetHB : int -> int -> 'a t -> 'a t
	= "camlidl_cudd_bdd_subsetHB"

external supersetHB : int -> int -> 'a t -> 'a t
	= "camlidl_cudd_bdd_supersetHB"

external subsetSP : int -> int -> bool -> 'a t -> 'a t
	= "camlidl_cudd_bdd_subsetSP"

external supersetSP : int -> int -> bool -> 'a t -> 'a t
	= "camlidl_cudd_bdd_supersetSP"

external approxconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_approxconjdecomp"
external approxdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_approxdisjdecomp"
external iterconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_iterconjdecomp"
external iterdisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_iterdisjdecomp"
external genconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_genconjdecomp"
external gendisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_gendisjdecomp"
external varconjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_varconjdecomp"
external vardisjdecomp: 'a t -> ('a t * 'a t) option = "camlidl_cudd_bdd_vardisjdecomp"


(*  ====================================================== *)
(** {3  Miscellaneous} *)
(*  ====================================================== *)


external transfer : 'a t -> 'b Man.t -> 'b t
	= "camlidl_cudd_bdd_transfer"

external correlation : 'a t -> 'a t -> float
	= "camlidl_cudd_bdd_correlation"

external correlationweights : 'a t -> 'a t -> float array -> float
	= "camlidl_cudd_bdd_correlationweights"



(*  ====================================================== *)
(** {3  Printing} *)
(*  ====================================================== *)



(** Raw (C) printing function.  The output may mix badly with the OCAML output. *)
external _print: 'a t -> unit = "camlidl_cudd_print"

open Format

let print__minterm fmt bdd =
  if is_false bdd then pp_print_string fmt "false"
  else if is_true bdd then pp_print_string fmt "true"
  else
    let nb = nbpaths bdd in
    if nb > (float_of_int !Man.print_limit) then
      fprintf fmt "bdd with %i nodes and %g paths" (size bdd) nb
  else begin
    fprintf fmt "@[<v>";
    let first = ref true in
    iter_cube
      (begin fun cube ->
	if not !first then fprintf fmt "@ " else first := false;
	let str = Bytes.create (Array.length cube) in
	Array.iteri
	  (fun i elt ->
	    Bytes.set str i (match elt with
	      | Man.False -> '0'
	      | Man.True -> '1'
	      | Man.Top -> '-'))
	  cube;
	pp_print_string fmt (Bytes.unsafe_to_string str)
      end)
      bdd;
    fprintf fmt "@]"
  end

let print_minterm print_id fmt bdd =
  let _print fmt bdd =
    if is_true bdd then pp_print_string fmt "true"
    else if is_false bdd then pp_print_string fmt "false"
    else begin
    fprintf fmt "@[<hov>";
    let first = ref true in
    iter_cube
      (begin fun cube ->
	if not !first then
	  fprintf fmt " +@ @[<hov>"
	else begin
	  first := false;
	  fprintf fmt "@[<hov>"
	end;
	let firstm = ref true in
	Array.iteri
	  (begin fun i elt ->
	    match elt with
	    | Man.False ->
		if not !firstm then fprintf fmt "^@," else firstm := false;
		fprintf fmt "!%a" print_id i
	    | Man.True ->
		if not !firstm then fprintf fmt "^@," else firstm := false;
		fprintf fmt "%a" print_id i
	    | Man.Top -> ()
	  end)
	  cube;
	fprintf fmt "@]"
      end)
      bdd;
    fprintf fmt "@]"
  end
  in
  let nb = nbpaths bdd in
  if nb > (float_of_int !Man.print_limit) then
    fprintf fmt "@[<hv>bdd with %i nodes and %g paths@,(mon=%a)@]"
      (size bdd) nb
      _print (cube_of_bdd bdd)
  else
    _print fmt bdd


let rec print_list print_id formatter = function
  | (v,b)::suite ->
      fprintf formatter "%s%a"(if b then "" else "!") print_id v;
      if suite<>[] then
	fprintf formatter "^@,%a" (print_list print_id) suite
  | [] -> ()

let rec print print_id formatter bdd =
  if is_true bdd then
    pp_print_string formatter "true"
  else if is_false bdd then
    pp_print_string formatter "false"
  else
    let mon = cube_of_bdd bdd in
    let reste = cofactor bdd mon in
    let istrue = is_true mon in
    if not istrue then
      fprintf formatter "@[<h>%a@]" (print_list print_id) (list_of_cube mon);
    match inspect reste with
    | Bool(_) -> ()
    | Ite(var,alors,sinon) ->
	if not istrue then pp_print_char formatter '^';
	fprintf formatter "ITE(@[<hv>%a;@,%a;@,%a)@]"
	  print_id var (print print_id) alors (print print_id) sinon


external wmc : 'a Man.t -> 'a t -> float array -> float
	= "camlidl_cudd_bdd_wmc"

