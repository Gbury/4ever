
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents


let p4t : I.ev = {
  name = "Printemps 4 Temps";
  date = F.Date.mk ~day:27 ~month:5 ~year:2022;
  comps = [
    {
      kind = Jack_and_Jill;
      name = "";
      category = Competitive Novice;
      results = results "p4t_novice";
      leaders = 31;
      follows = 34;
    };
    {
      kind = Jack_and_Jill;
      name = "";
      category = Competitive Intermediate;
      results = results "p4t_inter";
      leaders = 15;
      follows = 15;
    };
    {
      kind = Jack_and_Jill;
      name = "";
      category = Non_competitive (Some Invited);
      results = results "p4t_invite";
      leaders = 8;
      follows = 8;
    };
  ];
}

let events = [
  p4t;
]
