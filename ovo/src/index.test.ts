import { app } from "./index";

describe("take", () => {
  it("should return first two elements from array", () => {
    const list = ["apple", "pear", "lemon", "orange"];
    let result = app(list, 2);
    expect(result).toEqual(["apple", "pear"]);
  });

  it("should loop through list for the count", () => {
    const list = ["apple", "pear", "lemon", "orange"];
    let result = app(list, 10);
    expect(result).toEqual(["apple", "pear", "lemon", "orange", "apple", "pear", "lemon", "orange", "apple", "pear"]);
  });
});
