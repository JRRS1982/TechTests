import { Dealer, Player } from "./Player";
import { Card } from "./Card";
import { score } from "./Score";
import { logYouWinMessage, logYouLoseMessage, throwGameOverMessage } from "./Logs";


export class Game {
  player: Player;
  dealer: Dealer;
  deck: Card[];

  constructor(player: Player, dealer: Dealer, deck: Card[]) {
    this.player = player;
    this.dealer = dealer;
    this.deck = deck;
  }

  start(): void {
    this.getInitialCards(this.deck, this.player);
    if (score(this.player.hand) === 21) {
      logYouWinMessage(this.player.name, this.player.hand);
    }

    this.getInitialCards(this.deck, this.dealer);
    if (score(this.dealer.hand) === 21 && score(this.player.hand) !== 21) {
      logYouLoseMessage(this.dealer.name, this.dealer.hand);
    }
  }

  private getInitialCards(deck: Card[], player: Player): void {
    let card = deck.shift();
    if (card == null) {
      return;
    }
    player.hand.push(card);

    if (player.hand.length < 2) {
      this.getInitialCards(deck, player);
    }
  }

  deal = (): void => {
    if (this.deck.length < 1) {
      throwGameOverMessage("No cards left!");
    }

    while (!this.turnOver(this.player)) {  
      let card = this.getACard(this.deck);
      
      if (card) {
        this.giveACard(this.player, card);
      }

      if (score(this.player.hand) === 21)  {
        logYouWinMessage("Blackjack!, you win!", this.player.hand);
        return
      }
      if (score(this.player.hand) > 21) {
        logYouLoseMessage("You went bust!!", this.player.hand);
        return
      }
    }
    while (!this.turnOver(this.dealer)) {
      let card = this.getACard(this.deck);
      if (card) {
        this.giveACard(this.dealer, card);
      }
      if (score(this.dealer.hand) > 21) {
        logYouWinMessage("Your dealer went bust!", this.player.hand);
        return
      }
      if (score(this.dealer.hand) > score(this.player.hand)) {
        logYouLoseMessage("Your dealer had a better score than you!", this.player.hand);
      };
      
    }
  };

  private getACard = (deck: Card[]): Card | void => {
    if (deck.length < 1) {
      throwGameOverMessage("Cards are all gone!");
    }
    return this.deck.shift() as Card;
  };

  private giveACard = (player: Player | Dealer, card: Card): void => {
    player.hand.push(card);
  };

  private turnOver = (player: Player | Dealer): boolean => {
    if (score(this.player.hand) > 21) {
      return true;
    }

    if (score(player.hand) >= 17) {
      return true;
    }
    return false;
  };
}
