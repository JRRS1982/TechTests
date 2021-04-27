require_relative '../lib/fizzbuzz'


describe 'fizzbuzz' do
  it 'does it return fizz if multiple of three' do
    expect(fizzbuzz(3)).to eq 'fizz'
  end
end

describe 'fizzbuzz' do
  it 'does it return fizz if multiple of five' do
    expect(fizzbuzz(5)).to eq 'buzz'
  end
end

describe 'fizzbuzz' do
  it 'if passed 6, return fizz as 6 is multiple of 3' do
    expect(fizzbuzz(6)).to eq 'fizz'
  end
end

describe 'fizzbuzz' do
  it 'if passed 10, return buzz as 10 is multiple of 5' do
    expect(fizzbuzz(10)).to eq 'buzz'
  end
end

describe 'fizzbuzz' do
  it 'if passed number not multiple of 3 or 5' do
    expect(fizzbuzz(4)).to eq 4
  end
end

describe 'fizzbuzz' do
  it 'if passed number not multiple of 3 or 5' do
    expect(fizzbuzz(4)).to eq 4
  end
end

describe 'fizzbuzz' do
  it 'if passed multiple of 3 and 5 then return fizzbuzz' do
    expect(fizzbuzz(15)).to eq 'fizzbuzz'
  end
end