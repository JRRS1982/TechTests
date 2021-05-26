Setup (Javascript)

```
// create directory
mkdir <project-name>
cd <project-name>
mkdir -p src test

// git init
git init

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

// create a src directory and create a __test__ directory, add.test.js
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