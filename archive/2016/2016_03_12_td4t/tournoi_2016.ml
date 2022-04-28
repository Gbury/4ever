
module F = Fourever
module I = F.Import

let results =
  match Results.read "ranks" with
  | None -> assert false
  | Some contents -> I.read_results contents

let comp : I.comp = {
  kind = Jack_and_Jill;
  name = "";
  leaders = 0;
  follows = 0;
  division = None;
  results;
}

let t : I.ev = {
  name = "Tournoi de Danse 4 Temps";
  date = F.Date.mk ~day:12 ~month:3 ~year:2016;
  comps = [ comp ];
}

