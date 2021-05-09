TDD Steps

If steps 2 to 4 takes more than 15mins make the problem you are trying to solve smaller.

1. Define the problem - read the question thoroughly. 
2. Plan a solution - maybe diagram a solution.
3. Write a test for the expected behavior. 
4. Write simplest solution to that expectation.
5. Refactor. 
6. Commit.

---

Examples: nb these steps are about behavior, not what we think the code will do / its functions.

"I expect the table to be four feet in diameter"
- test fails as i have no table
I cut a piece of wood that is four fee in diameter
- The test passes

"I expect the table to be three feet high"
- test fails as it is on the ground
I add one leg in the middle of the table
- The test passes

"I expect the table to hold 20lb of weight"
- test fails as there is only one leg
I add several legs 
- The test passes

---

Project Setup (Javascript)

```
// create directory
mkdir <project-name>
// create package.json file
npm init -y
// install jest
npm install --save-dev jest
// install babel to compile your code
npm install --save-dev @babel/core
npm install --save-dev @babel/preset-env
npm install --save-dev @babel/cli
// create a config for babel
touch .babelrc
{
  "presets": ["@babel/preset-env"]
}
// create a test file add.test.js and add to a src directory (and crate a build dir)
import add from '../src/add';

describe('add', function () {
  it('should return addition of two numbers', () => {
    expect(add(1,1)).toBe(2);
  });
});

// create your code file add.js
const add = (a,b) => a+b;

export default add;
```