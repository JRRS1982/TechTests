import { GildedRose, Item } from "../gilded-rose";

describe("GildedRose", function () {
  describe('Sulfuras, Hand of Ragnaros', () => {
    it("should not reduce quality or sellIn", function () {
      const itemsIn = [new Item("Sulfuras, Hand of Ragnaros", 10, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(10);
      expect(items[0].quality).toEqual(10);
    });

    it("should not change if negative", function () {
      const itemsIn = [new Item("Sulfuras, Hand of Ragnaros", -1, -1)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-1);
      expect(items[0].quality).toEqual(-1);
    });

    it("Quality can be more than 50.. and won't decrement either", function () {
      const itemsIn = [new Item("Sulfuras, Hand of Ragnaros", 30, 80)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(30);
      expect(items[0].quality).toEqual(80);
    });
  });

  describe('foo', () => {
    it("should reduce quality and sellIn when positive", function () {
      const itemsIn = [new Item("foo", 10, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(9);
    });
    
    it("quality should not turn negative", function () {
      const itemsIn = [new Item("foo", 0, 0)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-1);
      expect(items[0].quality).toEqual(0);
    });

    it("quality should not decrement past negative", function () {
      const itemsIn = [new Item("foo", 0, -2)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-1);
      expect(items[0].quality).toEqual(-2);
    });

    it("if sellIn negative quality reduces by 2", function () {
      const itemsIn = [new Item("foo", -1, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-2);
      expect(items[0].quality).toEqual(8);
    });

    it("Quality of an item is never more than 50... but it actually can be", function () {
      const itemsIn = [new Item("foo", 10, 60)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(59);
    });
  })
  
  describe('Aged Brie', () => {
    it("Should increase in quality", function () {
      const itemsIn = [new Item("Aged Brie", 10, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(11);
    });
    
    it("Quality wont increment past 50", function () {
      const itemsIn = [new Item("Aged Brie", 10, 50)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(50);
    });

    it("If sellIn negative still increments", function () {
      const itemsIn = [new Item("Aged Brie", -2, 20)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-3);
      expect(items[0].quality).toEqual(22);
    });
  });

  describe('Backstage passes to a TAFKAL80ETC concert', () => {
    it("If sellIn greater than 10, should increase in quality by 1", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", 20, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(19);
      expect(items[0].quality).toEqual(11);
    });

    it("If sellIn equals 10, should increase in quality by 2", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", 10, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(12);
    });

    it("If sellIn equals 5, should increase in quality by 3", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", 5, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(4);
      expect(items[0].quality).toEqual(13);
    });

    it("If sellIn equals 0, update should return 0 value", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", 0, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-1);
      expect(items[0].quality).toEqual(0);
    });

    it("If sellIn negative, update should return 0 value", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", -2, 10)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(-3);
      expect(items[0].quality).toEqual(0);
    });
    
    it("Quality is never more than 50 - won't decrement tickets if over 50", function () {
      const itemsIn = [new Item("Backstage passes to a TAFKAL80ETC concert", 10, 60)];
      const gildedRose = new GildedRose(itemsIn);
      const items = gildedRose.updateQuality();
      expect(items[0].sellIn).toEqual(9);
      expect(items[0].quality).toEqual(60);
    });
  });
});
