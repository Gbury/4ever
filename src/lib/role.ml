
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

