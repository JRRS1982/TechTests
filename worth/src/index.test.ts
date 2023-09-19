import { kataOne, kataThree, kataTwo } from "./index";

describe("index", () => {
  describe("kataOne", () => {
    it("should pass test case one", () => {
      const result = kataOne(10);
      expect(result).toEqual(23);
    });
  });

  describe("kataTwo", () => {
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

  describe("kataThree", () => {
    it("should handle base case", () => {
      const result = kataThree("# header");
      expect(result).toEqual("<h1>header</h1>");
    });
    it("should handle test two", () => {
      const result = kataThree("## smaller header");
      expect(result).toEqual("<h2>smaller header</h2>");
    });
    it("should handle test three", () => {
      const result = kataThree("##Invalid");
      expect(result).toEqual("##Invalid");
    });
    it("should handle test four", () => {
      const result = kataThree("####### Snow White and the Seven Hashtags");
      expect(result).toEqual("####### Snow White and the Seven Hashtags");
    });
    it("should handle test five", () => {
      const result = kataThree("<h0> #### Space Jam</h0>");
      expect(result).toEqual("<h4>Space Jam</h4>");
    });
    it("should handle test six", () => {
      const result = kataThree("  #### Space Jam</h0>");
      expect(result).toEqual("<h4>Space Jam</h4>");
    });
    it("should handle test seven", () => {
      const result = kataThree("<h2>         ## Lost In Space      </h2>");
      expect(result).toEqual("<h2>Lost In Space</h2>");
    });
    it("should handle test 8", () => {
      const result = kataThree(
        "<h2>         ##       Lost In Space      </h2>"
      );
      expect(result).toEqual("<h2>Lost In Space</h2>");
    });
    it("should handle test 9", () => {
      const result = kataThree("### ### Double Triple Header");
      expect(result).toEqual("<h3>### Double Triple Header</h3>");
    });
  });
});
