import { IBike } from "./Bike";
import { Station } from "./Station";

export class Van {
  storage: IBike[] = [];

  constructor() {
    this.storage = [];
  }

  collectBroken(station: Station) {
    let broken = station.releaseBrokenItems();

    for (let index = 0; index < broken.length; index++) {
      this.storage.push(broken[index]);
    }
  }
}
