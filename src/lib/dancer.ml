
type t = {
  id : Id.t;
  birthday : Date.t;
  last_name : string;
  first_name : string;
  as_leader : Division.t;
  as_follower : Division.t;
}

let id { id; _ } = id
let birthday { birthday; _ } = birthday
let first_name { first_name; _ } = first_name
let last_name { last_name; _ } = last_name
let as_leader { as_leader; _ } = as_leader
let as_follower { as_follower; _ } = as_follower

let division d =
  Division.max (as_leader d) (as_follower d)

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

let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, p6 int text text text int int,
            (fun id first_name last_name birthday as_leader as_follower ->
               { id; first_name; last_name;
                 birthday = Date.of_string birthday;
                 as_leader = Division.of_int as_leader;
                 as_follower = Division.of_int as_follower; }))
    {| SELECT id, first, last, birthday, as_leader, as_follower FROM dancers WHERE id=? |} id

let list st =
  let open Sqlite3_utils in
  exec_no_params_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p6 int text text text int int,
            (fun id first_name last_name birthday as_leader as_follower ->
               { id; first_name; last_name;
                 birthday = Date.of_string birthday;
                 as_leader = Division.of_int as_leader;
                 as_follower = Division.of_int as_follower; }))
    {| SELECT id, first, last, birthday, as_leader, as_follower
       FROM dancers ORDER BY last ASC, first ASC |}



