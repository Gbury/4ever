
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents

let jnj_ulm : I.ev = {
  name = "Jack&Jill Ulm";
  date = F.Date.mk ~day:15 ~month:6 ~year:2018;
  comps = [
    {
      kind = Jack_and_Jill;
      name = "Vétéran";
      check_divs = false;
      category = Non_competitive (Some Invited);
      results = results "jnj_ulm_veteran";
      leaders = 0;
      follows = 0;
    };
  ];
}

let events = [
  jnj_ulm;
]

