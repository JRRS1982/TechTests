# frozen_string_literal: true

class Item
  attr_reader :product_code, :price, :name

  def initialize(product_code:, price:, name:)
    @product_code = product_code
    @price = price
    @name = name
  end
end
