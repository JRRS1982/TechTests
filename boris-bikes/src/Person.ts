import { IVehicle } from "./IVehicle";



export class Person {
  reportBroken(vehicle: IVehicle) {
    vehicle.reportBroken();
  }
}
