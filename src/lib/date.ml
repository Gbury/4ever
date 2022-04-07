
type t = {
  day : int;
  month : int;
  year : int;
}

let compare d d' =
  let open CCOrd in
  int d.year d'.year
  <?> (int, d.month, d'.year)
  <?> (int, d.day, d'.day)

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)

let day { day; _ } = day
let month { month; _ } = month
let year { year; _ } = year

let mk ~day ~month ~year =
  { day; month; year; }

let to_string { day; month; year; } =
  Format.asprintf "%04d-%02d-%02d" year month day

let of_string s =
  try
    let year = int_of_string (String.sub s 0 4) in
    let month = int_of_string (String.sub s 5 2) in
    let day = int_of_string (String.sub s 8 2) in
    mk ~day ~month ~year
  with Invalid_argument _ ->
    failwith (Format.asprintf "%s is not a correct date" s)

let p = Sqlite3_utils.Ty.([text])
let conv = Conv.mk p of_string

let month_name = function
  | 1 -> "January"
  | 2 -> "February"
  | 3 -> "March"
  | 4 -> "April"
  | 5 -> "May"
  | 6 -> "June"
  | 7 -> "July"
  | 8 -> "August"
  | 9 -> "September"
  | 10 -> "October"
  | 11 -> "November"
  | 12 -> "December"
  | i -> failwith (Format.asprintf "%d is not a valid month" i)

