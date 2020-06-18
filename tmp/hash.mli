(* File generated from hash.idl *)

type hash__t

external _create : int -> int -> hash__t
	= "camlidl_hash__create"


(** Internal table *)
val table : t Weak.t ref

(** [create ~size:n arity] create a hashtable of arity [arity], of the
    optional size [n] *)
val create : ?size:int -> int -> t

(** Returns the arity of the hashtable *)
external arity : hash__t -> int
	= "camlidl_hash_arity"

(** Clears the content of the hashtable *)
external clear : hash__t -> unit
	= "camlidl_hash_clear"


(** Clears the content of all created hashtables *)
val clear_all : unit -> unit

