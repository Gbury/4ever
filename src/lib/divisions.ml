
type t = {
  novice : bool;
  inter : bool;
}

let equal = Stdlib.(=)
let compare = Stdlib.compare

let mask_novice = 0x1
let mask_inter = 0x2

let empty = {
  novice = false;
  inter = false;
}

let is_empty { novice; inter; } =
  novice = false && inter = false

let add t div =
  match (div : Division.t) with
  | Novice ->
    if t.novice then t else { t with novice = true; }
  | Intermediate ->
    if t.inter then t else { t with inter = true; }

let remove t div =
  match (div : Division.t) with
  | Novice ->
    if t.novice then { t with novice = false; } else t
  | Intermediate ->
    if t.inter then { t with inter = false; } else t

let to_int { novice; inter; } =
  let bool b = if b then 1 else 0 in
  mask_novice * (bool novice)
  + mask_inter * (bool inter)

let of_int i =
  let test mask = (i land mask) <> 0 in
  let novice = test mask_novice in
  let inter = test mask_inter in
  { novice; inter; }


let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let max_div { novice; inter; } =
  if inter
  then Division.Intermediate
  else (assert novice; Division.Novice)



