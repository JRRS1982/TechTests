import { IVehicle } from './../IVehicle';

export const scooter = (overwrites?: Partial<IVehicle>): IVehicle => ({
  working: true,
  reportBroken: () => {},
  ...overwrites,
});
