import { bike } from "../__mocks__/bike.mock";
import { Garage } from "../Garage";

describe("Garage", () => {
  let mockBike = bike();
  let mockBrokenBike = bike({ working: false });
  let garage: Garage;

  beforeEach(() => {
    garage = new Garage();
  });

  it("should dock a bike", () => {
    garage.dock(mockBike);
    expect(garage.vehicles.length).toEqual(1);
  });

  it("should dock a broken bike", () => {
    garage.dock(mockBrokenBike);
    expect(garage.vehicles.length).toEqual(1);
  });

  it("should release a bike", () => {
    garage.dock(mockBike);
    expect(garage.vehicles.length).toEqual(1);
    garage.collection();
    expect(garage.vehicles.length).toEqual(0);
  });

  it("should only release a bike if one is available", () => {
    let myBike = garage.collection();
    expect(myBike).toEqual([]);
  });

  it("should only release a bike if its working", () => {
    garage.dock(mockBrokenBike);
    let myBike = garage.collection();
    expect(myBike).toEqual([]);
  });
});
