
module F = Fourever
module I = F.Import

let results =
  match Results.read "ranks" with
  | None -> assert false
  | Some contents -> I.read_results contents

let comp : I.comp = {
  kind = assert false;
  name = "";
  leaders = 0;
  follows = 0;
  division = None;
  results;
}

let t : I.ev = {
  name = assert false;
  date = F.Date.mk ~day:0 ~month:0 ~year:0;
  comps = [ comp ];
}

