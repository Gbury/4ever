
module Export = struct


  let keep ~role ~div l =
    let aux d =
      let divs = Dancer.as_role ~role d in
      let res =
        match div with
        | Division.Novice -> divs.novice
        | Division.Intermediate -> divs.inter
        | Division.Advanced -> divs.adv
      in
      res
    in
    List.filter aux l

  let compute_points ~role ~div ~st l =
    List.map (fun d ->
        d, Results.all_points st (Dancer.id d) role div
      ) l

  let sort l =
    let cmp (_, n) (_, n') = compare n' n in
    List.sort cmp l

  let export_inters_sorted db_file =
    let points_list ~role ~div ~st =
      Dancer.search st ()
      |> keep ~role ~div
      |> compute_points ~st ~role ~div
      |> sort
    in
    let print_list l file =
      let ch = open_out file in
      let fmt = Format.formatter_of_out_channel ch in
      List.iter (fun (d, points) ->
          Format.fprintf fmt "%d\t%s\t%s@\n" points (Dancer.first_name d) (Dancer.last_name d)
        ) l;
      close_out ch;
      ()
    in
    let st = State.mk db_file in
    print_list (points_list ~role:Leader ~div:Intermediate ~st) "leaders.inter";
    print_list (points_list ~role:Follower ~div:Intermediate ~st) "follows.inter";
    ()

  let export_num_by_points db_file =
    let arr ~role ~div ~st =
      let l =
        Dancer.search st ()
        |> keep ~role ~div
        |> compute_points ~st ~role ~div
      in
      let n =
        List.fold_left (fun acc (_, points) -> max acc points) 0 l
      in
      let a = Array.make (n + 1) 0 in
      List.iter (fun (_, points) -> a.(points) <- a.(points) + 1) l;
      a
    in
    let print a file =
      let ch = open_out file in
      let fmt = Format.formatter_of_out_channel ch in
      Array.iteri (fun points n ->
          Format.fprintf fmt "%d: %d@." points n
        ) a;
      close_out ch;
      ()
    in
    let st = State.mk db_file in
    print (arr ~role:Leader ~div:Novice ~st) "leaders.novice.txt";
    print (arr ~role:Follower ~div:Novice ~st) "follows.novice.txt";
    print (arr ~role:Leader ~div:Intermediate ~st) "leaders.inter.txt";
    print (arr ~role:Follower ~div:Intermediate ~st) "follows.inter.txt";
    print (arr ~role:Leader ~div:Advanced ~st) "leaders.adv.txt";
    print (arr ~role:Follower ~div:Advanced ~st) "follows.adv.txt";
    ()

end
