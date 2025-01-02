
let gen ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () : string =
  let buf = Buffer.create 113 in
  let fmt = Format.formatter_of_buffer buf in
  let () = Ocb.Gen.mk fmt ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () in
  Buffer.contents buf

let divisions ~role divs =
  if Fourever.Divisions.is_empty divs then ""
  else begin
    let label =
      match (role : Fourever.Role.t) with
      | Leader -> "L"
      | Follower -> "F"
    in
    let color : Ocb.Color.t =
      match (divs : Fourever.Divisions.t) with
      | { novice = true; inter = false; adv = false; } -> Green
      | { novice = true; inter = true; adv = false; } -> Cyan
      | { novice = false; inter = true; adv = false } -> Blue
      | { novice = false; inter = true; adv = true; } -> Purple
      | { novice = false; inter = false; adv = true; } -> Red
      | _ -> Grey
    in
    let status =
      match (divs : Fourever.Divisions.t) with
      | { novice = true; inter = false; adv = false; } ->
        Format.asprintf "%s"
          (Fourever.Division.to_string Novice)
      | { novice = true; inter = true; adv = false; } ->
        Format.asprintf "%s/%s"
          (Fourever.Division.to_string Novice)
          (Fourever.Division.to_string Intermediate)
      | { novice = false; inter = true; adv = false; } ->
        Format.asprintf "%s"
          (Fourever.Division.to_string Intermediate)
      | { novice = false; inter = true; adv = true; } ->
        Format.asprintf "%s/%s"
          (Fourever.Division.to_string Intermediate)
          (Fourever.Division.to_string Advanced)
      | { novice = false; inter = false; adv = true; } ->
        Format.asprintf "%s"
          (Fourever.Division.to_string Advanced)
      | _ -> "Error"
    in
    gen ~label ~color ~status ()
  end

