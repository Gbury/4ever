
let t =
  Page.mk
    ~page:"dancers"
    ~title:"Dancers"
    ~body:(fun req st ->
        let id = int_of_string @@ Dream.param req "id" in
        Dancers_html.t st id
      )

let list =
  Page.mk
    ~page:"dancers"
    ~title:"Dancer List"
    ~body:(fun _req st -> Dancers_html.list st)

