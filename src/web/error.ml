
let error_template _error debug_info suggested_response =
  let status = Dream.status suggested_response in
  let code = Dream.status_to_int status
  and reason = Dream.status_to_string status in

  Dream.set_header suggested_response "Content-Type" Dream.text_html;
  Dream.set_body suggested_response (
    Template.render ~title:"Error" ~page:"error"
      ~body:(Error_html.render code reason debug_info)
  );
  Lwt.return suggested_response

let error_handler = Dream.error_template error_template

