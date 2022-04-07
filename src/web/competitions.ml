
let t =
  Page.mk
    ~page:"competitions"
    ~title:"Competition results"
    ~body:(fun req st ->
        let id = int_of_string @@ Dream.param req "id" in
        Competitions_html.t st id
      )

