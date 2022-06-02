
module M = Map.Make(Int)

type t = {
  id : Id.t;
  points : int;
  role : Role.t;
  dancer : Id.t;
  rank : Rank.t;
  category : Category.t;
  competition : Id.t;
}

let rank { rank; _ } = rank
let role { role; _ } = role
let dancer { dancer; _ } = dancer
let points { points; _ } = points
let category { category; _ } = category

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS results (
          id INTEGER PRIMARY KEY,
          points INT,
          role INT,
          dancer INT,
          rank INT,
          category INT,
          competition INT
        )
      |})

let conv =
  Conv.mk
    Sqlite3_utils.Ty.((p4 int int int int) @>> (p3 int int int))
    (fun id points role dancer rank category competition ->
       let rank = Rank.of_int rank in
       let role = Role.of_int role in
       let category = Category.of_int category in
       { id; points; role; dancer; rank; category; competition; })

let get st id =
  State.query_list_where ~p:Id.p ~conv ~st
    {| SELECT * FROM results WHERE id=? |} id

let get_where_dancer st dancer_id =
  State.query_list_where ~p:Id.p ~conv ~st
    {| SELECT * FROM results WHERE dancer=? |} dancer_id

let add st ~points ~role ~dancer ~rank ~category ~competition =
  let open Sqlite3_utils.Ty in
  State.insert ~st ~ty:[ int; int; int; int; int; int]
    {| INSERT INTO results (points,role,dancer,rank,category,competition)
       VALUES (?,?,?,?,?,?) |}
    points (Role.to_int role) dancer (Rank.to_int rank)
    (Category.to_int category) competition;
  State.query_one_where ~st ~conv ~p:[ int; int; int; int; int; int]
    {| SELECT * FROM results WHERE points=? AND role=? AND dancer=? AND
                                   rank=? AND category=? AND competition=? |}
    points (Role.to_int role) dancer (Rank.to_int rank)
    (Category.to_int category) competition

let order_by_event_date st l =
  let l' = List.map (fun res ->
      let competition = Competition.get st res.competition in
      let event = Event.get st competition.event in
      res, competition, event
    ) l
  in
  let cmp (_, _, e) (_, _, e') =
    CCOrd.opp Date.compare (Event.date e) (Event.date e')
  in
  List.sort cmp l'

let order_by_rank l =
  let aux map r =
    Rank.Map.update r.rank (function
        | None -> Some [r]
        | Some l -> Some (r :: l)
      ) map
  in
  List.fold_left aux Rank.Map.empty l

let iter_by_dancer l f =
  let rec aux leads follows =
    match leads, follows with
    | [], [] -> ()
    | lead :: leads, [] ->
      f (Some lead) None;
      aux leads follows
    | [], follow :: follows ->
      f None (Some follow);
      aux leads follows
    | lead :: leads, follow :: follows ->
      f (Some lead) (Some follow);
      aux leads follows
  in
  let leads, follows =
    List.partition (function r ->
      match r.role with
      | Leader -> true
      | Follower -> false
      ) l
  in
  aux leads follows

let order_map st l =
  let add_to_date map ((_, _, event) as t) =
    let date = Event.date event in
    Date.Map.update date (function
        | Some l -> Some (t :: l)
        | None -> Some ([t])
      ) map
  in
  let add_to_div map ((res, _, _) as t) =
    Category.Map.update res.category (function
        | Some m -> Some (add_to_date m t)
        | None -> Some (add_to_date Date.Map.empty t)
      ) map
  in
  let add_to_dancer map ((res, _, _) as t) =
    Id.Map.update res.dancer (function
        | Some m -> Some (add_to_div m t)
        | None -> Some (add_to_div Category.Map.empty t)
      ) map
  in
  l
  |> List.map (fun res ->
      let competition = Competition.get st res.competition in
      let event = Event.get st competition.event in
      res, competition, event)
  |> List.fold_left add_to_dancer Id.Map.empty

