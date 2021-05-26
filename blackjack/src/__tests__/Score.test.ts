import { Card } from "../Card";
import { score } from "../Score";


describe('score', () => {
  const twoSpades = new Card("2", "spades");
  const threeSpades = new Card("3", "spades");
  const fourSpades = new Card("4", "spades");
  const fiveSpades = new Card("5", "spades");
  const sixSpades = new Card("6", "spades");
  const sevenSpades = new Card("7", "spades");
  const eightSpades = new Card("8", "spades");
  const nineSpades = new Card("9", "spades");
  const tenSpades = new Card("10", "spades");
  const jackSpades = new Card("J", "spades");
  const queenSpades = new Card("Q", "spades");
  const kingSpades = new Card("K", "spades");
  const aceSpades = new Card("A", "spades");

  it('correctly totals an empty hand', () => {
    expect(score([])).toEqual(0);  
  })

  describe('face cards', () => {
    expect(score([jackSpades])).toEqual(10);
    expect(score([queenSpades])).toEqual(10);
    expect(score([kingSpades])).toEqual(10);
    expect(score([aceSpades])).toEqual(11);
    
  })

  describe('number cards', () => {
    expect(score([twoSpades])).toEqual(2);
    expect(score([threeSpades])).toEqual(3);
    expect(score([fourSpades])).toEqual(4);
    expect(score([fiveSpades])).toEqual(5);
    expect(score([sixSpades])).toEqual(6);
    expect(score([sevenSpades])).toEqual(7);
    expect(score([eightSpades])).toEqual(8);
    expect(score([nineSpades])).toEqual(9);
    expect(score([tenSpades])).toEqual(10);
  })
  

  describe('multiple cards', () => {
    expect(score([threeSpades, kingSpades])).toEqual(13);
    expect(score([threeSpades, fourSpades, kingSpades])).toEqual(17);
    expect(score([threeSpades, fourSpades, twoSpades, kingSpades])).toEqual(19);
    expect(score([jackSpades, aceSpades, queenSpades])).toEqual(31);
  })
})
