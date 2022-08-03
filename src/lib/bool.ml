
type t = bool

let of_int = function
  | 0 -> false
  | 1 -> true
  | _ -> assert false

let to_int = function
  | true -> 1
  | false -> 0

let conv =
  Conv.mk Sqlite3_utils.Ty.([int]) of_int

