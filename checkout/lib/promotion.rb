# frozen_string_literal: true

# this is the promotion object that is going to be passed into the checkout.
class Promotion
  attr_reader :price_over, :basket_discount, :product_code,
              :product_quantity, :new_price

  # love this which comes from sandi metz, simply initializing with named
  # arguments, and setting a default of zero.

  def initialize(**opts)
    @price_over = opts[:price_over] || 0
    @basket_discount = opts[:basket_discount] || 0
    @product_code = opts[:product_code] || 0
    @product_quantity = opts[:product_quantity] || 0
    @new_price = opts[:new_price] || 0
  end
end
