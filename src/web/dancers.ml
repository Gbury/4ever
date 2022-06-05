
let t =
  Page.mk
    ~page:"dancers"
    ~title:"Dancers"
    ~body:(fun req st ->
        let id = Misc.int_param req "id" in
        Dancers_html.t st id
      )

let list =
  Page.mk
    ~page:"dancers"
    ~title:"Dancer List"
    ~body:Dancers_html.list

