
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

let compare r r' =
  CCOrd.int (to_int r) (to_int r')

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)

let as_individual_rank = function
  | Ranked 1 -> "1er"
  | Ranked 2 -> "2ème"
  | Ranked 3 -> "3ème"
  | Ranked n -> Printf.sprintf "%dème" n
  | Reached Preliminaries -> "Participant"
  | Reached Final -> "Finaliste"
  | Reached Semi_final -> "Demi-finaliste"
  | Reached Quarter_final -> "Quarts de finaliste"
  | Reached Eighth_final -> "Huitièmes de finaliste"

let as_rank_section = function
  | Ranked 1 -> "1er"
  | Ranked 2 -> "2ème"
  | Ranked 3 -> "3ème"
  | Ranked n -> Printf.sprintf "%dème" n
  | Reached Preliminaries -> "Prelims"
  | Reached Final -> "Finalistes"
  | Reached Semi_final -> "Demi-finalistes"
  | Reached Quarter_final -> "Quarts de finalistes"
  | Reached Eighth_final -> "Huitièmes de finalistes"


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


