import { Bike } from "./Bike";

describe("Bike", () => {
  let bike: Bike;

  beforeEach(() => {
    bike = new Bike();
  });

  it("should be able to tell if its working", () => {
    expect(bike.working).toBe(true);
  });
});
