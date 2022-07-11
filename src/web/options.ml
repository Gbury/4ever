
(* This file is free software, part of fourever. See file "LICENSE" for more information *)

open Cmdliner

(* Options record *)
(* ************************************************************************* *)

type t = {
  db_path : string;
  server_port : int;
}

let mk db_path server_port =
  { db_path; server_port; }

(* Cmdliner term *)
(* ************************************************************************* *)

let t =
  let db_path =
    let doc = "Path to the sqlite db to use" in
    Arg.(required & opt (some string) None & info ["db"] ~doc)
  in
  let port =
    let doc = "Port to listen on" in
    Arg.(value & opt int 8080 & info ["p"; "port"] ~doc)
  in
  Term.(const mk $ db_path $ port)

