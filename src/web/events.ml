
let t =
  Page.mk
    ~page:"events"
    ~title:"Évènement"
    ~body:(fun req st ->
        let id = Misc.int_param req "id" in
        Events_html.t st id
      )

let list =
  Page.mk
    ~page:"events"
    ~title:"Évènements"
    ~body:(fun _ st ->
        let l = Fourever.Event.list st in
        let l = List.sort (CCOrd.opp Fourever.Event.compare) l in
        Events_html.list l
      )
