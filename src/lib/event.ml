
type t = {
  (* id *)
  id : Id.t;
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

let conv =
  Conv.mk
    Sqlite3_utils.Ty.(p3 int text text)
    (fun id name date ->
       { id; name; date = Date.of_string date; })

let get st id =
  State.query_one_where ~p:Id.p ~conv ~st
    {| SELECT * FROM events WHERE id=? |} id

let list st =
  State.query_list ~conv ~st
    {| SELECT * FROM events |}

