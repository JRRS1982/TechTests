import { IVehicle } from './IVehicle';

export interface IStorage {
  vehicles: IVehicle[];
  dock: (vehicle: IVehicle) => void;
  collection: () => IVehicle[];
}
