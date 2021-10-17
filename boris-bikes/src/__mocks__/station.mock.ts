import { IStation } from "../IStation";

export const station = (overwrites?: Partial<IStation>): IStation => ({
  capacity: 20,
  vehicles: [],
  setCapacity: () => {},
  releaseVehicle: () => undefined,
  dock: () => {},
  collection: () => [],
  ...overwrites,
});
