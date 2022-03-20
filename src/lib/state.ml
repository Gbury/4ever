
type t = Sqlite3.db

let initializers = ref []

let add_init f =
  initializers := f :: !initializers

let mk path =
  let st = Sqlite3.db_open path in
  List.iter (fun f -> f st) !initializers;
  st


