
module Export = struct

  let print l file =
    let ch = open_out file in
    let fmt = Format.formatter_of_out_channel ch in
    List.iter (fun (d, points) ->
        Format.fprintf fmt "%d\t%s\t%s@\n" points (Dancer.first_name d) (Dancer.last_name d)
      ) l;
    close_out ch;
    ()

  let keep ~role ~div l =
    let aux d =
      let divs = Dancer.as_role ~role d in
      match div with
      | Division.Novice -> divs.novice
      | Division.Intermediate -> divs.inter
      | Division.Advanced -> divs.adv
    in
    List.filter aux l

  let compute_points ~role ~div ~st l =
    List.map (fun d ->
        d, Results.all_points st (Dancer.id d) role div
      ) l

  let sort l =
    let cmp (_, n) (_, n') = compare n' n in
    List.sort cmp l

  let points_list ~role ~div ~st =
    Dancer.search st ()
    |> keep ~role ~div
    |> compute_points ~st ~role ~div
    |> sort

  let inters db_file =
    let st = State.mk db_file in
    print (points_list ~role:Leader ~div:Intermediate ~st) "leaders.inter";
    print (points_list ~role:Follower ~div:Intermediate ~st) "follows.inter";
    ()

end
