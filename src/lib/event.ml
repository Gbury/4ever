
type id = int

type t = {
  (* id *)
  id : id;
  (* name *)
  name : string;
  (* date *)
  date : Date.t;
}

let id { id; _ } = id
let name { name; _ } = name
let date { date; _ } = date

(* comparison sorts by date first because it's more convenient,
   even if slightly less efficient. *)
let compare e e' =
  let open CCOrd in
  Date.compare (date e) (date e')
  <?> (int, e.id, e'.id)

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS events (
          id INTEGER PRIMARY KEY,
          name TEXT,
          date TEXT
        )
      |})

let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, p3 int text text,
            (fun id name date ->
               { id; name; date = Date.of_string date; }))
    {| SELECT id, name, date FROM events WHERE id=? |} id

let list st =
  let open Sqlite3_utils in
  exec_no_params_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p3 int text text,
            (fun id name date ->
               { id; name; date = Date.of_string date; }))
    {| SELECT id, name, date FROM events |}

