require_relative '../lib/frame_ten.rb'
require 'pry'

RSpec.describe 'FrameTen' do
  subject { FrameTen.new }

  it 'allows a non strike' do
    subject.roll(3)
    expect(subject.score).to eq(3)
  end

  it 'allows a couple of non strikes' do
    subject.roll(3)
    subject.roll(4)
    expect(subject.score).to eq(7)
  end

  it 'only allows two rolls if not a strike or a spare' do
    expect(STDOUT).to receive(:puts).with('Sorry, that is an invalid roll')
    subject.roll(3)
    subject.roll(4)
    subject.roll(2)
  end

  it 'allows a spare' do
    subject.roll(6)
    subject.roll(4)
    subject.roll(2)
    expect(subject.score).to eq(12)
  end

  it 'changes score for the three rolls' do
    3.times do
      subject.roll(10)
    end
    expect(subject.roll_one).to eq(10)
    expect(subject.roll_two).to eq(10)
    expect(subject.roll_three).to eq(10)
    expect(subject.score).to eq(30)
  end
end
