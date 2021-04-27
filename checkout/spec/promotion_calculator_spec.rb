# frozen_string_literal: true

require 'promotion'

RSpec.describe 'Promotion' do
  let(:checkout) { Checkout.new }
  let(:promotion) { Promotion.new }

  # testing state, dont like, need a more dynamic test to test behaviour.
  it 'has a default benefit when initialized with the checkout' do
    expect(checkout.benefit_given).to eq(0)
  end

  it 'has a default benefit when initialized with the checkout' do
    expect(checkout.benefit_given).to eq(0)
  end
end
