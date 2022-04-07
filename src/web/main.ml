
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
  Dream.run ~error_handler:Error.error_handler
  @@ Dream.logger
  @@ State.init ~path:options.db_path
  @@ Dream.router [
    Dream.get "/" (Page.render Index.t);
    Dream.get "/events" (Page.render Events.list);
    Dream.get "/event/:id" (Page.render Events.t);
    Dream.get "/comp/:id" (Page.render Competitions.t);
    Dream.get "/dancers" (Page.render Dancers.list);
    Dream.get "/dancer/:id" (Page.render Dancers.t);
  ]

