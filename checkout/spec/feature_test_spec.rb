# frozen_string_literal: true

require 'checkout'
require 'pry'

RSpec.describe 'CHECKOUT FEATURES: ' do
  let(:checkout1) { Checkout.new }

  let(:promotion) do
    Promotion.new(
      price_over: 60,
      basket_discount: 10
    )
  end

  let(:checkout2) { Checkout.new(promotion) }

  let(:table60) do
    Item.new(
      product_code: '002',
      name: 'Little table',
      price: 6000
    )
  end

  let(:table) do
    Item.new(
      product_code: '002',
      name: 'Little table',
      price: 4500
    )
  end
  let(:light) do
    Item.new(
      product_code: '003',
      name: 'Funky Light',
      price: 1995
    )
  end

  context '#total' do
    it 'std out receieves the basket with one product code' do
      checkout1.scan(table)
      expect { checkout1.total }.to output("Basket: 002\nTotal price expected: £45.00\n").to_stdout
    end

    it 'std_out receives the total price expected of several items' do
      checkout1.scan(table)
      checkout1.scan(light)
      checkout1.scan(table)
      expect { checkout1.total }.to output("Basket: 002, 003, 002\nTotal price expected: £109.95\n").to_stdout
    end
  end

  context '#promotion' do
    context '#ten_percent_over_60' do
      it 'provides the correct reduction to the price of a basket via total method' do
        checkout2.scan(table)
        checkout2.scan(table)
        expect { checkout2.total }.to output("Basket: 002, 002\nTotal price expected: £81.00\n").to_stdout
      end

      it 'no discount if outside qualifying criteria' do
        checkout2.scan(table)
        expect { checkout2.total }.to output("Basket: 002\nTotal price expected: £45.00\n").to_stdout
      end

      it 'discount if matches qualifying criteria' do
        checkout2.scan(table60)
        expect { checkout2.total }.to output("Basket: 002\nTotal price expected: £54.00\n").to_stdout
      end
    end
  end
end
