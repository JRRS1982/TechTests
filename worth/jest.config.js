/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  roots: [
    // all TS should be in src file.
    "<rootDir>/src",
  ],
  testEnvironment: "jsdom",
  testMatch: [
    // find tests
    "**/__tests__/**/*.+(ts|tsx|js)",
    "**/?(*.)+(spec|test).+(ts|tsx|js)",
  ],
  transform: {
    // tell jest to use ts-jest for ts/tsx files
    "^.+\\.(ts|tsx)$": "ts-jest",
  },
};