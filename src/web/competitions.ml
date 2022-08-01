
let t =
  Page.mk
    ~page:"competitions"
    ~title:"Compétitions"
    ~body:(fun req st ->
        let id = Misc.int_param req "id" in
        Competitions_html.t st id
      )

