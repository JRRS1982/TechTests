import { Scooter } from "../Scooter";

describe("Scooter", () => {
  let scooter: Scooter;

  beforeEach(() => {
    scooter = new Scooter();
  });

  it("should be able to tell if its working", () => {
    expect(scooter.working).toBe(true);
  });
});
