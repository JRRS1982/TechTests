require_relative '../lib/frame'

RSpec.describe 'Frame' do
  subject { Frame.new }

  context '#valid_roll' do
    it 'is not a valid second roll' do
      expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(3)
      subject.roll(8)
    end
  end
  
  context '#roll' do
    it 'not allow negative numbers' do
      expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(-1)
    end

    it 'not allow different negative numbers' do
      expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(-12)
    end

    it 'not allow a roll over 10' do
      expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(11)
    end

    it '10 in the second roll' do
      expect(STDOUT).not_to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(0)
      subject.roll(10)
    end

    it 'two balls over 10' do
      expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
      subject.roll(6)
      expect(subject.roll_one).to be(6)
      subject.roll(7)
      expect(subject.roll_two).to be(true)
      expect(subject.over).to be(false)
    end

    it 'feature checking' do
      subject.roll(6)
      expect(subject.over).to be(false)
      expect(subject.roll_one).to be(6)
      expect(subject.roll_two).to be(true)
      subject.roll(3)
      expect(subject.roll_two).to be(3)
      expect(subject.roll_two).not_to be(true)
      expect(subject.over).to be(true)
    end
  end
end
