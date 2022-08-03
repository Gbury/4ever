
type t = {
  (* id *)
  id : Id.t;

  (* descr *)
  event : Id.t;
  name : string;
  kind : Kind.t;

  (* *)
  category : Category.t;
  check_divs : bool;

  (* useful info for points *)
  leaders : int;
  followers : int;
}

let id { id; _ } = id
let name { name; _ } = name
let kind { kind; _ } = kind
let event { event; _ } = event
let category { category; _ } = category

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS competitions (
          id INTEGER PRIMARY KEY,
          event INT,
          name TEXT,
          kind INT,
          category INT,
          check_divs INT,
          leaders INT,
          followers INT
        )
      |})

let conv =
  Conv.mk
    Sqlite3_utils.Ty.([int; int; text; int; int; int; int; int])
    (fun id event name kind category check_divs leaders followers ->
       let kind = Kind.of_int kind in
       let category = Category.of_int category in
       let check_divs = Bool.of_int check_divs in
       { id; event; name; kind; category; check_divs; leaders; followers; })

let get st id =
  State.query_one_where ~p:Id.p ~conv ~st
    {| SELECT * FROM competitions WHERE id=? |} id

let get_where_event st id =
  State.query_list_where ~p:Id.p ~conv ~st
    {| SELECT * FROM competitions WHERE event=? |} id

let create st ~ev ~kind ~category ~check_divs ~name ~leaders ~followers =
  let open Sqlite3_utils.Ty in
  State.insert ~st ~ty:[ int; int; int; int; text; int; int ]
    {| INSERT INTO competitions (event,kind,category,check_divs,name,leaders,followers)
       VALUES (?,?,?,?,?,?,?) |}
    ev (Kind.to_int kind) (Category.to_int category) (Bool.to_int check_divs)
    name leaders followers;
  State.query_one_where ~p:[int; int; int; text] ~conv:Id.conv ~st
    {| SELECT id FROM competitions WHERE
       event=? AND kind=? AND category=? AND name=? |}
    ev (Kind.to_int kind) (Category.to_int category) name

let order_map l =
  let add_to_div map comp =
    Category.Map.update comp.category (function
        | None -> Some ([comp])
        | Some l -> Some (comp :: l)
      ) map
  in
  let add_to_kind map comp =
    Kind.Map.update comp.kind (function
        | Some m -> Some (add_to_div m comp)
        | None -> Some (add_to_div Category.Map.empty comp)
      ) map
  in
  List.fold_left add_to_kind Kind.Map.empty l
