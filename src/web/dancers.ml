
let t =
  Page.mk
    ~page:"dancers"
    ~title:"Dancers"
    ~body:(fun req st ->
        let id = int_of_string @@ Dream.param req "id" in
        let results =
          Fourever.Results.get_by_dancer st id
          |> Fourever.Results.order_map st
          |> Fourever.Id.Map.find id
        in
        let dancer = Fourever.Dancer.get st id in
        Dancers_html.t dancer results
      )

let list =
  Page.mk
    ~page:"dancers"
    ~title:"Dancer List"
    ~body:(fun _req st ->
        let l = Fourever.Dancer.list st in
        Dancers_html.list l
      )
