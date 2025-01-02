
let t =
  Page.mk
    ~page:"rules"
    ~title:"Règles"
    ~body:(fun req _st ->
        match Misc.int_query req "ver" with
        | Some 0 -> Rules_html.render_0 ()
        | _ -> Rules_html.render_1 ()
      )

