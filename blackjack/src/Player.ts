import { Card } from "./Card";

class Human {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

export class Player extends Human {
  hand: Card[] = [];
}

export class Dealer extends Player {}