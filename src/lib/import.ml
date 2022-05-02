
type dancer = {
  first_name : string;
  last_name : string;
  birthdate : Date.t option;
}

type result = {
  points : int;
  rank : Rank.t;
  role : Role.t;
  dancer : dancer;
}

type comp = {
  kind : Kind.t;
  name : string;
  leaders : int;
  follows : int;
  division : Division.t;
  results : result list;
}

type ev = {
  date : Date.t;
  name : string;
  comps : comp list;
}

type t = ev

let parse_result ~rank ~role ~last_name ~first_name ?birthdate ?(points="0") () =
  let rank = Rank.parse rank in
  let role = Role.parse role in
  let dancer = { first_name; last_name; birthdate; } in
  let points = int_of_string points in
  let res = { rank; role; dancer; points; } in
  res

let read_results contents =
  let l = String.split_on_char '\n' contents in
  List.fold_left (fun acc line ->
      let line = String.trim line in
      if String.length line <= 0 || line.[0] = '#'
      then acc
      else match line with
      | "" -> assert false (* should have been caught by the condition above *)
      | _ ->
        let r =
          match String.split_on_char '\t' line with
          | rank :: role :: last_name :: first_name :: [] ->
            parse_result ~rank ~role ~last_name ~first_name ()
          | rank :: role :: last_name :: first_name :: points :: [] ->
            parse_result ~rank ~role ~last_name ~first_name ~points ()
          | _ ->
            failwith (Format.asprintf  "not a valid result: '%s'" line)
        in
        r :: acc
    ) [] l

let import_result st comp_id comp_div result : unit =
  let dancer_id =
    let first_name = result.dancer.first_name in
    let last_name = result.dancer.last_name in
    let birthdate = None in
    match Dancer.find_id st ~first_name ~last_name ~birthdate with
    | Some id -> id
    | None ->
      Dancer.create st ~first_name ~last_name ~birthdate
  in
  Results.add st
    ~points:result.points ~role:result.role
    ~dancer:dancer_id ~rank:result.rank
    ~division:comp_div ~competition:comp_id;
  ()

let import_comp st event_id comp =
  let comp_id = Competition.create st
      ~ev:event_id ~kind:comp.kind ~name:comp.name
      ~division:comp.division ~leaders:comp.leaders ~followers:comp.follows
  in
  List.iter (import_result st comp_id comp.division) comp.results

let import_event st ev =
  let event_id = Event.create st ev.name ev.date in
  List.iter (import_comp st event_id) ev.comps

let import st ev =
  State.atomically st (fun st -> import_event st ev)


