require 'vending_machine'
require 'product'
require 'pry'

describe 'FEATURES' do
  subject { VendingMachine.new }

  let(:mint_aero_double) { double :Product, :name => 'Mint Aero', :price => 57 }

  let(:kit_kat_double) { double :Product, :name => 'Kitkat Chunky', :price => 50 }

  it 'prints the coins that held with a header' do
    expect(STDOUT).to receive(:puts).with("coin's value || count")
    expect(STDOUT).to receive(:puts).with("£1 || 5\n")
    subject.restock_change(coin_name: '£1', coin_count: 5)
    subject.print_coins
  end

  it 'prints the products that are held with a header' do
    expect(STDOUT).to receive(:puts).with('product type || count')
    expect(STDOUT).to receive(:puts).with('Mint Aero || 5')
    subject.restock_products(product: mint_aero_double, product_count: 5)
    subject.print_products
  end

  it 'given an array of coins it can convert it to decimal' do
    subject.restock_change(coin_name: '1p', coin_count: 3)
    subject.restock_change(coin_name: '£1', coin_count: 2)
    subject.restock_change(coin_name: '20p', coin_count: 4)
    expect(subject.cash_converters(subject.change)).to eq(283)
  end

  it 'keeps track of what the buyer has entered to the machine' do
    subject.pay(coin_name: '1p', coin_count: 1)
    expect(subject.cash_converters(subject.buyer_paid)).to eq(1)
  end

  it 'BUY PRODUCT WITH CHANGE BUYER PAID' do
    expect(STDOUT).to receive(:puts).with("Here's your Mint Aero")
    expect(STDOUT).to receive(:puts).with('and your change..')
    subject.restock_products(product: mint_aero_double, product_count: 5)
    subject.restock_change(coin_name: '1p', coin_count: 7)
    subject.restock_change(coin_name: '2p', coin_count: 7)
    subject.restock_change(coin_name: '5p', coin_count: 7)
    subject.restock_change(coin_name: '50p', coin_count: 7)
    subject.pay(coin_name: '50p', coin_count: 1)
    subject.pay(coin_name: '5p', coin_count: 1)
    subject.pay(coin_name: '2p', coin_count: 4)
    subject.buy('Mint Aero')
  end
end
