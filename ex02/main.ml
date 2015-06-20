(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 11:51:08 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 12:01:54 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    List.iter print_endline (List.map Card.toStringVerbose Card.allSpades);
    List.iter print_endline (List.map Card.toString Card.allHearts);
    List.iter print_endline (List.map Card.toString Card.allDiamonds);
    List.iter print_endline (List.map Card.toString Card.allClubs);
    print_endline "";
    List.iter print_endline (List.map Card.toString Card.all);
    print_endline "";
    print_endline (Card.toString (Card.best Card.all))
