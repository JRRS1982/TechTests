interface PlayingCard {
  value: string;
  suit: string;
}

export class Card implements PlayingCard {
  constructor(public value: string, public suit: string) {
    this.value = value;
    this.suit = suit;
  }
}