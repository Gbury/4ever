
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let winter_cup = I.ev
    ~log:false
    ~name:"4 Temps Winter Cup"
    ~date:(F.Date.mk ~day:20 ~month:1 ~year:2024)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4twc_novice")
        ~leaders:35
        ~follows:38
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "4twc_inter")
        ~leaders:10
        ~follows:14
    ]

let temptastiques = I.ev
    ~log:false
    ~name:"4 Temptastiques"
    ~date:(F.Date.mk ~day:24 ~month:3 ~year:2024)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "4ttq_novice")
        ~leaders:31
        ~follows:29
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "4ttq_inter")
        ~leaders:6
        ~follows:12
    ]

let p4t = I.ev
    ~log:false
    ~name:"Printemps 4 temps"
    ~date:(F.Date.mk ~day:18 ~month:5 ~year:2024)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "p4t_novice")
        ~leaders:66
        ~follows:68
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Intermediate)
        ~results:(results "p4t_inter")
        ~leaders:19
        ~follows:21
    ]

let spooky = I.ev
    ~log:true
    ~name:"Spooky Cup"
    ~date:(F.Date.mk ~day:19 ~month:10 ~year:2024)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "spooky_novice")
        ~leaders:32
        ~follows:34
    ]

let events =
  List.to_seq [
    winter_cup;
    temptastiques;
    p4t;
    spooky;
  ]

