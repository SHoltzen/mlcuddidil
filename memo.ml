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



let clear = function
  | Hash x -> Hash.clear x
  | Cache x -> Cache.clear x
  | Global           (** CUDD global cache (arity no more than 2, currently) *) -> ()

