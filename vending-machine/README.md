# Project title

'Vending Machine' is a tech test provided to me by Cleo, as part of their
interview process.

## Motivation / Approach

This project was started to try at get a job at Cleo.

I approached the project with a planning mindset, although I could start coding
straight away and dynamically build the project as I go (with TDD), I thought
that it was probably a good idea to create some UML for this problem set as
from reading the user stories I am initially thinking that creating a class
diagram would help decide on attributes and variable. So I played around with
the question, a pencil and piece of paper.

The project will be test driven with RSpec, Ruby and coveralls or simplecov and
will be a command line applicaiton.

### Build status

As with all good code, i hope that this is closed to changes and open to
expansion. Currently the project is not complete.

### Screenshots / UML / Notes / Diagrams

I created UML class diagrams for the project, and am intending to include them
in an images file of the project at the root level.

### User Stories / Acceptance Criteria

COMPLETE:
As a vending machine owner,
I want to be able to restock my vending machine with goods for sale,
so that I can sell my stock to willing buyers.

> Given.. I have a product, which has at least a price,
>
> When.. I add it to the vending machine,
>
> Then.. It is stored in the stock attribute of the machine.

COMPLETE:
As a vending machine owner,
I want to be able to restock my vending machine with change,
so that the machine has coins available for distribution to buyer.

> Given.. I have a range of different value coins,
>
> When.. I add those coins to my machine,
>
> Then.. those coins are saved in the change variable of the machine.

COMPLETE:
As a vending machine owner,
I want the vending machine to keep track of the stock it contains,
so that I know what I need to restock it with.

> Given.. I my vending machine contains a number of products,
>
> When.. I use the print products method (or similar),
>
> Then.. A list of the products that the machine contains is printed.

COMPLETE:
As a vending machine owner,
I want the vending machine to keep track of the change it contains,
so that I know what coins I need to restock it with.

> Given.. my vending machine contains an number of coins,
>
> When.. I use the print coins method (or similar),
>
> Then.. I am provided a list of all the coins in the machine at that moment.

COMPLETE
As a vending machine owner,
I want the vending machine to allow the user to enter enough change, to buy a product from the machine.

> Given.. the vending machine has a product and the user has entered enough change to the machine
>
> When they select buy product and select a product that is in stock.
>
> Then the selected product is removed from the stock in the machine and the change the machine holds increases by the cost of the product and no more.

COMPLETE
As a vending machine owner,
I want the vending machine to ask the buyer for more money if they are short,
so that i dont provide goods to the buyer at below my set price.

> Given.. a buyer has entered the selection for a product,
>
> When.. the current deposit (or similar) attribute of the machine doesnt contain
sufficent value for the item,
>
> Then.. a message is returned to the buyer to enter the difference between the
current deposit value and the cost of the product they have selected.

As a vending machine owner,
I want the vending machine to return the correct amount of change to the buyer,
if they have entered too much cash for the selected item.

> Given.. a buyer enters x cash,
>
> When.. a buyer selcts an object which costs y,
>
> Then.. x - y = z and z is returned to the buyer in the form of coins.

> Given.. z (from above) is due to the buyer,
>
> When.. the coins are not availble either in part or whole,
>
> Then.. a lower denomination coins is issued to buyer.

> Given.. z (from above) is due to the buyer,
>
> When.. there is not enough change in the machine (in any combination),
>
> Then.. what is available is issued and a message is given the the buyer to
contact me for the residual (the machine owner).
'''

As a vending machine owner,
I want the buyer to be given the product after they have entered their selection
and paid enought for it,
so that there is valid exchange of goods for a fee.

> Given.. a buyer has entered enough for the product,
>
> When.. the product is available,
>
> Then.. return the product to the buyer and remove it from the machines inventory.

COMPLETE:
As a vending machine owner,
I want my machine to hold a range of different goods,
so that i can appeal to people of different tastes.

> Given.. i have added a number of different products to the inventory,
>
> When.. i print a list of the products in the machine,
>
> Then.. i see different items in the return.

COMPLETE:
As a vending machine owner,
I want my machine to hold 1p, 2p, 5p, 10p, 20p, 50p, £1 and £2 coins,
so that i can provide change to a range of different transactions.

> Given.. i have added a number of different coins to the machine for it to hold,
>
> When.. i print out a list of the change in the machine
>
> Then.. i see a list of the various denomination and the number of those coins.
'''

Above and beyond - for extension if completed.

As a vending machine owner,
I want my machine to return larger denomination coins before smaller coins,
so that i dont run out of small coins quickly.

> Given.. z (from an earlier AC - i.e. change due to buyer) is due to the buyer,
>
>When.. the machine decides which coins to return to the buyer in the change,
>
> Then.. the largest denominations are selected before smaller ones.
'''

## Objects

### Class: Vending machine
Attributes:
- change(hash of two int: coin => number of coins)
- products(hash of object and intiger: product_name => count)
- buyer_paid; a hash of coins that the buyer has added to the machine.

Methods:
- restock_products(two arguments; product(object) and count(intiger))
- restock_products(two arguments; product(object), count(intiger))
- restock_change(two arguments; coin_value(string) and count(intiger))
- print_products; return a formatted list of the products and the count of each.
- print_coins; return a formatted list of the coins and the count of each.
- buy(one argument that is a string of the product name and return varies by
returning an object and removing it from hash and managing coins.)
private methods:
- reset_buyer_paid; helper type to return buyer paid to zero.
- calculate_exchange(two arguments; buyer paid attribute and product price attribute); will be returning a request for more money to the user or returning change the the user.

### Class: Product

Attributes:
- name; a simple string for each product object.
- price; a simple intiger for the value of each.

Methods:
- none

### Problem solving - workings

The inputs will be entries to the terminal from the command line, probably a
number of methods on a class such as 'vending_machine.topup_change()'.

Returns from the methods will probably be printed to the terminal, or returned
within the program, updating attributes of the objects - I will probably have
a print method to show the change in the machine, or items currently in stock.

## Tech / framework used

VSCode was used as an editor;

* Ruby was used as the main language.
* RSpec used for testing.
* Simplecov is used for test coverage.

### Code style

Rubocop 0.65.0 was used for linting and stylying the Ruby code.

### Tests

A TDD process was used in the development of this project, please see the
attached spec files for details of the testing that was carried out.

## Installation / Running / How it works

Please find attached a gem file listing those gems for installation, use the
following to run the file from terminal:

- ruby vending_machine.rb

## API Use

No API used in this project.

## Reflection / further development

At the moment I have products, coins for buyer and vender and methods to restock
everything, plus the buy method to buy products if they are in stock. Have not
got great error handling so would develop on that, plus need to return coins to
buyer, which is the last real feature to complete.

## Credits / team members

No contributions are required at this time, as this is a tech test, however any
feedback is appreciated.

This was completed solo without the use of any tutorials, and was a lot of fun!
