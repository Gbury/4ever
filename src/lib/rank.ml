
type phase =
  | Final
  | Semi_final
  | Quarter_final
  | Eighth_final
  | Preliminaries

type t =
  | Ranked of int
  | Reached of phase

(* hypothesis: finals have less than ~100 paticipants,
   and we only record exact ranks for finalists. *)
let to_int = function
  | Ranked i -> assert (0 < i && i < 100); i
  | Reached Final -> 100
  | Reached Semi_final -> 101
  | Reached Quarter_final -> 102
  | Reached Eighth_final -> 103
  | Reached Preliminaries -> 104

let of_int = function
  | i when 0 < i && i < 100 -> Ranked i
  | 100 -> Reached Final
  | 101 -> Reached Semi_final
  | 102 -> Reached Quarter_final
  | 103 -> Reached Eighth_final
  | 104 -> Reached Preliminaries
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

let parse = function
  | "F" -> Reached Final
  | "S" -> Reached Semi_final
  | "Q" -> Reached Quarter_final
  | "E" -> Reached Eighth_final
  | s ->
    begin match int_of_string s with
      | n -> Ranked n
      | exception Failure _ -> assert false
    end

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int


