
let t =
  Page.mk
    ~page:"rules"
    ~title:"Règles"
    ~body:(fun req _st ->
        match Misc.int_query req "ver" with
        | Some 0 -> Rules_html.render_0 ()
        | Some 1 -> Rules_html.render_1 ()
        | _ -> Rules_html.render_2 ()
      )

