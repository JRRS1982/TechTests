module.exports = {
  roots: [
    "<rootDir>/src" // all ts should be in src file
  ],
  testMatch: [
    "**/__tests__/**/*.+(ts|tsx|js)", "**/?(*.)+(spec|test).+(ts|tsx|js)" // find test files
  ],
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest", // tell test to use ts-jest for ts/tsx files
  },
  testEnvironment: 'node',
};