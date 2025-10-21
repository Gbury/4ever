
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let winter_cup = I.ev
    ~log:false
    ~name:"4 Temps Winter Cup"
    ~date:(F.Date.mk ~day:25 ~month:1 ~year:2025)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:"Flocons"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "4twc_flocons")
        ~leaders:13
        ~follows:11
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4twc_novice")
        ~leaders:33
        ~follows:50
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "4twc_inter")
        ~leaders:29
        ~follows:30
    ]

let ttq = I.ev
    ~log:false
    ~name:"4Tempstastiques"
    ~date:(F.Date.mk ~day:23 ~month:3 ~year:2025)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4ttq_novice")
        ~leaders:33
        ~follows:39
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "4ttq_inter")
        ~leaders:28
        ~follows:25
      ;
    ]

let p4t = I.ev
    ~log:false
    ~name:"Printemps 4 temps"
    ~date:(F.Date.mk ~day:07 ~month:6 ~year:2025)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "p4t_novice")
        ~leaders:62
        ~follows:71
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "p4t_inter")
        ~leaders:30
        ~follows:34
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Advanced)
        ~results:(results "p4t_advanced")
        ~leaders:8
        ~follows:8
]

let spooky = I.ev
    ~log:false
    ~name:"Spooky 4 Temps"
    ~date:(F.Date.mk ~day:19 ~month:10 ~year:2025)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "spooky_novice")
        ~leaders:40
        ~follows:46
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "spooky_inter")
        ~leaders:27
        ~follows:26
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Advanced)
        ~results:(results "spooky_advanced")
        ~leaders:8
        ~follows:8
      ;
    ]

let events =
  List.to_seq [
    winter_cup;
    ttq;
    p4t;
    spooky;
  ]

