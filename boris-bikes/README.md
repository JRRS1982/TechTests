# Boris Bikes

This is a representation of the santander cycles which are available across london from docking stations.

## Installing / Getting started

This tech test has no frontend and is operated from the command line:

```shell
npm install # install packages
npm start # if you need to compile the typescript
npm test # run jest tests
```

### Initial Configuration

There are no tokens or initial config setup required.

## Developing

In order to start developing the project further:

```shell
git clone https://github.com/JRRS1982/TechTests.git
cd TechTests/boris-bikes
npm install
```

## Features / Learning

What's all the bells and whistles this project can perform?

- Garage and Station are similar objects, so `collection` became a function which we could call on both - to collect either working bikes (which became `vehicles`) from a garage or broken bikes from a docking station.
- Van is agnostic and can `collect` from Garage or Station - it doesn't care if the bike / scooter or other `vehicle` is working or not, it just needs to pick something up and take it somewhere - then release it. I mulled over the wording `dock` as give / provide may be better, but decided to stick with dock given its included in the AC.
- Mocks to keep some separation - but they could be better.
- I went beyond the acceptance criteria to add a scooter class to demonstrate how we should not really care about it being a `bike` but only that its working / can be reported as broken, which applies to a scooter and also the van class. So they have a common interface.

## Contributing

Feel free to star, use (with due credits), put in a PR for any improvements and reach out with any comments.

## Licensing

"The code in this project is licensed under MIT license."
