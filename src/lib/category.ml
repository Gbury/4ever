
type special =
  | Qualifying
  | Invited

type t =
  | Competitive of Division.t
  | Non_competitive of special option

let competitive = function
  | Competitive _ -> true
  | Non_competitive _ -> false

let to_int = function
  | Non_competitive Some Invited -> 0
  | Competitive Intermediate -> 1
  | Competitive Novice -> 2
  | Non_competitive None -> 3
  | Non_competitive Some Qualifying -> 4

let of_int = function
  | 0 -> Non_competitive (Some Invited)
  | 1 -> Competitive Intermediate
  | 2 -> Competitive Novice
  | 3 -> Non_competitive None
  | 4 -> Non_competitive (Some Qualifying)
  | d -> failwith (Format.asprintf "%d is not a valid category" d)

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let to_string = function
  | Competitive Novice -> "Initié"
  | Competitive Intermediate -> "Inter"
  | Non_competitive None -> "Autres"
  | Non_competitive Some Qualifying -> "Compétition qualifiante"
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


