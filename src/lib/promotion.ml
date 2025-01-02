
(* ************************************************************************* *)
(* Promotion rules *)
(* ************************************************************************* *)

type update =
  | Add_access_to of Division.t
  | Remove_access_to of Division.t

let apply divs updates =
  List.fold_left (fun divs update ->
      match update with
      | Add_access_to div -> Divisions.add divs div
      | Remove_access_to div -> Divisions.remove divs div
    ) divs updates


(* ************************************************************************* *)
(* Promotion rules *)
(* ************************************************************************* *)

type points = Division.t -> int

type rule = Results.t -> points -> update list

(* Dancers that have been invited to an invitational Jack&Jill
   are upgraded to a division above that of Novice *)
let invited : rule = fun result _points ->
  match result.category with
  | Non_competitive Some Invited ->
    (* TODO: this is wrong when there are more than jus ttwo divisions *)
    [ Add_access_to Intermediate;
      Remove_access_to Novice; ]
  | _ -> []

(* Dancers that have reached the finals of a qualifying competition
   are also eligible for division upgrade *)
let qualifying_finalist : rule = fun result _points ->
  match result.category, result.rank with
  | Non_competitive Some Qualifying, (Reached Final | Ranked _ ) ->
    [ Add_access_to Intermediate;
      Remove_access_to Novice ]
  | _ -> []

(* exceptional rule for the beginning/transition:
   reaching finals in Inter gives right to the Inter division *)
let inter_finalist : rule = fun result _points ->
  match result.category, result.rank with
  | Competitive Intermediate, (Reached Final | Ranked _ ) ->
    [ Add_access_to Intermediate;
      Remove_access_to Novice ]
  | _ -> []

(* soft promotion: once a threshold of points is reached in a division,
   gives access to a higher division. *)
let soft_promote div threshold upgrade_div : rule = fun result points ->
  match result.category with
  | Competitive d when Division.equal d div && result.points > 0 ->
    if points div >= threshold then [ Add_access_to upgrade_div ] else []
  | _ -> []

(* hard/forced promotion: one a threshold of points is reached in a division,
   gives access to a higher division, *and* removes access to the current/lower
   div *)
let hard_promote div threshold upgrade_div : rule = fun result points ->
  match result.category with
  | Competitive d when Division.equal d div && result.points > 0 ->
    if points div >= threshold then
      [ Add_access_to upgrade_div; Remove_access_to div; ]
    else
      []
  | _ -> []

(* auto-promotion: earning any points in a division results in gaining
   access to that division, and losing access to lower divisions. *)
let auto_promote div lower_divs : rule = fun result _points ->
  match result.category with
  | Competitive d when Division.equal d div && result.points > 0 ->
    Add_access_to div :: List.map (fun lower_div ->
        Remove_access_to lower_div
      ) lower_divs
  | _ -> []



(* ************************************************************************* *)
(* Sets of rules and dates *)
(* ************************************************************************* *)

type rules = rule list

let rules =
  Date.Map.of_seq @@ List.to_seq [

    (* Rules for the beginning/transition period:
       i.e. until the end of 2022 *)
    Date.mk ~day:31 ~month:12 ~year:2022, [
      invited;
      inter_finalist;
      qualifying_finalist;
      auto_promote Intermediate [Novice];
      auto_promote Advanced [Intermediate; Novice];
      soft_promote Novice 6 Intermediate;
      hard_promote Novice 12 Intermediate;
      soft_promote Intermediate 24 Advanced;
      hard_promote Intermediate 36 Advanced;
    ];

    (* Rules for the foreseeable future *)
    Date.mk ~day:01 ~month:01 ~year:2100, [
      invited;
      qualifying_finalist;
      auto_promote Intermediate [Novice];
      auto_promote Advanced [Intermediate; Novice];
      soft_promote Novice 6 Intermediate;
      hard_promote Novice 12 Intermediate;
      soft_promote Intermediate 24 Advanced;
      hard_promote Intermediate 36 Advanced;
    ];

  ]

let get_rules_for date =
  snd @@ Date.Map.find_first (fun d ->
      Date.compare date d <= 0
    ) rules

let update_with_new_result ~log st (result : Results.t) =
  (* Fetch/extract some info *)
  let competition = Competition.get st result.competition in
  let event = Event.get st competition.event in
  let id = result.dancer in
  let dancer = Dancer.get st id in
  let dancer_divs =
    match result.role with
    | Leader -> dancer.as_leader
    | Follower -> dancer.as_follower
  in
  (* First participants in competition have an all-zero divs,
     and thus it need to be upgraded to at least novice (which will then
     be later upgraded if necessary). *)
  let effective_divs =
    if Divisions.is_empty dancer_divs then
      Divisions.add dancer_divs Novice
    else dancer_divs
  in
  (* Check that the competitor had access to the competition *)
  if competition.check_divs then begin
    let fail () =
      if log then begin
        Progress.interject_with @@ begin fun () ->
          Format.eprintf
            "!! ERROR: Check_divs failed for dancer %s in competition '%s'@."
            (Dancer.full_name dancer) competition.name
        end
      end
    in
    match competition.category with
    | Competitive Novice -> if not effective_divs.novice then fail ()
    | Competitive Intermediate -> if not effective_divs.inter then fail ()
    | Competitive Advanced -> if not effective_divs.adv then fail ()
    | Non_competitive _ -> ()
  end;
  (* lazy computation of cumulative points total by division *)
  let points =
    let novice = lazy (Results.all_points st id result.role Novice) in
    let inter = lazy (Results.all_points st id result.role Intermediate) in
    let adv = lazy (Results.all_points st id result.role Advanced) in
    (fun div ->
       match (div : Division.t) with
      | Novice -> Lazy.force novice
      | Intermediate -> Lazy.force inter
      | Advanced -> Lazy.force adv)
  in
  let new_divs =
    List.fold_left (fun divs (rule : rule) ->
        apply divs (rule result points)
      ) effective_divs (get_rules_for event.date)
  in
  if Divisions.equal dancer_divs new_divs then ()
  else begin
    if log then
      Progress.interject_with @@ begin fun () ->
          Format.printf "  PROMOTE : %20s %20s\t%10s\t%a -> %a@."
            dancer.first_name dancer.last_name
            (Role.to_string result.role)
            Divisions.print effective_divs
            Divisions.print new_divs
      end;
    Dancer.update_divisions st id result.role new_divs
  end


