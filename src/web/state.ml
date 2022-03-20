
let field =
  Dream.new_field ()
    ~name:"internal db"
    ~show_value:(fun _ -> "fourever state")

let init ~path =
  let state = ref None in
  fun inner_handler request ->
    match !state with
    | Some st ->
      Dream.set_field request field st;
      inner_handler request
    | None ->
      let st = Fourever.State.mk path in
      state := Some st;
      Dream.set_field request field st;
      inner_handler request

let get request callback =
  match Dream.field request field with
  | None -> failwith "no internal db state was found"
  | Some st -> callback st

