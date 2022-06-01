
type special =
  | Qualifying
  | Invited

type t =
  | Competitive of Division.t
  | Non_competitive of special option

let to_int = function
  | Competitive Intermediate -> 2
  | Competitive Novice -> 1
  | Non_competitive None -> 0
  | Non_competitive Some Qualifying -> -1
  | Non_competitive Some Invited -> -2

let of_int = function
  | 2 -> Competitive Intermediate
  | 1 -> Competitive Novice
  | 0 -> Non_competitive None
  | -1 -> Non_competitive (Some Qualifying)
  | -2 -> Non_competitive (Some Invited)
  | d -> failwith (Format.asprintf "%d is not a valid category" d)

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let to_string = function
  | Competitive Novice -> "Initié"
  | Competitive Intermediate -> "Inter"
  | Non_competitive None -> "non-competitive"
  | Non_competitive Some Qualifying -> "qualifying"
  | Non_competitive Some Invited -> "Invité"

let compare d d' =
  CCOrd.int (to_int d) (to_int d')

let equal d d' = compare d d' = 0

let max d d' =
  if compare d d' < 0 then d' else d

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)


