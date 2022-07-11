
let t =
  Page.mk
    ~page:"rules"
    ~title:"SCR4T Rules"
    ~body:(fun _res _st ->
        Rules_html.render ()
      )

