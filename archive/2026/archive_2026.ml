
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let winter_cup = I.ev
    ~log:false
    ~name:"4 Temps Winter Cup"
    ~date:(F.Date.mk ~day:31 ~month:1 ~year:2026)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:"Flocons"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "4twc_flocons")
        ~leaders:16
        ~follows:9
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4twc_novice")
        ~leaders:39
        ~follows:50
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "4twc_inter")
        ~leaders:27
        ~follows:22
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Advanced)
        ~results:(results "4twc_adv")
        ~leaders:9
        ~follows:8
    ]

let ttq = I.ev
    ~log:false
    ~name:"4Tempstastiques"
    ~date:(F.Date.mk ~day:14 ~month:3 ~year:2026)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4ttq_novice")
        ~leaders:20
        ~follows:24
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "4ttq_inter")
        ~leaders:11
        ~follows:6
      ;
    ]

let p4t = I.ev
    ~log:true
    ~name:"Printemps 4 temps"
    ~date:(F.Date.mk ~day:22 ~month:5 ~year:2026)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "p4t_novice")
        ~leaders:61
        ~follows:75
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "p4t_inter")
        ~leaders:31
        ~follows:33
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Advanced)
        ~results:(results "p4t_advanced")
        ~leaders:9
        ~follows:11
      ;
  (*
      I.comp
        ~kind:All_In
        ~name:"Leaders Inter/Adv - Followers Initiés"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "p4t_allin_leaders")
        ~leaders:33
        ~follows:50
      ;
      I.comp
        ~kind:All_In
        ~name:"Leaders Initiés - Followers Inter/Adv"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "p4t_allin_follows")
        ~leaders:41
        ~follows:28
      ;
  *)
]
let events =
  List.to_seq [
    `Event winter_cup;
    `Event ttq;
    `Event p4t;
  ]

