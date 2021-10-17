import { bike } from "../__mocks__/bike.mock";
import { station } from "../__mocks__/station.mock";
import { Station } from "../Station";
import { Van } from "../Van";

describe("Van", () => {
  let van: Van;
  let mockBike = bike();
  let mockBrokenBike = bike({ working: false });
  let station: Station;

  beforeEach(() => {
    van = new Van();
    station = new Station();
  });

  it("should take broken bikes from docking stations", () => {
    for (let index = 0; index < 3; index++) {
      station.dock(mockBike);
    }
    for (let index = 0; index < 5; index++) {
      station.dock(mockBrokenBike);
    }
    van.collectBroken(station);
    expect(station.bikes.length).toEqual(3);
    expect(van.storage.length).toEqual(5);
  });
});
