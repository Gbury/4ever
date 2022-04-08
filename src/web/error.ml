
let error_template error debug_info suggested_response =
  let status, debug_info =
    match error.Dream.condition with
    | `Exn Misc.Expected_an_int s ->
      let status : Dream.status = `Bad_Request in
      let debug_info =
        Format.asprintf
          "Incorrect URL: expected an integer instead of the string '%s'" s
      in
      status, debug_info
    | _ ->
      let status = Dream.status suggested_response in
      status, debug_info
  in

  let code = Dream.status_to_int status
  and reason = Dream.status_to_string status in
  Dream.set_status suggested_response status;
  Dream.set_header suggested_response "Content-Type" Dream.text_html;
  Dream.set_body suggested_response (
    Template.render ~title:"Error" ~page:"error"
      ~body:(Error_html.render code reason debug_info)
  );
  Lwt.return suggested_response

let error_handler = Dream.error_template error_template

