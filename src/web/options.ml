
(* This file is free software, part of fourever. See file "LICENSE" for more information *)

open Cmdliner

(* Options record *)
(* ************************************************************************* *)

type t = {
  db_path : string;
}

let mk db_path =
  { db_path; }

(* Cmdliner term *)
(* ************************************************************************* *)

let t =
  let db_path =
    let doc = "Path to the sqlite db to use" in
    Arg.(required & opt (some string) None & info ["db"] ~doc)
  in
  Term.(const mk $ db_path)

