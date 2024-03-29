open Base
open List
open Stdio

let score (t, d) =
  let tf = Int.to_float t in
  let df = Int.to_float d in
  let delta = tf *. tf -. 4. *. df in
  if Float.(>=) delta 0. then
    let x1 = (-. tf +. Float.sqrt delta) /. -. 2. in
    let x2 = (-. tf -. Float.sqrt delta) /. -. 2. in
    Float.to_int (Float.round_down x2 -. Float.round_up x1) + 1
  else 0

let part1 =
  [(48, 261); (93, 1192); (84, 1019); (66, 1063)]
  |> map ~f:score
  |> reduce_exn ~f:( * )
  
let part2 = score (48938466, 261119210191063)

let _ =
  begin
    printf "Part 1: %d\n" part1;
    printf "Part 2: %d\n" part2
  end
