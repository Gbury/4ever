
exception Expected_an_int of string

let int_param req id =
  let s = Dream.param req id in
  match int_of_string s with
  | i -> i
  | exception Failure _ ->
    raise (Expected_an_int s)


