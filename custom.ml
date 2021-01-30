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

