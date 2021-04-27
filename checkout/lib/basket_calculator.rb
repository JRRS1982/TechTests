# frozen_string_literal: true

# this is the calculator that tallies up details of the basket object.
module BasketCalculator
  def list_items(basket)
    if basket.empty?
      puts 'Basket: Nothing!'
    elsif basket.length >= 1
      print 'Basket: '
      print basket[0].product_code
      basket.drop(1).select.map do |x|
        print ", #{x.product_code}"
      end
      puts ''
    end
  end

  def price_of_basket(basket)
    basket.map(&:price).compact.sum
  end

  def calculate_price(basket, benefit)
    total = 0
    if basket.empty?
      puts 'Total price expected: £0.00'
    elsif basket.length == 1
      total += basket[0].price
      total -= benefit
      currency = number_to_currency(total)
      puts "Total price expected: #{currency}"
    else
      total = 0
      basket.each do |x|
        total += x.price.to_i
      end
      total -= benefit
      currency = number_to_currency(total)
      puts "Total price expected: #{currency}"
    end
  end

  private

  def number_to_currency(number)
    decimaled = (number.to_f / 100)
    output = format('£%3.2f', decimaled)
    output
  end
end
