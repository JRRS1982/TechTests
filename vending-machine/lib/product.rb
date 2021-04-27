# The product represents an item in the vending machine
class Product
  attr_reader :name, :price

  def initialize(product_name:, product_price:)
    @name = product_name
    @price = product_price
  end
end
