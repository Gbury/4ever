
module F = Fourever
module I = F.Import

let events =
  Seq.concat @@
  List.to_seq [
    Archive_2017.events;
    Archive_2018.events;
    Archive_2019.events;
    Archive_2020.events;
    Archive_2022.events;
    Archive_2023.events;
    Archive_2024.events;
    Archive_2025.events;
  ]

let progress_bar total =
  let open Progress.Line in
  const "importing events: " ++ count_to total  ++
  const " " ++ elapsed () ++ const " " ++
  bar ~width:(`Fixed 80) total

let () =
  let st = F.State.mk "db.sqlite" in
  let total = Seq.length events in
  Progress.with_reporter (progress_bar total) (fun progress ->
      Seq.iter (function
          | `Event ev ->
            let () = I.import st ev in
            progress 1; (* report some progress *)
            ()
          | `Hook f ->
            let () = f st in
            progress 1; (* report some progress *)
            ()
        ) events
    )

