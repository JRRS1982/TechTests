import { cards } from "../Cards";
import { Game } from "../Game";
import { Dealer, Player } from "../Player";
import { Card } from "../Card";
import * as Logs from "../Logs";
import { score } from "../Score";

describe("Game", () => {
  let twoSpades = new Card("2", "spades");
  let threeSpades = new Card("3", "spades");
  let fiveSpades = new Card("5", "spades");
  let sixSpades = new Card("6", "spades");
  let jackSpades = new Card("J", "spades");
  let queenSpades = new Card("Q", "spades");
  let kingSpades = new Card("K", "spades");
  let aceSpades = new Card("A", "spades");
  let playerSam: Player;
  let playerDealer: Dealer;

  beforeEach(() => {
    playerSam = new Player("Sam");
    playerDealer = new Dealer("Dealer");
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  describe("start", () => {
    let spyYouWinMessage: jest.SpyInstance;
    let spyYouLoseMessage: jest.SpyInstance;

    beforeEach(() => {
      spyYouWinMessage = jest.spyOn(Logs, "logYouWinMessage");
      spyYouLoseMessage = jest.spyOn(Logs, "logYouLoseMessage");
    });
  
    afterEach(() => {
      jest.clearAllMocks();
    });

    it("should deal two cards to each player", () => {
      const fourCards = [twoSpades, threeSpades, queenSpades, kingSpades];
      const game = new Game(playerSam, playerDealer, fourCards);

      game.start();

      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(2);
      expect(game.deck.length).toEqual(0);
    });

    it("should deal only two cards to each player", () => {
      const deck = cards();
      const game = new Game(playerSam, playerDealer, deck);

      game.start();

      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(2);
      expect(game.deck.length).toEqual(48);
    });

    it("should log a win to player if gets blackjack", () => {
      const cards = [aceSpades, kingSpades, queenSpades, threeSpades];
      const game = new Game(playerSam, playerDealer, cards);


      game.start();

      expect(score(game.player.hand)).toEqual(21);
      expect(spyYouWinMessage).toBeCalledWith(playerSam.name, game.player.hand);
    });

    it("should log a win for dealer if gets blackjack", () => {
      const cards = [queenSpades, threeSpades, aceSpades, kingSpades];
      const game = new Game(playerSam, playerDealer, cards);
    
      game.start();

      expect(score(game.player.hand)).toEqual(13);
      expect(score(game.dealer.hand)).toEqual(21);
      expect(spyYouLoseMessage).toBeCalledWith(playerDealer.name, game.dealer.hand);
    });

    it("should not log a win for dealer if player gets blackjack", () => {
      const cards = [queenSpades, aceSpades, twoSpades, kingSpades];
      const game = new Game(playerSam, playerDealer, cards);

      game.start();

      expect(spyYouLoseMessage).not.toBeCalled();
    });
  });

  describe("deal", () => {
    let spyYouWinMessage: jest.SpyInstance;
    let spyYouLoseMessage: jest.SpyInstance;

    beforeEach(() => {
      spyYouWinMessage = jest.spyOn(Logs, "logYouWinMessage");
      spyYouLoseMessage = jest.spyOn(Logs, "logYouLoseMessage");
    });
  
    afterEach(() => {
      jest.clearAllMocks();
    });

    it('keep dealing cards to player until 17', () => {
      const deck = [aceSpades, fiveSpades, threeSpades, twoSpades, threeSpades, queenSpades, kingSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();
      
      game.deal();

      expect(score(game.player.hand)).toEqual(19);
      expect(game.player.hand.length).toEqual(3);
      expect(spyYouWinMessage).toBeCalled();
    })

    it('stop dealing cards to player if gets 17', () => {
      const deck = [aceSpades, sixSpades, kingSpades, threeSpades, twoSpades, threeSpades, queenSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();

      expect(score(game.player.hand)).toEqual(17);
      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(4);
      expect(spyYouLoseMessage).toBeCalled();
    })

    it('stop dealing cards to player if over 21', () => {
      const deck = [queenSpades, sixSpades, threeSpades, twoSpades, kingSpades, jackSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();
      
      expect(game.player.hand.length).toEqual(3);
      expect(game.dealer.hand.length).toEqual(2);
      expect(spyYouLoseMessage).toBeCalled();
    })

    it('deal cards to dealer if player score less then 21', () => {
      const deck = [queenSpades, sixSpades, threeSpades, twoSpades, kingSpades, jackSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();
      
      expect(game.player.hand.length).toEqual(3);
      expect(game.dealer.hand.length).toEqual(2);
      expect(spyYouLoseMessage).toBeCalled();
    })
    
    it('keep dealing cards to dealer if less than player score', () => {
      const deck = [aceSpades, sixSpades, threeSpades, twoSpades, threeSpades, queenSpades, jackSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();

      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(4);
      expect(score(game.dealer.hand)).toEqual(18);
      expect(spyYouLoseMessage).toBeCalled();
    })

    it('stop dealing cards to dealer if greater than player score', () => {
      const deck = [aceSpades, sixSpades, kingSpades, twoSpades, sixSpades, queenSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();

      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(3);
      expect(spyYouLoseMessage).toBeCalled();
    })

    it('stop dealing cards to dealer if greater than 21', () => {
      const deck = [aceSpades, sixSpades, kingSpades, fiveSpades, queenSpades, twoSpades];;
      const game = new Game(playerSam, playerDealer, deck);
      game.start();    

      game.deal();

      expect(game.player.hand.length).toEqual(2);
      expect(game.dealer.hand.length).toEqual(3);
      expect(spyYouWinMessage).toBeCalled();
    })
  });
});
