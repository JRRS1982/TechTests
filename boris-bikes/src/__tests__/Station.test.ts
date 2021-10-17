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
    expect(station.bikes.length).toEqual(1);
  });

  it("should dock a broken bike", () => {
    station.dock(mockBrokenBike);
    expect(station.bikes.length).toEqual(1);
  });

  it("should release a bike", () => {
    station.dock(mockBike);
    expect(station.bikes.length).toEqual(1);
    station.releaseBike();
    expect(station.bikes.length).toEqual(0);
  });

  it("should only release a bike if one is available", () => {
    let myBike = station.releaseBike();
    expect(myBike).toEqual(undefined);
  });

  it("should release broken items", () => {
    station.setCapacity(30);
    for (let index = 0; index < 3; index++) {
      station.dock(mockBike);
    }
    for (let index = 0; index < 5; index++) {
      station.dock(mockBrokenBike);
    }
    station.releaseBrokenItems();
    expect(station.bikes.length).toEqual(3);
  });

  it("should only dock up to the capacity", () => {
    for (let index = 0; index < capacity; index++) {
      station.dock(mockBike);
    }
    expect(station.bikes.length).toEqual(capacity);
    expect(() => {
      station.dock(mockBike);
    }).toThrow();
  });

  it("should be able to update the capacity", () => {
    station.setCapacity(30);
    for (let index = 0; index < 30; index++) {
      station.dock(mockBike);
    }
    expect(station.bikes.length).toEqual(30);
    expect(() => {
      station.dock(mockBike);
    }).toThrow();
  });
});
