
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
      ;
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

let funky = I.ev
    ~log:false
    ~name:"Paris Funky Cup"
    ~date:(F.Date.mk ~day:8 ~month:11 ~year:2025)
    [
      I.comp
        ~kind:Strictly
        ~name:"Initié"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "funky_strictly_novice")
        ~leaders:22
        ~follows:22
      ;
      I.comp
        ~kind:Strictly
        ~name:"Inter"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "funky_strictly_inter")
        ~leaders:19
        ~follows:19
      ;
      I.comp
        ~kind:Strictly
        ~name:"Avancé"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "funky_strictly_adv")
        ~leaders:7
        ~follows:7
      ;
      I.comp
        ~kind:All_In
        ~name:"Leaders Inter/Adv - Followers Initiés"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "p4t_allin_leaders")
        ~leaders:19
        ~follows:23
      ;
      I.comp
        ~kind:All_In
        ~name:"Leaders Initiés - Followers Inter/Adv"
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "p4t_allin_follows")
        ~leaders:19
        ~follows:15
      ;
      (* Steal and double trouble omitted for now,
         as there is no support for 3 people with the same rank (at least for now).
         The results are still archived in the corresponding files in `results`,
         just currently not imported in the database for the website. *)
    ]

let plage_cup = I.ev
    ~log:false
    ~name:"Rock 4 Temps Paris Plage Cup"
    ~date:(F.Date.mk ~day:6 ~month:12 ~year:2025)
    [
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:false
        ~category:(Competitive Novice)
        ~results:(results "plage_novice")
        ~leaders:27
        ~follows:25
      ;
      I.comp
        ~kind:Jack_and_Jill
        ~name:""
        ~check_divs:true
        ~category:(Competitive Intermediate)
        ~results:(results "plage_inter")
        ~leaders:20
        ~follows:16
      ;
    ]

let events =
  List.to_seq [
    `Event winter_cup;
    `Event ttq;
    `Event p4t;
    `Hook (F.Promotion.reform_1 ~log:false);
    `Event spooky;
    `Event funky;
    `Event plage_cup;
  ]

