import { Card } from "./Card";

const scoreACard = (cardValue: string): number => {
  const faceCards = ["J", "Q", "K"];
  if (cardValue === "A") {
    return 11;
  }  
  if (faceCards.includes(cardValue)) {
    return 10;
  }
  return parseInt(cardValue);
}

export const score = (cards: Card[]): number => {
  let score: number = 0;
  if (cards.length < 1) {
    return 0;
  }
  const values = cards.map((cards) => cards.value);

  for (let cardValueString of values) {
    score += scoreACard(cardValueString);
  }
  return score;
}
