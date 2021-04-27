require 'Game'
require 'pry'

describe 'features' do
  it 'keeps track of the correct frame at the start' do
    my_game = Game.new
    my_game.roll(1)
    expect(my_game.frame).to eq(1)
  end

  it 'increments the frame up' do
    my_game = Game.new
    my_game.roll(1)
    my_game.roll(3)
    my_game.roll(4)
    expect(my_game.frame).to eq(2)
  end
end
