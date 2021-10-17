import { IBike } from "./../Bike";

export const bike = (overwrites?: Partial<IBike>): IBike => ({
  working: true,
  reportBroken: () => {},
  ...overwrites,
});
