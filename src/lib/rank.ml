
type phase =
  | Final
  | Semi_final
  | Quarter_final
  | Eighth_final
  | Preliminaries

type t =
  | Ranked of int
  | Reached of phase

let to_int = function
  | Ranked i -> assert (i > 0); i
  | Reached Preliminaries -> 0
  | Reached Final -> -1
  | Reached Semi_final -> -2
  | Reached Quarter_final -> -3
  | Reached Eighth_final -> -4

let of_int = function
  | i when i > 0 -> Ranked i
  | 0 -> Reached Preliminaries
  | -1 -> Reached Final
  | -2 -> Reached Semi_final
  | -3 -> Reached Quarter_final
  | -4 -> Reached Eighth_final
  | d -> failwith (Format.asprintf "%d is not a valid rank" d)

let to_string = function
  | Ranked 1 -> "1st"
  | Ranked 2 -> "2nd"
  | Ranked 3 -> "3rd"
  | Ranked n -> Printf.sprintf "%dth" n
  | Reached Preliminaries -> "Prelims"
  | Reached Final -> "Finals"
  | Reached Semi_final -> "Semi-finals"
  | Reached Quarter_final -> "Quarter-finals"
  | Reached Eighth_final -> "Eighth-finals"


