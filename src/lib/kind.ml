
type t =
  | Routine
  | Strictly
  | Jack_and_Jill

let to_int = function
  | Routine -> 2
  | Strictly -> 1
  | Jack_and_Jill -> 0

let of_int = function
  | 2 -> Routine
  | 1 -> Strictly
  | 0 -> Jack_and_Jill
  | _ -> assert false

let to_string = function
  | Routine -> "chorégraphie"
  | Strictly -> "strictly"
  | Jack_and_Jill -> "jack&jill"

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let compare k k' =
  Stdlib.compare (to_int k) (to_int k')

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)


