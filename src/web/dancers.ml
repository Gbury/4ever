
let t =
  Page.mk
    ~page:"dancers"
    ~title:"Compétiteur"
    ~body:(fun req st ->
        let id = Misc.int_param req "id" in
        Dancers_html.t st id
      )

let list =
  Page.mk
    ~page:"dancers"
    ~title:"Compétiteurs"
    ~body:Dancers_html.list

