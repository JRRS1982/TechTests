require './lib/vending_machine'
require './lib/product'
require 'pry'

describe 'VendingMachine' do
  subject { VendingMachine.new }

  let(:mint_aero_double) { double :Product, 
                                  :name => 'Mint Aero',
                                  :price => 57 }

  let(:kit_kat_double) { double :Product, 
                                :name => 'Kitkat Chunky',
                                :price => 50 }

  context '.restock_change' do
    it 'allows restock change method' do
      expect(subject).to respond_to(:restock_change)
    end

    it 'can restock 1p coins' do
      subject.restock_change(coin_name: '1p', coin_count: 5)
      expect(subject.change['1p']).to eq(5)
    end
  end

  context '.print_coins' do
    it 'allows the print coins method' do
      expect(subject).to respond_to(:print_coins)
    end

    it 'prints out what coins are in the machine' do
      subject.restock_change(coin_name: '£1', coin_count: 5)
      expect(subject.change['£1']).to eq(5)
    end

    it 'the coin statement has a heading' do
      expect(STDOUT).to receive(:puts).with("coin's value || count")
      expect(STDOUT).to receive(:puts).with("£1 || 5\n")
      subject.restock_change(coin_name: '£1', coin_count: 5)
      subject.print_coins
    end
  end

  context '.restock_products' do
    it 'allows the restock products method' do
      expect(subject).to respond_to(:restock_products)
    end

    it 'can restock products' do
      subject.restock_products(product: Product.new(product_name: 'Kitkat Chunky', product_price: 50), product_count: 3)
      expect(subject.products.length).to eq(3)
    end

    it 'can restock different products' do
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.restock_products(product: mint_aero_double, product_count: 2)
      expect(subject.products.length).to eq(5)
    end
  end

  context '.product_count' do
    it 'can count number of a specific product' do
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.restock_products(product: mint_aero_double, product_count: 2)
      expect(subject.product_count(kit_kat_double)).to eq(3)
    end

    it 'can count number of a different product' do
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.restock_products(product: mint_aero_double, product_count: 2)
      expect(subject.product_count(mint_aero_double)).to eq(2)
    end
  end

  context '.print_products' do
    it 'prints products ' do
      expect(subject).to respond_to(:print_products)
    end

    it 'prints out what products are in the machine' do
      expect(STDOUT).to receive(:puts).with("product type || count")
      expect(STDOUT).to receive(:puts).with("Kitkat Chunky || 3")
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.print_products
    end

    it 'prints out what products are in the machine - multiple' do
      expect(STDOUT).to receive(:puts).with("product type || count")
      expect(STDOUT).to receive(:puts).with("Kitkat Chunky || 3")
      expect(STDOUT).to receive(:puts).with("Mint Aero || 2")
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.restock_products(product: mint_aero_double, product_count: 2)
      subject.print_products
    end
  end

  context '.cash_converts' do
    it 'given an array of coins it can convert it to decimal' do
      subject.restock_change(coin_name: '1p', coin_count: 3)
      expect(subject.cash_converters(subject.change)).to eq(3)
    end

    it 'given a different array of coins it can convert it to decimal' do
      subject.restock_change(coin_name: '1p', coin_count: 5)
      expect(subject.cash_converters(subject.change)).to eq(5)
    end

    it 'given a different array of all the coins it can convert to decimal' do
      subject.restock_change(coin_name: '1p', coin_count: 1)
      subject.restock_change(coin_name: '2p', coin_count: 1)
      subject.restock_change(coin_name: '5p', coin_count: 1)
      subject.restock_change(coin_name: '10p', coin_count: 1)
      subject.restock_change(coin_name: '20p', coin_count: 1)
      subject.restock_change(coin_name: '50p', coin_count: 1)
      subject.restock_change(coin_name: '£1', coin_count: 1)
      subject.restock_change(coin_name: '£2', coin_count: 1)
      expect(subject.cash_converters(subject.change)).to eq(388)
    end
  end

  context '.pay' do
    it 'has a pay method' do
      expect(subject).to respond_to(:pay)
    end

    it 'keeps track of what the buyer has entered to the machine' do
      subject.pay(coin_name: '1p', coin_count: 1)
      expect(subject.buyer_paid['1p']).to eq(1)
    end

    it 'given a different array of all the coins it can convert to decimal' do
      subject.pay(coin_name: '1p', coin_count: 1)
      subject.pay(coin_name: '2p', coin_count: 1)
      subject.pay(coin_name: '5p', coin_count: 1)
      subject.pay(coin_name: '10p', coin_count: 1)
      subject.pay(coin_name: '20p', coin_count: 1)
      subject.pay(coin_name: '50p', coin_count: 1)
      subject.pay(coin_name: '£1', coin_count: 1)
      subject.pay(coin_name: '£2', coin_count: 1)
      expect(subject.cash_converters(subject.buyer_paid)).to eq(388)
    end
  end

  context '.buy' do
    it 'has a buy method' do
      expect(subject).to respond_to(:buy)
    end

    it 'doesnt prints out the product message if any product unavailable' do
      expect(STDOUT).to receive(:puts).with('Sorry we have no Mint Aero left')
      subject.buy('Mint Aero')
    end

    it 'doesnt prints out the product message if this product is navailable' do
      expect(STDOUT).to receive(:puts).with('Sorry we have no Mint Aero left')
      subject.restock_products(product: kit_kat_double, product_count: 2)
      subject.buy('Mint Aero')
    end
  end

  context '.paid_enough' do
    it 'takes in a hash and a price and returns false if not paid enough' do
      expect(subject.paid_enough(subject.buyer_paid, kit_kat_double.price)).to be(false)
    end

    it 'takes in a hash and a price and returns true if paid enough' do
      subject.pay(coin_name: '£1', coin_count: 2)
      expect(subject.paid_enough(subject.buyer_paid, kit_kat_double.price)).to be(true)
    end
  end

  context '.take_payment' do
    it 'takes cost of the product away from the buyer paid hash' do
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.pay(coin_name: '20p', coin_count: 1)
      subject.pay(coin_name: '50p', coin_count: 1)
      subject.buy('Kitkat Chunky')
      expect(subject.cash_converters(subject.buyer_paid)).to eq(20)
    end

    it 'alternate takes cost of the product away from the buyer paid hash' do
      subject.restock_products(product: kit_kat_double, product_count: 3)
      subject.pay(coin_name: '10p', coin_count: 7)
      subject.pay(coin_name: '£1', coin_count: 1)
      subject.buy('Kitkat Chunky')
      expect(subject.cash_converters(subject.buyer_paid)).to eq(120)
    end
  end
end
