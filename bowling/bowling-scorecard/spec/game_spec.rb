require 'Game'
require 'pry'

describe 'Game' do
  context '.roll' do
    it 'increments the score when pins are knocked down' do
      my_game = Game.new
      my_game.roll(1)
      expect(my_game.score).to eq(1)
    end
  end

  context '.frame' do
    it 'up when a ten is rolled' do
      my_game = Game.new
      my_game.roll(10)
      expect(my_game.frame).to eq(2)
    end

    it 'up after two balls' do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(7)
      expect(my_game.frame).to eq(2)
    end
  end

  context '.over?' do
    it '20 gutter balls' do
      my_game = Game.new
      20.times { my_game.roll(0) }
      expect(my_game.over?).to be(true)
    end

    it 'not at the start' do
      my_game = Game.new
      expect(my_game.over?).to be(false)
    end
  end

  context '.a_strike?' do
    it 'strike is' do
      my_game = Game.new
      my_game.roll(10)
      expect(my_game.a_strike?(my_game.score_array[0])).to be(true)
    end

    it "strike isn't" do
      my_game = Game.new
      my_game.roll(4)
      expect(my_game.a_strike?(my_game.score_array[0])).to be(false)
    end
  end

  context '.a_spare?' do
    it 'spare is' do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(7)
      expect(my_game.a_spare?(my_game.score_array[0])).to be(true)
    end

    it "spare isn't" do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(2)
      expect(my_game.a_spare?(my_game.score_array[0])).to be(false)
    end
  end

  context '.spare_bonus' do
    it 'spares' do
      my_game = Game.new
      my_game.roll(2)
      my_game.roll(8)
      my_game.roll(5)
      expect(my_game.score).to be(20)
    end

    it 'different spare' do
      my_game = Game.new
      my_game.roll(2)
      my_game.roll(8)
      my_game.roll(3)
      expect(my_game.score).to be(16)
    end

    it 'a different frame' do
      my_game = Game.new
      4.times { my_game.roll(1) }
      my_game.roll(2)
      my_game.roll(8)
      my_game.roll(5)
      expect(my_game.score).to eq(24)
    end
  end

  context '.strike_bonus' do
    it 'a strike' do
      my_game = Game.new
      my_game.roll(10)
      my_game.roll(2)
      my_game.roll(3)
      my_game.roll(1)
      expect(my_game.score).to eq(21)
    end

    it 'double strike' do
      my_game = Game.new
      my_game.roll(10)
      my_game.roll(10)
      16.times { my_game.roll(0) }
      expect(my_game.score).to eq(30)
    end

    it 'triple strike' do
      my_game = Game.new
      my_game.roll(10)
      my_game.roll(10)
      my_game.roll(10)
      14.times { my_game.roll(0) }
      expect(my_game.score).to eq(60)
    end

    it 'variable strike 1' do
      my_game = Game.new
      my_game.roll(2)
      my_game.roll(1)
      my_game.roll(10)
      my_game.roll(5)
      my_game.roll(4)
      14.times { my_game.roll(0) }
      expect(my_game.score).to eq(31)
    end

    it 'variable strike 2' do
      my_game = Game.new
      my_game.roll(2)
      my_game.roll(0)
      my_game.roll(10)
      my_game.roll(10)
      14.times { my_game.roll(0) }
      expect(my_game.score).to eq(32)
    end
  end

  context '.score' do
    it 'zero score' do
      my_game = Game.new
      20.times { my_game.roll(0) }
      expect(my_game.score).to eq(0)
    end

    it '1 each time' do
      my_game = Game.new
      20.times { my_game.roll(1) }
      expect(my_game.score).to eq(20)
    end
  end

  context '.statement' do
    it 'prints out a heading' do
      my_game = Game.new
      expect(my_game.statement).to include('Frame || Roll 1 || Roll 2 || Frame Score || Total')
    end
  end
end
