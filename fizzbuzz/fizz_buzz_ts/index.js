var divBy3;
var divBy5;
var i;
var output;
for (i = 1; i <= 100; i += 1) {
    output = '';
    divBy3 = !(i % 3);
    divBy5 = !(i % 5);
    if (divBy3)
        output += 'Fizz';
    if (divBy5)
        output += 'Buzz';
    // Converts to a string because output is defined as such
    if (!(divBy3 || divBy5))
        output = i.toString();
    console.log(output);
}
