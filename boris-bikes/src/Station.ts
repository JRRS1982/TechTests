import { IVehicle } from './IVehicle';

export class Station {
  capacity: number = 20;
  vehicles: IVehicle[];

  constructor() {
    this.vehicles = [];
  }

  dock(vehicle: IVehicle): void {
    if (this.vehicles.length < this.capacity) {
      this.vehicles.push(vehicle);
    } else {
      throw new Error("Over capacity");
    }
  }

  setCapacity(newCapacity: number): void {
    this.capacity = newCapacity;
  }

  releaseVehicle(): IVehicle | undefined {
    return this.get();
  }

  collection(): IVehicle[] {
    let working = this.vehicles.filter((item) => {
      return item.working
    })

    let notWorking =  this.vehicles.filter((item) => {
      return item.working === false
    })

    this.vehicles = working;

    return notWorking;
  }

  private get() {
    for (let index = 0; index < this.vehicles.length; index++) {
      if (this.vehicles[index].working) {
        return this.vehicles.splice(index)[0];
      }
    }
  }
}
