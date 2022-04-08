
let t =
  Page.mk
    ~page:"about"
    ~title:"About SCR4T"
    ~body:(fun _res _st ->
        About_html.render ()
      )

