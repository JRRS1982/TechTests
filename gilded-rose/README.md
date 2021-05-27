# Gilded Rose

This is an implementation of the Gilded Rose Tech Test, carried out in Typescript, Jest, Node, Concurrently and Nodemon.

See the [instructions](INSTRUCTIONS.MD) for acceptance criteria.

See the [original git repo for the kata](https://github.com/emilybache/GildedRose-Refactoring-Kata)

## Installation 

1. `npm install` - install packages
1. `npm start` - startup program with concurrently to watch and compile changes that happen in the src directory.
1. `npm test` - run test suite

## Learning

- I found this surprisingly easy, i am wondering if i have done something wrong and missed some edge cases!?
- Enjoyed putting the test suite together, feel like that was most of the problem set.
- Enjoyed setting up the project and breaking out the separate cases, was a case of getting a good test suite, then deleting all code...

## Future development

- [ ] AC stated we should not change the Item class, but feels like that is the logical step
    - [ ] Make items that implement their own updateQuality function
    - [ ] Loop over each item in the shop and call that function.
- [ ] Write more tests with the original if block hell, feel like this was too easy.
