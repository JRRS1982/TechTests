module.exports = {
  roots: [
    "<rootDir>/src"
  ], // all TS should be in src file.
  testMatch: [
    "**/__tests__/**/*.+(ts|tsx|js)", "**/?(*.)+(spec|test).+(ts|tsx|js)"
  ], // find tests
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest",
  }, // tell jest to use ts-jest for ts/tsx files
};
