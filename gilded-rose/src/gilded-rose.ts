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
          break;
        case "Sulfuras, Hand of Ragnaros":
          // do nothing
          break;
        default:
          if (this.items[i].sellIn > 0) {

          }
          break;
      }
    
    }



    // for (let i = 0; i < this.items.length; i++) {
    //   if (this.items[i].name != "Aged Brie" && this.items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
    //     if (this.items[i].quality > 0) {
    //       if (this.items[i].name != "Sulfuras, Hand of Ragnaros") {
    //         this.items[i].quality = this.decrementQuality(this.items[i]);
    //       }
    //     }
    //   } else {
    //     if (this.items[i].quality < 50) {
    //       this.items[i].quality = this.incrementQuality(this.items[i]);;
    //       if (this.items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
    //         if (this.items[i].sellIn < 11) {
    //           if (this.items[i].quality < 50) {
    //             this.items[i].quality = this.incrementQuality(this.items[i]);
    //           }
    //         }
    //         if (this.items[i].sellIn < 6) {
    //           if (this.items[i].quality < 50) {
    //             this.items[i].quality = this.incrementQuality(this.items[i]);
    //           }
    //         }
    //       }
    //     }
    //   }
    //   if (this.items[i].name != "Sulfuras, Hand of Ragnaros") {
    //     this.items[i].sellIn = this.decrementSellIn(this.items[i]);
    //   }
    //   if (this.items[i].sellIn < 0) {
    //     if (this.items[i].name != "Aged Brie") {
    //       if (this.items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
    //         if (this.items[i].quality > 0) {
    //           if (this.items[i].name != "Sulfuras, Hand of Ragnaros") {
    //             this.items[i].quality = this.decrementQuality(this.items[i]);
    //           }
    //         }
    //       } else {
    //         this.items[i].quality = this.items[i].quality - this.items[i].quality;
    //       }
    //     } else {
    //       if (this.items[i].quality < 50) {
    //         this.items[i].quality = this.incrementQuality(this.items[i]);
    //       }
    //     }
    //   }
    // }

    return this.items;
  }
}
