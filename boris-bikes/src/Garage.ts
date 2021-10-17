import { IVehicle } from './IVehicle';

export class Garage {
  vehicles: IVehicle[];

  constructor() {
    this.vehicles = [];
  }

  dock(vehicle: IVehicle): void {
    this.vehicles.push(vehicle);
  }

  collection(): IVehicle[] {
    let notWorking = this.vehicles.filter((item) => {
      return !item.working;
    });

    let working = this.vehicles.filter((item) => {
      return item.working;
    });

    this.vehicles = notWorking;

    return working;
  }
}
