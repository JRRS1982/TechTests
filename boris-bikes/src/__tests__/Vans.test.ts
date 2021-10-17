import { Garage } from "./../Garage";
import { bike } from "../__mocks__/bike.mock";
import { station } from "../__mocks__/station.mock";
import { Station } from "../Station";
import { Van } from "../Van";

describe("Van", () => {
  let van: Van;
  let mockBike = bike();
  let mockBrokenBike = bike({ working: false });
  let station: Station;
  let garage: Garage;

  beforeEach(() => {
    van = new Van();
    station = new Station();
    garage = new Garage();
  });

  it("should take broken bikes from docking stations", () => {
    for (let index = 0; index < 3; index++) {
      station.dock(mockBike);
    }
    for (let index = 0; index < 5; index++) {
      station.dock(mockBrokenBike);
    }
    van.collect(station);
    expect(station.vehicles.length).toEqual(3);
    expect(van.storage.length).toEqual(5);
  });

  it("should take working bikes from garages", () => {
    for (let index = 0; index < 3; index++) {
      garage.dock(mockBike);
    }
    for (let index = 0; index < 5; index++) {
      garage.dock(mockBrokenBike);
    }
    van.collect(garage);
    expect(garage.vehicles.length).toEqual(5);
    expect(van.storage.length).toEqual(3);
  });
});
