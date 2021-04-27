# Class Structure

Class: Checkout

- attributes: basket - hold a number of item objects.
- attributes: promotional rules class is probably going to have to be passed to the checkout as an argument for calculation in the total. 
- method: scan - receives an argument of an item and adds it to the basket.
- method: total - calculates the price of the objects in the basket and returns the price after any promotion, probably hides some logic here.

Class: Promotion

- attributes: conditions - what the conditions of the promotion are.
- attributes: benefit - what the benefit of the promotion is.
- method: none that i can think of at the moment.

Class: Calculator

- attributes: takes argument of the promotion.
- attributes: takes argument of the basket.
- method: calculate - takes the promotion, applies it to the basket and returns total price of the basket.

Class: Item

- attributes: product code - id of the item.
- attributes: name - name of the item.
- attributes: price - price of the item.
- method: none that i can think of at the moment.