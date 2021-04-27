# frozen_string_literal: true

require 'item.rb'

RSpec.describe 'Item' do
  let(:item1) { Item.new(product_code: 0o02, price: 0, name: 'name1') }

  it 'has a product code' do
    expect(item1.product_code).to eq(0o02)
  end
end
