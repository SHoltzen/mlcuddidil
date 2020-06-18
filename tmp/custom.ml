(* File generated from custom.idl *)

type pid
and mlvalue
and common = {
  pid: pid;
  arity: int;
  memo: Memo.memo__t;
}
and op1 = {
  common1: common;
  closure1: mlvalue;
}
and op2 = {
  common2: common;
  closure2: mlvalue;
  ospecial2: mlvalue;
  commutative: bool;
  idempotent: bool;
}
and test2 = {
  common2t: common;
  closure2t: mlvalue;
  ospecial2t: mlvalue;
  symetric: bool;
  reflexive: bool;
}
and op3 = {
  common3: common;
  closure3: mlvalue;
  ospecial3: mlvalue;
}
and opN = {
  commonN: common;
  arityNbdd: int;
  closureN: mlvalue;
}
and opG = {
  commonG: common;
  arityGbdd: int;
  closureG: mlvalue;
  oclosureBeforeRec: mlvalue;
  oclosureIte: mlvalue;
}
and exist = {
  commonexist: common;
  combineexist: op2;
}
and existand = {
  commonexistand: common;
  combineexistand: op2;
  bottomexistand: mlvalue;
}
and existop1 = {
  commonexistop1: common;
  combineexistop1: op2;
  existop1: op1;
}
and existandop1 = {
  commonexistandop1: common;
  combineexistandop1: op2;
  existandop1: op1;
  bottomexistandop1: mlvalue;
}

external newpid : unit -> pid
	= "camlidl_custom_newpid"

external apply_op1 : op1 -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom_apply_op1"

external apply_op2 : op2 -> Vdd.vdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom_apply_op2"

external apply_test2 : test2 -> Vdd.vdd__t -> Vdd.vdd__t -> bool
	= "camlidl_custom_apply_test2"

external apply_op3 : op3 -> Vdd.vdd__t -> Vdd.vdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom_apply_op3"


external apply_opN : ('a,'b) opN -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t = "camlidl_cudd_apply_opN"
external apply_opG : ('a,'b) opG -> Bdd.vt array -> 'a Vdd.t array -> 'b Vdd.t = "camlidl_cudd_apply_opG"

external _apply_exist : exist -> Bdd.bdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom__apply_exist"

external _apply_existand : existand -> Bdd.bdd__t -> Bdd.bdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom__apply_existand"

external _apply_existop1 : existop1 -> Bdd.bdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom__apply_existop1"

external _apply_existandop1 : existandop1 -> Bdd.bdd__t -> Bdd.bdd__t -> Vdd.vdd__t -> Vdd.vdd__t
	= "camlidl_custom__apply_existandop1"

