
module F = Fourever
module I = F.Import

let results name =
  match Results.read name with
  | None -> assert false
  | Some contents -> I.read_results contents


let p4t : I.ev = {
  name = "Printemps 4 Temps";
  date = F.Date.mk ~day:26 ~month:5 ~year:2019;
  comps = [
    {
      kind = Jack_and_Jill;
      name = "Débutants";
      check_divs = false;
      category = Non_competitive None;
      results = results "p4t_debutants";
      leaders = 0;
      follows = 0;
    };
    {
      kind = Jack_and_Jill;
      name = "Confirmés";
      check_divs = false;
      category = Non_competitive (Some Qualifying);
      results = results "p4t_confirme";
      leaders = 0;
      follows = 0;
    };
    {
      kind = Jack_and_Jill;
      name = {|Invité "Old School"|};
      check_divs = false;
      category = Non_competitive (Some Invited);
      results = results "p4t_invite_old_school";
      leaders = 0;
      follows = 0;
    };
    {
      kind = Jack_and_Jill;
      name = {|Invité "Moderne"|};
      check_divs = false;
      category = Non_competitive (Some Invited);
      results = results "p4t_invite_moderne";
      leaders = 0;
      follows = 0;
    };
  ];
}

let events = [
  p4t;
]
