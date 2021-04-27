# frozen_string_literal: true

require 'checkout'
require 'pry'

RSpec.describe 'Checkout' do
  let(:item1) { Item.new(product_code: '000', price: 0, name: 'name1') }
  let(:checkout1) { Checkout.new }
  let(:table) { Item.new(product_code: '002', name: 'Little table', price: 4500) }

  context '#scan' do
    it 'saves scanned items to a basket' do
      checkout1.scan(item1)
      expect(checkout1.basket.length).to eq(1)
    end

    it 'saves multiple items to a basket' do
      checkout1.scan(item1)
      expect(checkout1.basket.length).to eq(1)
      checkout1.scan(table)
      expect(checkout1.basket.length).to eq(2)
      expect(checkout1.basket[1].name).to eq('Little table')
    end
  end

  context '#total' do
    it 'prints out the product code of an item in the basket' do
      checkout1.scan(item1)
      expect { checkout1.total }.to output("Basket: 000\nTotal price expected: £0.00\n").to_stdout
    end

    it 'the output can handle an empty basket' do
      expect { checkout1.total }.to output("Basket: Nothing!\nTotal price expected: £0.00\n").to_stdout
    end

    it 'the output can handle a different item in the basket' do
      checkout1.scan(table)
      expect { checkout1.total }.to output("Basket: 002\nTotal price expected: £45.00\n").to_stdout
    end

    it 'correctly adds a space between basket items' do
      checkout1.scan(table)
      checkout1.scan(table)
      expect { checkout1.total }.to output("Basket: 002, 002\nTotal price expected: £90.00\n").to_stdout
    end
  end
end
