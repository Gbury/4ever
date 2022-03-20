
type id = int

type t = {
  id : id;
  points : int;
  role : Role.t;
  dancer : Dancer.id;
  division : Division.t;
  competition : Competition.id;
}

let () =
  State.add_init (fun st ->
      Sqlite3_utils.exec0_exn st {|
        CREATE TABLE IF NOT EXISTS results (
          id INTEGER PRIMARY KEY,
          points INT,
          role INT,
          dancer INT,
          division INT,
          competition INT
        )
      |})

let get st id =
  let open Sqlite3_utils in
  exec_exn st
    ~f:Cursor.get_one_exn
    ~ty:Ty.(p1 int, p6 int int int int int int,
            (fun id points role dancer division competition ->
               let role = Role.of_int role in
               let division = Division.of_int division in
               { id; points; role; dancer; division; competition; }))
    {| SELECT id, points, role, dancer, division, competition FROM dancers WHERE id=? |} id



