
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let cc_ulm = I.ev
    ~name:"Concours Chorégraphie ENS Ulm"
    ~date:(F.Date.mk ~day:12 ~month:3 ~year:2020)
    [ I.comp
        ~kind:Routine
        ~name:""
        ~check_divs:false
        ~category:(Non_competitive None)
        ~results:(results "cc_ulm")
        ~leaders:0
        ~follows:0
    ]

let events =
  List.to_seq @@
  List.map (fun ev -> `Event ev) [
    cc_ulm;
  ]

