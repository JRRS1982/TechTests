export class Item {
  name: string;
  sellIn: number;
  quality: number;

  constructor(name: string, sellIn: number, quality: number) {
    this.name = name;
    this.sellIn = sellIn;
    this.quality = quality;
  }
}

export class GildedRose {
  items: Array<Item>;

  constructor(items = [] as Array<Item>) {
    this.items = items;
  }

  updateQuality() {
    for (let i = 0; i < this.items.length; i++) {
      switch (this.items[i].name) {
        case "Aged Brie":
          if (this.items[i].quality < 50) {
            this.items[i].quality = this.items[i].quality + 1;
          }
          if (this.items[i].sellIn < 0) {
            this.items[i].quality = this.items[i].quality + 1;
          }
          this.items[i].sellIn--;
          break;
        case "Backstage passes to a TAFKAL80ETC concert":
          let beforeQuality = this.items[i].quality;
          this.items[i].quality = this.items[i].quality + 1;
          if (this.items[i].sellIn <= 10) {
            this.items[i].quality = this.items[i].quality + 1;
          }
          if (this.items[i].sellIn <= 5) {
            this.items[i].quality = this.items[i].quality + 1;
          }
          if (this.items[i].sellIn <= 0) {
            this.items[i].quality = 0;
          }
          if (this.items[i].quality > 50) {
            this.items[i].quality = beforeQuality;
          }
          this.items[i].sellIn--;
          break;
        case "Sulfuras, Hand of Ragnaros":
          // do nothing
          break;
        default:
          if (this.items[i].quality > 0) {
            this.items[i].quality--;
          }
          if (this.items[i].sellIn < 0) {
            this.items[i].quality--;
          }
          this.items[i].sellIn--;
          break;
      }
    }

    return this.items;
  }
}
