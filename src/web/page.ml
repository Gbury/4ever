
type t = {
  page : string;
  title : string;
  body : Dream.request -> Fourever.State.t -> string;
}

let mk ~page ~title ~body =
  { page; title; body; }

let render { page; title; body; } request =
  State.get request (fun st ->
      Dream.html @@
      Template.render ~title ~page ~body:(body request st)
    )

