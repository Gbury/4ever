
type t = int

let p = Sqlite3_utils.Ty.([int])
let conv : t Conv.t = Conv.mk p (fun id -> id)

let compare (x : t) y = Stdlib.compare x y

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)
