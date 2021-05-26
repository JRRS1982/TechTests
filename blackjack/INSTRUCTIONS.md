Can you beat the dealer at 21
======================================

#### Model the game

* create a single deck of playing cards
* two players (called Sam and the Dealer) who will play against each other
* each player is given two cards from the top of a shuffled deck of cards

#### Rules to implement

- [x] determine score of a hand[1]
- [x] check if either player has blackjack (21) with their initial hand and wins the game
- [x] if neither player has blackjack then Sam can start drawing cards from the top of the deck
- [x] Sam should stop drawing cards from the deck if their total reaches 17 or higher
- [x] Sam has lost the game if their total is higher than 21 
- [x] when Sam has stopped drawing cards the Dealer can start drawing cards from the top of the deck
- [x] the Dealer should stop drawing cards when their total is higher than Sam.
- [x] the Dealer has lost the game if their total is higher than 21 
- [x] determine which player wins the game

[1] Numbered cards are their point value. Jack, Queen and King count as 10 and Ace counts as 11.