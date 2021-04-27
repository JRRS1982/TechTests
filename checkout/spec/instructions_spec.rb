# frozen_string_literal: true

require 'checkout'

RSpec.describe 'INSTRUCTIONS FEATURES: ' do
  let(:chair) { Item.new(product_code: '001', name: 'Very Cheap Chair', price: 925) }
  let(:table) { Item.new(product_code: '002', name: 'Little table', price: 4500) }
  let(:light) { Item.new(product_code: '003', name: 'Little table', price: 1995) }

  let(:promotion1) do
    Promotion.new(
      price_over: 60,
      basket_discount: 10
    )
  end
  let(:checkout1) { Checkout.new(promotion1) }

  let(:promotion2) do
    Promotion.new(
      product_code: '001',
      product_quantity: 2,
      new_price: 850
    )
  end
  let(:checkout2) { Checkout.new(promotion2) }

  let(:promotion3) do
    Promotion.new(
      product_code: '001',
      product_quantity: 2,
      new_price: 850,
      price_over: 60,
      basket_discount: 10
    )
  end
  let(:checkout3) { Checkout.new(promotion3) }

  it 'TEST CASE ONE - over £60' do
    checkout1.scan(chair)
    checkout1.scan(table)
    checkout1.scan(light)
    expect { checkout1.total }.to output("Basket: 001, 002, 003\nTotal price expected: £66.78\n").to_stdout
  end

  it 'TEST CASE TWO - drop chair price' do
    checkout2.scan(chair)
    checkout2.scan(light)
    checkout2.scan(chair)
    expect { checkout2.total }.to output("Basket: 001, 003, 001\nTotal price expected: £36.95\n").to_stdout
  end

  it 'TEST CASE THREE - multi conditions' do
    checkout3.scan(chair)
    checkout3.scan(table)
    checkout3.scan(chair)
    checkout3.scan(light)
    expect { checkout3.total }.to output("Basket: 001, 002, 001, 003\nTotal price expected: £73.76\n").to_stdout
  end
end
