(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Value.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 10:58:48 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 12:03:55 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

let all = T2 :: T3 :: T4 :: T5 :: T6 :: T7 :: T8 :: T9 :: T10 :: Jack :: Queen :: King :: As :: []

let toInt = function
    | T2 -> 1
    | T3 -> 2
    | T4 -> 3
    | T5 -> 4
    | T6 -> 5
    | T7 -> 6
    | T8 -> 7
    | T9 -> 8
    | T10 -> 9
    | Jack -> 10
    | Queen -> 11
    | King -> 12
    | As -> 13

let toString = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "J"
    | Queen -> "Q"
    | King -> "K"
    | As -> "A"

let toStringVerbose = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "Jack"
    | Queen -> "Queen"
    | King -> "King"
    | As -> "As"

let next e =
    let rec lstfindnext e = function
        | [] -> invalid_arg "Couldn't find given elem in array"
        | a :: b :: c when a = e -> b
        | a :: [] when a = e -> invalid_arg "There is no next element"
        | a :: b -> lstfindnext e b
    in
    lstfindnext e all

let previous e =
    let rec lstfindprev e = function
        | [] -> invalid_arg "Couldn't find given elem in array"
        | a :: b :: c when b = e -> a
        | a :: b when a = e -> invalid_arg "There is no previous element"
        | a :: b -> lstfindprev e b
    in
    lstfindprev e all
