
type t = {
  (* descr *)
  event : Id.t;
  kind  : Kind.t;
  division : Division.t;

  (* useful info for points *)
  leaders : int;
  followers : int;
}

let kind { kind; _ } = kind
let event { event; _ } = event
let division { division; _ } = division

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS competitions (
          id INTEGER PRIMARY KEY,
          event INT,
          kind INT,
          division INT,
          leaders INT,
          followers INT
        )
      |})

let order_map l =
  let add_to_div map comp =
    Division.Map.update comp.division (function
        | None -> Some comp
        | Some _ -> failwith "duplicate competition !"
      ) map
  in
  let add_to_kind map comp =
    Kind.Map.update comp.kind (function
        | Some m -> Some (add_to_div m comp)
        | None -> Some (add_to_div Division.Map.empty comp)
      ) map
  in
  List.fold_left add_to_kind Kind.Map.empty l


let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, p5 int int int int int,
            (fun event kind division leaders followers ->
               let kind = Kind.of_int kind in
               let division = Division.of_int division in
               { event; kind; division; leaders; followers; }))
    {| SELECT event, kind, division, leaders, followers
       FROM competitions WHERE id=? |} id

let get_by_event st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p1 int, p5 int int int int int,
            (fun event kind division leaders followers ->
               let kind = Kind.of_int kind in
               let division = Division.of_int division in
               { event; kind; division; leaders; followers; }))
    {| SELECT event, kind, division, leaders, followers
       FROM competitions WHERE event=? |} id

let list st event_id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p1 int, p5 int int int int int,
            (fun event kind division leaders followers ->
               let kind = Kind.of_int kind in
               let division = Division.of_int division in
               { event; kind; division; leaders; followers; }))
    {| SELECT event, kind, division, leaders, followers
       FROM competitions WHERE event=? |} event_id


