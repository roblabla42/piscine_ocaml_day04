(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 10:35:09 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 11:09:53 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    List.iter print_endline (List.map Color.toString Color.all);
    List.iter print_endline (List.map Color.toStringVerbose Color.all)
