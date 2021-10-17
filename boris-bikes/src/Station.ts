import { IBike } from "./Bike";

export interface IStation {
  capacity: number;
  bikes: IBike[];
  dock: () => void;
  releaseBike: () => void;
  setCapacity: () => void;
}

export class Station {
  bikes: IBike[];
  capacity: number = 20;

  constructor() {
    this.bikes = [];
  }

  dock(bike: IBike) {
    if (this.bikes.length < this.capacity) {
      this.bikes.push(bike);
    } else {
      throw new Error("Over capacity");
    }
  }

  setCapacity(newCapacity: number) {
    this.capacity = newCapacity;
  }

  releaseBike() {
    if (this.bikes.length > 0) {      
      this.get();
    }
  }

  private get() {
    for (let index = 0; index < this.bikes.length; index++) {
      if (this.bikes[index].working) { 
        this.bikes.splice(index);
      }
    }
  }
}
