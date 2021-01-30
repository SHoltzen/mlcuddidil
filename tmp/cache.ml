(* File generated from cache.idl *)

type cache__t

external _create : int -> int -> int -> cache__t
	= "camlidl_cache__create"

external arity : cache__t -> int
	= "camlidl_cache_arity"

external clear : cache__t -> unit
	= "camlidl_cache_clear"


let create ?(size=0) ?(maxsize=max_int) ~arity =
  _create arity size maxsize

let create1 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:1)
let create2 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:2)
let create3 ?size ?maxsize () =
  (create ?size ?maxsize ~arity:3)

