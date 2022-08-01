
let t =
  Page.mk
    ~page:"index"
    ~title:"SCR4T"
    ~body:(fun _ _ -> Index_html.render ())


