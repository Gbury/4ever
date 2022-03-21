
type t = {
  id : Id.t;
  points : int;
  role : Role.t;
  dancer : Id.t;
  rank : Rank.t;
  division : Division.t;
  competition : Id.t;
}

let rank { rank; _ } = rank
let points { points; _ } = points

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS results (
          id INTEGER PRIMARY KEY,
          points INT,
          role INT,
          dancer INT,
          rank INT,
          division INT,
          competition INT
        )
      |})

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

let order_map st l =
  let add_to_role map res =
    Role.Map.update res.role (function
        | Some l -> Some (res :: l)
        | None -> Some ([res])
      ) map
  in
  let add_to_div map res =
    Division.Map.update res.division (function
        | Some m -> Some (add_to_role m res)
        | None -> Some (add_to_role Role.Map.empty res)
      ) map
  in
  let add_to_dancer map res =
    Id.Map.update res.dancer (function
        | Some m -> Some (add_to_div m res)
        | None -> Some (add_to_div Division.Map.empty res)
      ) map
  in
  List.fold_left add_to_dancer Id.Map.empty l
  |> Id.Map.map (Division.Map.map (Role.Map.map (order_by_event_date st)))

let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, (p4 int int int int) @>> (p3 int int int),
            (fun id points role dancer rank division competition ->
               let rank = Rank.of_int rank in
               let role = Role.of_int role in
               let division = Division.of_int division in
               { id; points; role; dancer; rank; division; competition; }))
    {| SELECT id, points, role, dancer, rank, division, competition
       FROM results WHERE id=? |} id

let get_by_dancer st dancer_id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.to_list
    ~ty:Ty.(p1 int, (p4 int int int int) @>> (p3 int int int),
            (fun id points role dancer rank division competition ->
               let rank = Rank.of_int rank in
               let role = Role.of_int role in
               let division = Division.of_int division in
               { id; points; role; dancer; rank; division; competition; }))
    {| SELECT id, points, role, dancer, rank, division, competition
       FROM results WHERE dancer=? |} dancer_id

