# frozen_string_literal: true

require_relative 'basket_calculator'
require_relative 'promotion_calculator'
require_relative 'promotion'
require_relative 'item'
require 'pry'

class Checkout
  include BasketCalculator
  include PromotionCalculator
  attr_reader :basket, :promotion

  def initialize(promotion = Promotion.new)
    @promotion = promotion
    @basket = []
  end

  def scan(item)
    @basket.push(item)
  end

  def total(basket = @basket)
    # calculate benefit from a promotion
    benefit = benefit_given
    #  print out the shopping basket
    list_items(basket)
    # pass basket and benefit to module to calculate and print the price
    calculate_price(basket, benefit)
  end
end
