import { Card } from "./Card";

const shuffle = (deck: Card[]) => {
  for (let index = 0; index < deck.length; index++) {
    let location1 = Math.floor(Math.random() * deck.length);
    let location2 = Math.floor(Math.random() * deck.length);
    let temp = deck[location1];
    deck[location1] = deck[location2];
    deck[location2] = temp;
  }
  return deck;
};

export const cards = (): Card[] => {
  const suits: string[] = ["spades", "diamonds", "clubs", "hearts"];
  const values: string[] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];
  const cards: Card[] = [];
  
  for (let i = 0; i < suits.length; i++) {
    for (var x = 0; x < values.length; x++) {
      let card = new Card(values[x], suits[i]);
      cards.push(card);
    }
  }
  return shuffle(cards);
};
