
type t = int

let compare (x : t) y = Stdlib.compare x y

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)
