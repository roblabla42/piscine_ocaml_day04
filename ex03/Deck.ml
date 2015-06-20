(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Card.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 11:23:20 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 12:37:16 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Card = struct
    module Color = struct
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
    end

    module Value = struct
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
    end

    type t = Value.t * Color.t

    let newCard v c = (v, c)

    let allSpades = List.map (fun x -> newCard x Color.Spade) Value.all
    let allHearts = List.map (fun x -> newCard x Color.Heart) Value.all
    let allDiamonds = List.map (fun x -> newCard x Color.Diamond) Value.all
    let allClubs = List.map (fun x -> newCard x Color.Club) Value.all
    let all = List.concat [allSpades; allHearts; allDiamonds; allClubs]

    let getValue (v, c) = v
    let getColor (v, c) = c

    let toString (v, c) = (Value.toString v) ^ (Color.toString c)
    let toStringVerbose (v, c) = Printf.sprintf "Card(%s,%s)" (Value.toStringVerbose v) (Color.toStringVerbose c)

    let compare (v1, _) (v2, _) = (Value.toInt v1) - (Value.toInt v2)
    let max c1 c2 = if compare c1 c2 < 0 then c2 else c1
    let min c1 c2 = if compare c1 c2 > 0 then c2 else c1
    let best = function
        | [] -> invalid_arg "List is empty"
        | a :: b -> List.fold_left max a b

    let isOf (v, c) c_ref = c = c_ref
    let isSpade = function c -> isOf c Color.Spade
    let isHeart = function c -> isOf c Color.Heart
    let isDiamond = function c -> isOf c Color.Diamond
    let isClub = function c -> isOf c Color.Club
end

type t = Card.t list

let newDeck () =
    let randList = List.map (fun c -> (Random.bits (), c)) Card.all in
    let sortedRandList = List.sort compare randList in
    List.map snd sortedRandList

let toStringList = List.map Card.toString

let toStringListVerbose = List.map Card.toStringVerbose

let drawCard = function
    | [] -> raise (Failure ("Empty Deck"))
    | a :: b -> (a, b)
