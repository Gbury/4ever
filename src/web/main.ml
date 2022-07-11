
let loader _root path _request =
  match Static.read path with
  | None -> Dream.empty `Not_Found
  | Some asset -> Dream.respond asset

let () =
  let info = Cmdliner.Cmd.info ~version:"dev" "fourever" in
  let cmd = Cmdliner.Cmd.v info Options.t in
  let options =
    match Cmdliner.Cmd.eval_value cmd with
    | Ok `Ok options -> options
    | Ok (`Help | `Version) -> exit 0
    | Error `Parse -> exit Cmdliner.Cmd.Exit.cli_error
    | Error (`Term | `Exn) -> exit Cmdliner.Cmd.Exit.internal_error
  in
  Dream.run
    ~port:options.server_port
    ~error_handler:Error.error_handler
  @@ Dream.logger
  @@ State.init ~path:options.db_path
  @@ Dream.router [
    Dream.get "/" (Page.render Index.t);
    Dream.get "/faq" (Page.render Faq.t);
    Dream.get "/about" (Page.render About.t);
    Dream.get "/rules" (Page.render Rules.t);
    Dream.get "/events" (Page.render Events.list);
    Dream.get "/event/:id" (Page.render Events.t);
    Dream.get "/comp/:id" (Page.render Competitions.t);
    Dream.get "/dancers" (Page.render Dancers.list);
    Dream.get "/dancer/:id" (Page.render Dancers.t);

    (* static content *)
    Dream.get "/static/**" (Dream.static ~loader "");
  ]

