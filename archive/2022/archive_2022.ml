
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let routine_ulm = I.ev
    ~name:"Concours Chorégraphie ENS Ulm"
    ~date:(F.Date.mk ~day:22 ~month:4 ~year:2022)
    [
      I.comp
        ~kind:Routine
        ~name:""
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "ulm_choregraphy")
        ~leaders:10
        ~follows:10
    ]

let p4t = I.ev
    ~name:"Printemps 4 Temps"
    ~date:(F.Date.mk ~day:27 ~month:5 ~year:2022)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "p4t_novice")
        ~leaders:31
        ~follows:34
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "p4t_inter")
        ~leaders:15
        ~follows:15
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Non_competitive (Some Invited))
        ~results:(results "p4t_invite")
        ~leaders:8
        ~follows:8
      ;
    ]

let events =
  List.to_seq @@
  List.map (fun ev -> `Event ev) [
    routine_ulm;
    p4t;
  ]
