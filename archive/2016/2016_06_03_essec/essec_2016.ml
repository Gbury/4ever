
module F = Fourever
module I = F.Import

let results =
  match Results.read "ranks" with
  | None -> assert false
  | Some contents -> I.read_results contents

let comp : I.comp = {
  kind = Strictly;
  name = "";
  leaders = 0;
  follows = 0;
  division = None;
  results;
}

let t : I.ev = {
  name = "Concours Inter-Ecoles ESSEC";
  date = F.Date.mk ~day:3 ~month:6 ~year:2016;
  comps = [ comp ];
}

