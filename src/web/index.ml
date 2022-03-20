
let t =
  Page.mk
    ~page:"index"
    ~title:"Home"
    ~body:(fun _ _ -> Index_html.render ())


