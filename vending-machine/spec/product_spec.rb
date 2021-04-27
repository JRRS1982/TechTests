# not a great test as checking on state, but feel like a test is needed at the unit level. 
require 'Product'

  
describe 'Product' do
  it 'has name and price attributes' do
    
    product = Product.new(product_name: 'Blueberry Muffin', product_price: 250)
    expect(product).to have_attributes(:name => 'Blueberry Muffin', :price => 250)
  end
end