
type t =
  | None
  | Novice
  | Intermediate

let to_int = function
  | None -> 0
  | Novice -> 1
  | Intermediate -> 2

let of_int = function
  | 0 -> None
  | 1 -> Novice
  | 2 -> Intermediate
  | d -> failwith (Format.asprintf "%d is not a valid division" d)

let to_string = function
  | None -> "N/A"
  | Novice -> "initié"
  | Intermediate -> "inter"

let compare d d' =
  CCOrd.int (to_int d) (to_int d')

let max d d' =
  if compare d d' < 0 then d' else d


