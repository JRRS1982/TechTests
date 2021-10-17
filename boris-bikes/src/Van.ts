import { IStorage } from './IStorage';
import { IVehicle } from "./IVehicle";

export class Van {
  storage: IVehicle[] = [];

  constructor() {
    this.storage = [];
  }

  collect(storage: IStorage) {
    let items = storage.collection();

    for (let index = 0; index < items.length; index++) {
      this.storage.push(items[index]);
    }
  }
}
