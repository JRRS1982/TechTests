import { Person } from "../Person";

export const person = (overwrites?: Partial<Person>): Person => ({
  reportBroken: () => {},
  ...overwrites,
});
