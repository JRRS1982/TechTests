import { IVehicle } from "./IVehicle";

export interface IStation {
  capacity: number;
  vehicles: IVehicle[];
  setCapacity: (number: Number) => void;
  releaseVehicle: () => IVehicle | undefined;
  dock: (vehicle: IVehicle) => void;
  collection: () => IVehicle[];
}
