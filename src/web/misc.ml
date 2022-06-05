
exception Expected_an_int of string

let conv_int s =
  try int_of_string s
  with Failure _ -> raise (Expected_an_int s)

let int_param req id =
  conv_int (Dream.param req id)

let int_query req id =
  CCOption.map conv_int (Dream.query req id)


