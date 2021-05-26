import { Card } from "./Card";
import { score } from "./Score";

export const throwGameOverMessage = (message: string): void  => {
  throw new Error(`ERROR: ${message}`);
}

export const logYouWinMessage = (message: string, cards: Card[]): void  => {
  console.log(`Congratulations ${message}!! You win!!! With a score of ${score(cards)} from cards: ${JSON.stringify(cards)}`);
}

export const logYouLoseMessage = (message: string, cards: Card[]): void  => {
  console.log(`Sorry, you lose! You had a score of score ${score(cards)}. ${message}!`);
}