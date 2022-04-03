
type result = {
  rank : Rank.t;
  role : Role.t;
  dancer : Id.t;
  points : int;
}

type comp = {
  kind : Kind.t;
  name : string;
  leaders : int;
  follows : int;
  results : result list;
}

type ev = {
  date : Date.t;
  name : string;
  comps : comp list;
}

type t = ev



