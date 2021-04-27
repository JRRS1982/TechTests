# vending machine is a container for the products and change, could probably
# encapsulate better with a seperate calculator perhaps or extract the change.
class VendingMachine
  attr_accessor :change, :products, :buyer_paid

  def initialize
    @products = []
    @change = { '1p' => 0, '2p' => 0, '5p' => 0, '10p' => 0, '20p' => 0, '50p' => 0, '£1' => 0, '£2' => 0 }
    @buyer_paid = { '£2' => 0, '£1' => 0, '50p' => 0, '20p' => 0, '10p' => 0, '5p' => 0, '2p' => 0, '1p' => 0 }
  end

  def buy(product_to_find)
    if products.empty?
      puts "Sorry we have no #{product_to_find} left"
    else
      @products.each_with_index do |x, index|
        if x.name == product_to_find && paid_enough(buyer_paid, x.price) == true
          take_payment(x.price)
          puts "Here's your #{product_to_find}"
          @products.delete_at(index)
          return_change
          break
        elsif x.name == product_to_find && paid_enough(buyer_paid, x.price) == false
          puts "You havn't paid enough for #{x} yet, its price is #{x.price} please enter more"
        elsif products.length == index + 1
          puts "Sorry we have no #{product_to_find} left"
        end
      end
    end
  end

  def take_payment(price)
    price_outstanding = price
    buyer_paid.each do |key, value|
      while price_outstanding >= string_to_value(key) && value > 0
        price_outstanding -= string_to_value(key)
# need to error handle this so that coin count doesnt drop below zero.
        @buyer_paid[key] -= 1
        @change[key] += 1
      end
    end
  end

  def return_change
    puts "and your change.."
    print_coins_header
    buyer_paid.each do |key, value|
      next if value == 0
      puts "#{key} || #{value}\n"
    end
  end

# thinking about making this private.
  def paid_enough(hash, price)
    temp_paid = cash_converters(hash)
    if temp_paid >= price then true else false end
  end

# thinking about making this private
  def cash_converters(hash)
    return_temp_value = 0
    hash.each do |key, value|
      if value > 0
        temp_value = string_to_value(key)
        return_temp_value += (temp_value *= value)
      end
    end
    return return_temp_value
  end

  def pay(coin_name: "coin_default", coin_count: 0)
    @buyer_paid.each do |key, value|
      if coin_name == key
        @buyer_paid[key] += coin_count
      end
    end
  end

  def restock_change(coin_name: "coin_default", coin_count: 0)
    @change.each do |key, value|
      if coin_name == key
        @change[key] += coin_count
      end
    end
  end

# thinking about making this private.
  def string_to_value(string)
    case string
    when '1p'
      1
    when '2p'
      2
    when '5p'
      5
    when '10p'
      10
    when '20p'
      20
    when '50p'
      50
    when '£1'
      100
    when '£2'
      200
    end
  end

  def restock_products(product: Product.new(product_name: 'default_name', product_price: 50), product_count: 0)
    product_count.times do
      @products << product
    end
  end

  def print_coins
    print_coins_header
    @change.each do |key, value|
      next if value == 0
      puts "#{key} || #{value}\n"
    end
  end

  # thinking about making this private.
  def unique_products
    @products.uniq
  end

  def print_products
    product_header
    z = unique_products
    z.each do |x|
      number_of_products = product_count(x)
      puts "#{x.name} || #{number_of_products}"
    end
  end

  # thinking about making this private.
  def product_count(product_to_find)
    product_count_helper = 0
    @products.each do |z|
      if z.name == product_to_find.name
        product_count_helper += 1
      end
    end
    product_count_helper
  end

  private

  def product_header
    puts "product type || count"
  end

  def print_coins_header
    puts "coin's value || count"
  end
end
