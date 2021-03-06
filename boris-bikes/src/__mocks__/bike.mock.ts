import { IVehicle } from './../IVehicle';

export const bike = (overwrites?: Partial<IVehicle>): IVehicle => ({
  working: true,
  reportBroken: () => {},
  ...overwrites,
});
