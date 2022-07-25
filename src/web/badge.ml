
let gen ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () : string =
  let buf = Buffer.create 113 in
  let fmt = Format.formatter_of_buffer buf in
  let () = Ocb.Gen.mk fmt ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () in
  Buffer.contents buf

let divisions ?role divs =
  let label =
    match (role : Fourever.Role.t option) with
    | None -> "L/F"
    | Some Leader -> "L"
    | Some Follower -> "F"
  in
  let color : Ocb.Color.t =
    match (divs : Fourever.Divisions.t) with
    | { novice = false; inter = false; } -> Red
    | { novice = true; inter = false; } -> Green
    | { novice = true; inter = true; } -> Cyan
    | { novice = false; inter = true; } -> Blue
  in
  let status =
    match (divs : Fourever.Divisions.t) with
    | { novice = false; inter = false; } -> "Error"
    | { novice = true; inter = false; } ->
      Format.asprintf "%s"
        (Fourever.Division.to_string Novice)
    | { novice = true; inter = true; } ->
      Format.asprintf "%s/%s"
        (Fourever.Division.to_string Novice)
        (Fourever.Division.to_string Intermediate)
    | { novice = false; inter = true; } ->
      Format.asprintf "%s"
        (Fourever.Division.to_string Intermediate)
  in
  gen ~label ~color ~status ()

