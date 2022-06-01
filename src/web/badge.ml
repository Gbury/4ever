
let gen ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () : string =
  let buf = Buffer.create 113 in
  let fmt = Format.formatter_of_buffer buf in
  let () = Ocb.Gen.mk fmt ?label ?color ?style ?icon ?icon_width ?label_color ?scale ~status () in
  Buffer.contents buf

let division ?role d =
  let label =
    match (role : Fourever.Role.t option) with
    | None -> "L/F"
    | Some Leader -> "L"
    | Some Follower -> "F"
  in
  let color : Ocb.Color.t =
    match (d : Fourever.Division.t) with
    | Novice -> Green
    | Intermediate -> Blue
  in
  let status = Fourever.Division.to_string d in
  gen ~label ~color ~status ()

