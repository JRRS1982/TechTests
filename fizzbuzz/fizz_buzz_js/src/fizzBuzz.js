var FizzBuzz = function(){};

FizzBuzz.prototype._isDivisibleBy = function(number, divider) {
  return (number % divider === 0)
};

FizzBuzz.prototype._isDivisibleByFifteen = function(number) {
  return this._isDivisibleBy(number, 15)
};

FizzBuzz.prototype.saysFizzOrBuzz = function (number) {
  if (this._isDivisibleByFifteen(number)) {
    return "FizzBuzz";
  };
  if (this._isDivisibleBy(number, 3)) {
    return "Fizz";
  };
  if (this._isDivisibleBy(number, 5)) { 
    return "Buzz";
  };
  return number;
};

FizzBuzz.prototype.saysFizzOrBuzzUpToNumber = function (number) {
  for (i=1; i<=number; i++) {
    if (this._isDivisibleByFifteen(i)) {
      console.log("FizzBuzz")
    } else if (this._isDivisibleBy(i, 3)) {
      console.log("Fizz")
    } else if (this._isDivisibleBy(i, 5)) {
      console.log("Buzz")
    } else { 
      console.log(i)
    };
  };
};
