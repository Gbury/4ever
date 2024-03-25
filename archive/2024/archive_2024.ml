
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
    ~log:true
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

let events =
  List.to_seq [
    winter_cup;
  ]

