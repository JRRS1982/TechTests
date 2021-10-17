import { IBike } from "../Bike";
import { IStation } from "../Station";

export const station = (overwrites?: Partial<IStation>): IStation => ({
  capacity: 20,
  bikes: [],
  dock: () => {},
  setCapacity: () => {},
  releaseBike: () => {},
  ...overwrites,
});
