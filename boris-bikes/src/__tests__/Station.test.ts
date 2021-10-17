import { bike } from "../__mocks__/bike.mock";
import { Station } from "../Station";

describe("Station", () => {
  let mockBike = bike();
  let mockBrokenBike = bike({ working: false });
  let station: Station;
  let capacity: number = 20;

  beforeEach(() => {
    station = new Station();
  });

  it("should dock a bike", () => {
    station.dock(mockBike);
    expect(station.vehicles.length).toEqual(1);
  });

  it("should dock a broken bike", () => {
    station.dock(mockBrokenBike);
    expect(station.vehicles.length).toEqual(1);
  });

  it("should release a bike", () => {
    station.dock(mockBike);
    expect(station.vehicles.length).toEqual(1);
    station.releaseVehicle();
    expect(station.vehicles.length).toEqual(0);
  });

  it("should only release a bike if one is available", () => {
    let myBike = station.releaseVehicle();
    expect(myBike).toEqual(undefined);
  });

  it("should release broken items", () => {
    for (let index = 0; index < 3; index++) {
      station.dock(mockBike);
    }
    for (let index = 0; index < 5; index++) {
      station.dock(mockBrokenBike);
    }
    const broken = station.collection();
    expect(broken.length).toEqual(5);
    expect(station.vehicles.length).toEqual(3);
  });

  it("should not release a broken bike to consumer", () => {
    station.dock(mockBrokenBike);
    let bike = station.releaseVehicle();
    expect(bike).toBe(undefined);
  });

  it("should only dock up to the capacity", () => {
    for (let index = 0; index < capacity; index++) {
      station.dock(mockBike);
    }
    expect(station.vehicles.length).toEqual(capacity);
    expect(() => {
      station.dock(mockBike);
    }).toThrow();
  });

  it("should be able to update the capacity", () => {
    station.setCapacity(30);
    for (let index = 0; index < 30; index++) {
      station.dock(mockBike);
    }
    expect(station.vehicles.length).toEqual(30);
    expect(() => {
      station.dock(mockBike);
    }).toThrow();
  });
});
