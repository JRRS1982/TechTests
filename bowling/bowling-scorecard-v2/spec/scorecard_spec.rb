require_relative '../lib/scorecard'
require_relative '../lib/frame_ten.rb'

RSpec.describe 'Scorecard' do
  subject { Scorecard.new }

  context '#score' do
    it 'records a score of one pin hit' do
      subject.turn(1)
      expect(subject.score).to eq(1)
    end

    it 'records a score of two pins hit' do
      subject.turn(2)
      expect(subject.score).to eq(2)
    end

    it '20 times 1 equals 20' do
      20.times do
        subject.turn(1)
      end
      expect(subject.score).to eq(20)
    end

    it '30 times 1 equals 20 - error checking' do
      30.times do
        subject.turn(1)
      end
      expect(subject.score).to eq(20)
    end

    it 'various turns under spare are calculated' do
      subject.turn(1)
      subject.turn(5)
      subject.turn(3)
      subject.turn(6)
      expect(subject.score).to eq(15)
    end

    it 'calculates a string of strikes' do
      5.times do
        subject.turn(10)
      end
      expect(subject.score).to eq(120)
    end

    it 'calculates 11 strikes and a gutter ' do
      11.times do
        subject.turn(10)
      end
      subject.turn(0)
      expect(subject.score).to eq(290)
    end

    it 'announces the score when the method is called' do
      expect(STDOUT).to receive(:puts).with('Your score is 1')
      subject.turn(1)
      subject.score
    end
  end

  context '#spare_bonus' do
    it 'adds the score from the next frame if this frame is a strike' do
      subject.turn(2)
      subject.turn(8)
      subject.turn(3)
      expect(subject.score).to eq(16)
    end

    it 'adds the next roll, not the score from the next frame' do
      subject.turn(2)
      subject.turn(8)
      subject.turn(3)
      subject.turn(6)
      expect(subject.score).to eq(22)
    end

    it 'handles concecutive spares' do
      subject.turn(5)
      subject.turn(5)
      subject.turn(5)
      subject.turn(5)
      subject.turn(2)
      expect(subject.score).to eq(29)
    end

    it 'accomodates the last frame by not including nil' do
      18.times do
        subject.turn(1)
      end
      subject.turn(7)
      subject.turn(3)
      expect(subject.score).to eq(28)
    end

    it 'handles when there isnt a following roll' do
      subject.turn(4)
      subject.turn(6)
      expect(subject.score).to eq(10)
    end

    it 'accomodates a spare in 10-1 and 10-2' do
      18.times do
        subject.turn(0)
      end
      subject.turn(4)
      subject.turn(6)
      subject.turn(2)
      expect(subject.score).to eq(12)
    end
  end

  context '#strike_bonus' do
    it 'adds the score from the next frames roll one and two' do
      subject.turn(10)
      subject.turn(6)
      subject.turn(4)
      expect(subject.score).to eq(30)
    end

    it 'calculates the perfect score... 12 strikes = 300' do
      12.times do
        subject.turn(10)
      end
      expect(subject.score).to eq(300)
    end
  end

  context '#frame_number' do
    it 'iterates up from one to two when two gutters are rolled' do
      2.times do
        subject.turn(0)
      end
      expect(subject.frame_number).to eq(2)
    end

    # Acceptance Criteria 5
    it 'iterates up from one to two when a strike is rolled' do
      subject.turn(10)
      expect(subject.frame_number).to eq(2)
    end

    # Acceptance Criteria 6
    it 'iterates up from one to two when a spare is rolled' do
      subject.turn(3)
      subject.turn(7)
      expect(subject.frame_number).to eq(2)
    end

    # Acceptance Criteria 7
    it 'When i roll gutter 18 times then i am on frame 10' do
      18.times do
        subject.turn(0)
      end
      expect(subject.frame_number).to eq(10)
    end

    # Acceptance Criteria 8
    it '4 gutter rolls, a strike and a spare frame and a roll of 2: frame 5' do
      4.times do
        subject.turn(0)
      end
      subject.turn(10)
      subject.turn(2)
      subject.turn(8)
      subject.turn(2)
      expect(subject.frame_number).to eq(5)
    end
  end

  context '#turn' do
    it 'moves it from roll one to roll two on frame one after one turn' do
      subject.turn(5)
      expect(subject.frame_array[0].roll_one).to be(5)
      expect(subject.frame_array[0].roll_two).to be(true)
    end

    it 'from roll one, to two, two over' do
      subject.turn(2)
      expect(subject.frame_array[0].roll_one).to be(2)
      expect(subject.frame_array[0].over).to be(false)
      subject.turn(3)
      expect(subject.frame_array[0].roll_two).to be(3)
      expect(subject.frame_array[0].over).to be(true)
    end

    it 'moves through the frames and sets roll values correctly' do
      subject.turn(2)
      expect(subject.frame_array[0].roll_one).to eq(2)
      expect(subject.frame_array[0].over).to be(false)
      expect(subject.frame_array[0].roll_two).to be(true)
      subject.turn(3)
      expect(subject.frame_array[0].roll_two).to eq(3)
      expect(subject.frame_array[0].over).to be(true)
      subject.turn(4)
      expect(subject.frame_array[0].roll_one).to eq(2)
      expect(subject.frame_array[0].over).to be(true)
      expect(subject.frame_array[0].roll_two).to eq(3)
      expect(subject.frame_array[1].roll_one).to eq(4)
      expect(subject.frame_array[1].roll_two).to be(true)
      subject.turn(5)
      expect(subject.frame_array[1].roll_two).to eq(5)
      expect(subject.frame_array[1].over).to be(true)
    end

    it 'ends the game after valid 10.3 turn' do
      18.times do
        subject.turn(1)
      end
      subject.turn(4)
      subject.turn(6)
      subject.turn(3)
      expect(subject.game_over).to be(true)
    end
  end

  context '#frame_array' do
    it 'calcultes frame array length' do
      7.times do
        subject.turn(1)
      end
      expect(subject.frame_array.length).to eq(4)
      expect(subject.game_over).to be(false)
    end

    it 'cant be over 10 frames long' do
      30.times do
        subject.turn(1)
      end
      expect(subject.frame_array.length).to eq(10)
    end

    it 'frame 9 is an object of Class Frame' do
      9.times do
        subject.turn(10)
      end
      subject.turn(1)
      expect(subject.frame_array[8].class).to be(Frame)
    end

    it 'frame 10 is an object of Class FrameTen' do
      9.times do
        subject.turn(10)
      end
      subject.turn(1)
      expect(subject.frame_array[9].class).to eq(FrameTen)
    end
  end
end
