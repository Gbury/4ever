
type t = {
  id : Id.t;
  birthday : Date.t option;
  last_name : string;
  first_name : string;
  as_leader : Divisions.t;
  as_follower : Divisions.t;
}

let id { id; _ } = id
let birthday { birthday; _ } = birthday
let as_leader { as_leader; _ } = as_leader
let as_follower { as_follower; _ } = as_follower

let division d =
  Division.max
    (Divisions.max_div (as_leader d))
    (Divisions.max_div (as_follower d))

let first_name { first_name; _ } = first_name
let last_name { last_name; _ } = last_name
let full_name d =
  Format.asprintf "%s %s" (last_name d) (first_name d)

let compare d d' =
  let open CCOrd in
  string (last_name d) (last_name d')
  <?> (string, first_name d, first_name d')
  <?> (int, id d, id d')

module Aux = struct
  type nonrec t = t
  let compare = compare
end

module Set = Set.Make(Aux)
module Map = Map.Make(Aux)

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS dancers (
        id INTEGER PRIMARY KEY,
        first TEXT,
        last TEXT,
        birthday TEXT,
        as_leader INT,
        as_follower INT
        )
      |})

let conv =
  Conv.mk
    Sqlite3_utils.Ty.(p6 int text text (nullable text) int int)
    (fun id first_name last_name birthday as_leader as_follower ->
       { id; first_name; last_name;
         birthday = Option.map Date.of_string birthday;
         as_leader = Divisions.of_int as_leader;
         as_follower = Divisions.of_int as_follower; })

let get st id =
  State.query_one_where ~p:Id.p ~conv ~st
    {| SELECT * FROM dancers WHERE id=? |} id

let query_order_by ?order_by fmt () =
  let l = match order_by with
    | None -> [`Last, `Asc; `First, `Asc]
    | Some (`First, `Asc) -> [`First, `Asc; `Last, `Asc]
    | Some (`First, `Desc) -> [`First, `Desc; `Last, `Asc]
    | Some (`Last, `Asc) -> [`Last, `Asc; `First, `Asc]
    | Some (`Last, `Desc) -> [`Last, `Desc; `First, `Asc]
  in
  let pp_sep fmt () = Format.fprintf fmt ", " in
  let pp fmt (col, dir) =
    let col =
      match col with
      | `First -> "first"
      | `Last -> "last"
    in
    let dir =
      match dir with
      | `Asc -> "ASC"
      | `Desc -> "DESC"
    in
    Format.fprintf fmt "%s %s" col dir
  in
  Format.pp_print_list ~pp_sep pp fmt l

let list ?order_by st =
  State.query_list ~conv ~st
    (Format.asprintf
       {| SELECT * FROM dancers ORDER BY %a |}
       (query_order_by ?order_by) ())

let sanitize s =
  let correct =
    String.for_all (function
      | 'a' .. 'z' | 'A' .. 'Z' -> true
      | _ -> false
      ) s
  in
  if correct then s else ""

let search st ?order_by ?(name="") () =
  match sanitize name with
  | "" -> list st
  | name ->
    let open Sqlite3_utils.Ty in
    State.query_list_where ~conv ~st ~p:[] (
      Format.asprintf {|
        SELECT * FROM dancers
        WHERE first LIKE '%%%s%%' OR last LIKE '%%%s%%'
        ORDER BY %a |} name name (query_order_by ?order_by) ()
    )

let find_id st ~first_name ~last_name ~birthdate =
  let l =
    match birthdate with
    | None ->
      State.query_list_where ~st
        ~p:(Sqlite3_utils.Ty.[text; text]) ~conv:Id.conv
        {| SELECT id FROM dancers WHERE first=? AND last=? |} first_name last_name
    | Some _ ->
      State.query_list_where ~st
        ~p:(Sqlite3_utils.Ty.[text; text; (nullable text)]) ~conv:Id.conv
        {| SELECT id FROM dancers WHERE first=? AND last=? AND birthdate=? |}
        first_name last_name (Option.map Date.to_string birthdate)
  in
  match l with
  | [ id ] -> Some id
  | [] -> None
  | _ :: _ :: _ -> assert false

let create st ~first_name ~last_name ~birthdate =
  let divs = Divisions.(to_int empty) in
  let open Sqlite3_utils.Ty in
  State.insert ~st ~ty:[text; text; nullable text; int; int]
    {| INSERT INTO dancers (first,last,birthday,as_leader,as_follower)
       VALUES (?,?,?,?,?) |}
    first_name last_name (Option.map Date.to_string birthdate) divs divs;
  match find_id st ~first_name ~last_name ~birthdate with
  | Some id -> id
  | None -> assert false

let update_divisions st dancer_id role divs =
  let open Sqlite3_utils.Ty in
  match (role : Role.t) with
  | Leader ->
    State.insert ~st ~ty:[int; int]
      {| UPDATE dancers SET as_leader = ? WHERE id = ? |}
      (Divisions.to_int divs) dancer_id
  | Follower ->
    State.insert ~st ~ty:[int; int]
      {| UPDATE dancers SET as_follower = ? WHERE id = ? |}
      (Divisions.to_int divs) dancer_id


