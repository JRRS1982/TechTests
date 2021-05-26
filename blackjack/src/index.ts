import { cards } from "./Cards";
import { Dealer, Player } from "./Player";
import { Game } from "./Game";

// There is one deck of playing cards
// The deck is shuffled
let deck = cards();

// // There are two players, Sam, and Dealer
let sam = new Player("Sam");
let dealer = new Dealer("Dealer");

// // Each player is given two cards from the top of the deck
let game = new Game(sam, dealer, deck);
// // determine score after first deal, if either player has blackjack they win.
game.start();
// if neither player has blackjack then deal a card to Sam from top of the pack.
game.deal();
// determine score of hand  -- recursion 'requestCardDecision'
// if score < 17 deal another  --  recursion
// if player and score 21 - 17 stick -- recursion
// if score > 21 lose game -- recursion

// when sam's turn is over 'requestCardDecision' process for the Dealer -- feel like this is recursive with an optional param
// with the additional param of Sam's score
// if dealer and score < 17 deal another card
// if dealer and score < player deal another card.

// log who wins.

// [1] Numbered cards are their point value. Jack, Queen and King count as 10 and Ace counts as 11.
