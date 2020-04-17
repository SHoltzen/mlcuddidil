(* File generated from cache.idl *)

type cache__t

external _create : int -> int -> int -> cache__t
	= "camlidl_cache__create"


val create : ?size:int -> ?maxsize:int -> arity:int -> t
val create1 : ?size:int -> ?maxsize:int -> unit -> t
val create2 : ?size:int -> ?maxsize:int -> unit -> t
val create3 : ?size:int -> ?maxsize:int -> unit -> t
  (** Creates local caches of the given arity, with initial size [size] and
      maximal size [maxsize]. *)

(** Returns the arity of the local cache. *)
external arity : cache__t -> int
	= "camlidl_cache_arity"

(** Clears the content of the local cache. *)
external clear : cache__t -> unit
	= "camlidl_cache_clear"

