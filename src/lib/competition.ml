
type t = {
  (* id *)
  id : Id.t;

  (* descr *)
  event : Id.t;
  kind  : Kind.t;
  division : Division.t;

  (* useful info for points *)
  leaders : int;
  followers : int;
}

let id { id; _ } = id
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

let conv =
  Conv.mk
    Sqlite3_utils.Ty.(p6 int int int int int int)
    (fun id event kind division leaders followers ->
       let kind = Kind.of_int kind in
       let division = Division.of_int division in
       { id; event; kind; division; leaders; followers; })

let get st id =
  State.query_one_where ~p:Id.p ~conv ~st
    {| SELECT * FROM competitions WHERE id=? |} id

let get_where_event st id =
  State.query_list_where ~p:Id.p ~conv ~st
    {| SELECT * FROM competitions WHERE event=? |} id

let order_map l =
  let add_to_div map comp =
    Division.Map.update comp.division (function
        | None -> Some comp
        | Some _ -> assert false
      ) map
  in
  let add_to_kind map comp =
    Kind.Map.update comp.kind (function
        | Some m -> Some (add_to_div m comp)
        | None -> Some (add_to_div Division.Map.empty comp)
      ) map
  in
  List.fold_left add_to_kind Kind.Map.empty l

