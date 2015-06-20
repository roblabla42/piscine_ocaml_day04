(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla </var/spool/mail/roblabla>        +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 12:30:42 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/20 12:38:06 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let rec empty_deck deck =
        let (card, deck) = Deck.drawCard deck in
        print_endline (Deck.Card.toString card);
        empty_deck deck
    in
    let deck = Deck.newDeck() in
    List.iter print_endline (Deck.toStringList deck);
    print_endline "";
    List.iter print_endline (Deck.toStringListVerbose deck);
    print_endline "";
    empty_deck deck;
