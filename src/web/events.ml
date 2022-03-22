
let t =
  Page.mk
    ~page:"events"
    ~title:"Event Description"
    ~body:(fun req st ->
        let id = int_of_string @@ Dream.param req "id" in
        Events_html.t st id
      )

let list =
  Page.mk
    ~page:"events"
    ~title:"Event list"
    ~body:(fun _ st ->
        let l = Fourever.Event.list st in
        let l = List.sort (CCOrd.opp Fourever.Event.compare) l in
        Events_html.list l
      )
