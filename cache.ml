(* File generated from cache.idl *)
(* This file is part of the MLCUDDIDL Library, released under LGPL license.
   Please read the COPYING file packaged in the distribution  *)

(** Local caches *)

type t
  (** Abstract type for local caches *)

external _create : int -> int -> int -> t
	= "camlidl_cudd_cache__create"

external arity : t -> int
	= "camlidl_cudd_cache_arity"

external clear : t -> unit
	= "camlidl_cudd_cache_clear"


let create ?(size=0) ?(maxsize=max_int) ~arity =
  _create arity size maxsize

let create1 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:1)
let create2 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:2)
let create3 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:3)

