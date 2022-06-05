
(* ************************************************************************* *)
(* Promotion rules *)
(* ************************************************************************* *)

type rule = State.t -> Id.t -> Results.t -> bool

let apply (rules : rule list) st id result =
  List.exists (fun r -> r st id result) rules

(* Dancers that have been invited to an invitational Jack&Jill
   are upgraded to a division above that of Novice *)
let invited : rule = fun _st _id result ->
  match result.category with
  | Non_competitive Some Invited -> true
  | _ -> false

(* Dancers that have reached the finals of a qualifying competition
   are also eligible for division upgrade *)
let qualifying_finalist : rule = fun _st _id result ->
  match result.category, result.rank with
  | Non_competitive Some Qualifying, Reached Final -> true
  | _ -> false

let points div threshold : rule = fun st dancer_id result ->
  match Results.category result with
  | Competitive d when Division.equal div d ->
    if Results.points result >= threshold then true
    else Results.all_points st dancer_id div >= threshold
  | _ -> false


(* ************************************************************************* *)
(* Sets of rules and dates *)
(* ************************************************************************* *)

type rules = {
  promote_to_inter : rule list;
}

let rules =
  Date.Map.of_seq @@ List.to_seq [

    (* Rules for the foreseeable future *)
    Date.mk ~day:01 ~month:01 ~year:2100,
    { promote_to_inter = [
          invited;
          qualifying_finalist;
          points Intermediate 1;
          points Novice 6;
        ];
    };

  ]

let get_rules_for date =
  snd @@ Date.Map.find_last (fun d ->
      Date.compare date d <= 0
    ) rules

let upgrade_aux st id div date result =
  match (div : Division.t) with

  (* Promotion rules for Novice dancers *)
  | Novice ->
    let { promote_to_inter; } = get_rules_for date in
    if apply promote_to_inter st id result then begin
      Dancer.update_division st id result.role Intermediate
    end;
    ()

  (* There are not yet any division above intermediate,
     and intermediate dancers cannot go down to Novice,
     so if a dancer is already intermediate, there is no
     promotion to do. *)
  | Intermediate -> ()

let update_with_new_result st (result : Results.t) =
  let id = result.dancer in
  let dancer = Dancer.get st id in
  let dancer_div =
    match result.role with
    | Leader -> dancer.as_leader
    | Follower -> dancer.as_follower
  in
  let competition = Competition.get st result.competition in
  let event = Event.get st competition.event in
  upgrade_aux st id dancer_div event.date result



