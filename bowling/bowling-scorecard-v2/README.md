# Bowling Scorecard v2

This code has been written to solve the age old problem of 'what is my score',
in a game of ten pin bowling.

I started by creating the project file, then commenced by writing a feature
test, followed by unit tests inline with the acceptance criteria until the
feature test passes. At this stage I refactored to improve the quality of the
code creating the classes and methods as the code grew.

## Problem solving - workings

Inputs: will be integers entered into the command line by the user, after they
have started a game.

Outputs: will probably be a formatted table with the score on it, or maybe a
string giving the user prompts as to what the score is.

### User Stories / Acceptance Criteria

Found [here](./user_stories.md)

## Tech / framework used

* Ruby version 2.6.2
* RSpec

### Code style

Rubocop 0.65.0 was used for linting and stylying the Ruby code.

### Screenshots / UML / Notes / Diagrams

Should there be any images/notes, please find them in the images folder of the
project.

## Installation / How it works

Ensure you are running Ruby 2.6.2 as specified (you can use [RVM](https://rvm.io/)
to manage Ruby versions) and [Bundler](http://bundler.io/) installed. Then,
clone this repository, and install dependencies:

```
bundle install
```

Running the tests with RSpec:

```
rspec                                ## runs the entire test suite
rspec spec/file.rb                   ## runs a specific test file
```

## API's Used

No API's used in this project

## Reflection / further development

In reflection the coding started out well, frame 10 caused some issues initally
as it broke all tests and needed to be refactored, have now used inheritance
from the regular frame overwriting where necessary.

Currently I am aware the logic on ie. the spare bonus calculator is too large,
from this point on I have passed the AC so will only need to refactor to improve
the quality. I would probably pull some elements of the code logic into helpers
and reduce the number of lines and arguments which are repeated. I could make
it DRY'er, I could also probably rewrite a number of the tests which are not
tidy or well located. Simply a case of refactoring out the tests into better
context blocks with better names and making more helpers.

For further improvements I could host it online, with heroku, and make an
interface for users to interact with it or create an output in a table format
when the game ends.

I was forced to spike a few changes when refactoring so the scorecard file only
has 89% coverage at the moment, I could push for higher and better coverage with
more unit tests.

## Credits / team members

No contributions are required at this time, as this is a training exercise. The
project was started and completed solo without any tutorial use.
