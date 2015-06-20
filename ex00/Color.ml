(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Color.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 10:32:38 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 10:35:02 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Spade | Heart | Diamond | Club

let all = Spade :: Heart :: Diamond :: Club :: []

let toString = function
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

let toStringVerbose = function
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"
