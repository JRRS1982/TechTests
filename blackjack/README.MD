# Blackjack

This is an implementation of the game of blackjack, with one deck of cards, one player and one dealer.

See the [instructions](INSTRUCTIONS.MD) for acceptance criteria.

This application has been built with Typescript, Jest, Node, Concurrently and Nodemon. 

## Installation

1. `npm install` - install packages
1. `npm start` - start up program with concurrently to watch and compile changes in the src directory.
1. `npm test` - run test suite

## Learning

- Enjoyed playing with Jest and working work Javascript Classes. 
- Enjoyed putting together nodemon and concurrently for the application setup.
- Enjoyed stepping through the scoring logic..

## Future development

- [ ] Improve the logic on `deal` to handle both Player and Dealer and remove duplicated while block.
  - [ ] Differentiate between player and dealer (started this)
  - [ ] Combine while block logic to handle dealer and player
- [ ] Make the players an array and deal to multiple players.
- [ ] Improve the formatting of the log messages.
- [ ] Create a UI / frontend / host it.
- [ ] Make a factory to create cards for tests.
- [ ] Refactor to use more pure functions.
- [ ] Handle case where Ace is 1 or 11. 
