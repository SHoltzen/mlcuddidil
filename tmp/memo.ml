(* File generated from memo.idl *)

type memo_discr =
  | Global
  | Cache
  | Hash
and memo_union =
  | Global
  | Cache of Cache.cache__t
  | Hash of Hash.hash__t
and memo__t = memo_union


let clear = function
  | Hash x -> Hash.clear x
  | Cache x -> Cache.clear x
  | Global -> ()

