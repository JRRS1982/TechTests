import { bike } from "../__mocks__/bike.mock";
import { Person } from "../Person";

describe("Person", () => {
  let mockBike = bike();
  let person: Person;

  beforeEach(() => {
    person = new Person();
  });

  it("should be able to report a bike as broken", () => {
    expect(person.reportBroken(mockBike)).resolves;
  });
});