
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let cc_ulm = I.ev
    ~name:"Concours Chorégraphie ENS Ulm"
    ~date:(F.Date.mk ~day:16 ~month:6 ~year:2018)
    [ I.comp
        ~kind:Routine
        ~name:""
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "cc_ulm")
        ~leaders:0
        ~follows:0
    ]

let jnj_ulm = I.ev
    ~name:"Jack&Jill Ulm"
    ~date:(F.Date.mk ~day:15 ~month:6 ~year:2018)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:"Classique"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "jnj_ulm_classic")
        ~leaders:0
        ~follows:0
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:"Vétéran"
        ~check_divs:false
        ~category:(Non_competitive (Some Invited))
        ~results:(results "jnj_ulm_veteran")
        ~leaders:0
        ~follows:0
      ;
    ]

let events =
  List.to_seq @@
  List.map (fun ev -> `Event ev) [
    cc_ulm;
    jnj_ulm;
  ]

