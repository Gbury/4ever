
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let winter_cup = I.ev
    ~log:true
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


let events =
  List.to_seq [
    `Event winter_cup;
  ]

