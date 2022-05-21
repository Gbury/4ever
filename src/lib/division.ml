
type t =
  | None
  | Qualifying
  | Novice
  | Intermediate
  | Invited

let to_int = function
  | None -> 0
  | Qualifying -> 1
  | Novice -> 2
  | Intermediate -> 3
  | Invited -> 4

let of_int = function
  | 0 -> None
  | 1 -> Qualifying
  | 2 -> Novice
  | 3 -> Intermediate
  | 4 -> Invited
  | d -> failwith (Format.asprintf "%d is not a valid division" d)

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let to_string = function
  | None -> "non-competitive"
  | Qualifying -> "qualifying"
  | Novice -> "Initié"
  | Intermediate -> "Inter"
  | Invited -> "Invité"

let compare d d' =
  CCOrd.int (to_int d') (to_int d)

let equal d d' = compare d d' = 0

let max d d' =
  if compare d d' < 0 then d' else d

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)


