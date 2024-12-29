
type t = {
  novice : bool;
  inter : bool;
  adv : bool;
}

let equal = Stdlib.(=)
let compare = Stdlib.compare

let mask_novice = 0b001
let mask_inter =  0b010
let mask_adv =    0b100

let empty = {
  novice = false;
  inter = false;
  adv = false;
}

let print fmt { novice; inter; adv; } =
  match novice, inter, adv  with
  | true, false, false -> Format.fprintf fmt "initié"
  | true, true, false -> Format.fprintf fmt "initié/inter"
  | false, true, false -> Format.fprintf fmt "inter"
  | false, true, true -> Format.fprintf fmt "inter/adv"
  | false, false, true -> Format.fprintf fmt "adv"
  | _ -> Format.fprintf fmt "N/A"

let is_empty { novice; inter; adv; } =
  novice = false && inter = false && adv = false

let add t div =
  match (div : Division.t) with
  | Novice ->
    if t.novice then t else { t with novice = true; }
  | Intermediate ->
    if t.inter then t else { t with inter = true; }
  | Advanced ->
    if t.adv then t else { t with adv = true; }

let remove t div =
  match (div : Division.t) with
  | Novice ->
    if t.novice then { t with novice = false; } else t
  | Intermediate ->
    if t.inter then { t with inter = false; } else t
  | Advanced ->
    if t.adv then { t with adv = false; } else t

let to_int { novice; inter; adv; } =
  let bool b = if b then 1 else 0 in
  mask_novice * (bool novice)
  + mask_inter * (bool inter)
  + mask_adv * (bool adv)

let of_int i =
  let test mask = (i land mask) <> 0 in
  let novice = test mask_novice in
  let inter = test mask_inter in
  let adv = test mask_adv in
  { novice; inter; adv; }

let p = Sqlite3_utils.Ty.([int])
let conv = Conv.mk p of_int

let max_div { novice; inter; adv; } =
  if adv
  then Division.Advanced
  else if inter
  then Division.Intermediate
  else (assert novice; Division.Novice)

