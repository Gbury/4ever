
type id = int

type kind =
  | Routine
  | Strictly
  | Jack_and_Jill

type t = {
  (* descr *)
  event : Event.id;
  kind  : kind;

  (* useful info for points *)
  leaders : int;
  followers : int;
}

let kind_of_int = function
  | 0 -> Routine
  | 1 -> Strictly
  | 2 -> Jack_and_Jill
  | _ -> assert false

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS competitions (
          id INTEGER PRIMARY KEY,
          event INT,
          kind INT,
          leaders INT,
          followers INT
        )
      |})

let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, p4 int int int int,
            (fun event kind leaders followers ->
               let kind = kind_of_int kind in
               { event; kind; leaders; followers; }))
    {| SELECT event, kind, leaders, followers FROM events WHERE id=? |} id

let list st event_id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p1 int, p4 int int int int,
            (fun event kind leaders followers ->
               let kind = kind_of_int kind in
               { event; kind; leaders; followers; }))
    {| SELECT event, kind, leaders, followers FROM events WHERE event=? |} event_id


