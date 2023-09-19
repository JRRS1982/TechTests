import { kataOne, kataTwo } from "./index";

describe("index", () => {
  xit("should pass test case one", () => {
    const result = kataOne(10);
    expect(result).toEqual(23);
  });

  it("should handle an empty input", () => {
    const result = kataTwo("");
    expect(result).toEqual([]);
  });
  it("should pass test case one", () => {
    const result = kataTwo(".");
    expect(result).toEqual(["E"]);
  });
  it("should pass test case two", () => {
    const result = kataTwo("-");
    expect(result).toEqual(["T"]);
  });
  it("should pass test case three", () => {
    const result = kataTwo("--");
    expect(result).toEqual(["M"]);
  });
  it("should pass test case four", () => {
    const result = kataTwo(".-");
    expect(result).toEqual(["A"]);
  });
  it("should handle options", () => {
    const result = kataTwo("?");
    expect(result).toEqual(["E", "T"]);
  });
  it("should handle options variant one", () => {
    const result = kataTwo(".?");
    expect(result).toEqual(["I", "A"]);
  });
  it("should handle options variant two", () => {
    const result = kataTwo("?-?");
    expect(result).toEqual(["R", "W", "G", "O"]);
  });
});
