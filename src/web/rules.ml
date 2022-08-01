
let t =
  Page.mk
    ~page:"rules"
    ~title:"Règles"
    ~body:(fun _res _st ->
        Rules_html.render ()
      )

