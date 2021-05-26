import { cards } from "../Cards";

describe('Cards', () => {
  it('creates an array of Cards', () => {
    let deck = cards();
    expect(deck.length).toEqual(52);
  })
})
