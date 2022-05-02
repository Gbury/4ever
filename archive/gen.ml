
module F = Fourever
module I = F.Import

let events = [
  Tournoi_2016.t;
  Essec_2016.t;
  Ulm_2016.t;
]

let progress_bar total =
  let open Progress.Line in
  const "importing events: " ++ count_to total  ++
  const " " ++ elapsed () ++ const " " ++
  bar ~width:(`Fixed 80) total

let () =
  let st = F.State.mk "db.sqlite" in
  let total = List.length events in
  Progress.with_reporter (progress_bar total) (fun progress ->
      List.iter (fun ev ->
          let () = I.import st ev in
          progress 1; (* report some progress *)
          ()
        ) events
    )

