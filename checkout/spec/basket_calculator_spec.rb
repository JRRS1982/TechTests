# frozen_string_literal: true

RSpec.describe 'BasketCalcalator' do
  let(:checkout) { Checkout.new }
  let(:table) { Item.new(product_code: '002', name: 'Little table', price: 4500) }

  context '#price_of_basket' do
    it 'has a default price of zero' do
      expect(checkout.price_of_basket([])).to eq(0)
    end

    it 'can calculate price of one item in the basket' do
      expect(checkout.price_of_basket([table])).to eq(4500)
    end

    it 'can calculate price of two items in the basket' do
      expect(checkout.price_of_basket([table, table])).to eq(9000)
    end
  end
end
