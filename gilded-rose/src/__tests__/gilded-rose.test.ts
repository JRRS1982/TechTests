import { GildedRose, Item } from "../gilded-rose";


describe("GildedRose", function () {
  it("should foo", function () {
    const itemsIn = [new Item("foo", 0, 0)];
    const gildedRose = new GildedRose(itemsIn);
    const items = gildedRose.updateQuality();
    expect(items[0].name).toEqual("foo");
  });
});
