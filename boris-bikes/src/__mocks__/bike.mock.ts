import { Bike } from "./../Bike";

export const bike = (overwrites?: Partial<Bike>): Bike => ({
  working: true,
  reportBroken: () => {},
  ...overwrites,
});
