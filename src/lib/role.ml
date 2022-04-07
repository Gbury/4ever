
type t =
  | Leader
  | Follower

let to_int = function
  | Leader -> 0
  | Follower -> 1

let of_int = function
  | 0 -> Leader
  | 1 -> Follower
  | d -> failwith (Format.asprintf "%d is not a valid role" d)

let short = function
  | Leader -> "L"
  | Follower -> "F"

let to_string = function
  | Leader -> "Leader"
  | Follower -> "Follower"

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let compare r r' =
  Stdlib.compare (to_int r) (to_int r')

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)


