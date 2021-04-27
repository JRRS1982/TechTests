require './lib/frame'

# the structure that shoudl be holding the frames and calculating the score
class Scorecard
  attr_reader :frame_array, :game_over

  def initialize
    @frame_array = []
    @game_over = false
  end

  def frame_number
    frame_number = 1
    @frame_array.each do |this_frame|
      frame_number += 1 if this_frame.over == true
    end
    frame_number
  end

  def turn(roll_value,
           frame_array = @frame_array,
           frame = Frame.new,
           frame_ten = FrameTen.new)
    insert_frame_if_empty(frame)
    frame_array.each do |this_frame|
      if frame_array[-1].over == true
        not_over_add_frame(frame)
        not_over_add_frame_ten(frame_ten)
      elsif this_frame.over
        next
      else
        this_frame.roll(roll_value)
        break
      end
    end
    game_over_check
  end

  def score
    score_helper = 0
    spare_bonus_calculator
    strike_bonus_calculator
    @frame_array.each do |frame|
      score_helper += frame.score
      score_helper += frame.bonus if frame.bonus.class == Integer
    end
    puts "Your score is #{score_helper}"
    score_helper
  end

  private

  def game_over_check
    if @frame_array.length == 10
      if strike?(frame_array[9].roll_three)
        @game_over = true
        true
      elsif spare?(frame_array[9].roll_one, frame_array[9].roll_two)
        @game_over = true
        true
      end
    else
      false
    end
  end

  def spare_bonus_calculator(frame_array = @frame_array)
    frame_array.each_with_index do |frame, index|
      if !frame_array[index + 1].nil?
        if index.between?(0, 9)
          if frame.spare == true
            if frame_array[index + 1].roll_one.class == Integer
              frame.bonus = frame_array[index + 1].roll_one
            end
          end
        end
      end
    end
  end

  def spare?(pins_one, pins_two)
    if pins_one.class == Integer && pins_two.class == Integer
      spare_helper = 0
      spare_helper += pins_one
      spare_helper += pins_two
      true if spare_helper == 10
    else
      false
    end
  end

  def strike?(pins)
    true if pins == 10
  end

  def strike_bonus_calculator(frame_array = @frame_array)
    frame_array.each_with_index do |frame, index|
      if index.between?(0, 8)
        next unless frame.strike == true && !frame_array[index + 1].nil?
        next unless frame_array[index + 1].roll_one.class == Integer

        if frame_array[index + 1].roll_one.class == Integer
          @frame_array[index].bonus += frame_array[index + 1].roll_one
          if frame_array[index + 1].roll_two.class == Integer
            @frame_array[index].bonus += frame_array[index + 1].roll_two
          elsif frame_array[index + 1].strike == true && !frame_array[index + 2].nil?
            @frame_array[index].bonus += frame_array[index + 2].roll_one
          end
        end
      elsif index == 9
        next unless frame.strike == true && !frame_array[index + 1].nil?
        next unless frame_array[index + 1].roll_one.class == Integer

        @frame_array[index].bonus += frame_array[index + 1].roll_one
        if frame_array[index + 1].roll_two.class == Integer
          @frame_array[index].bonus += frame_array[index + 1].roll_two
        end
      elsif index == 10
        next
      end
    end
  end

  def last_frame_over?
    @frame_array[-1].over == true
  end

  def game_over?
    @game_over == true
  end

  def not_over_add_frame(frame = Frame.new, frame_array = @frame_array)
    @frame_array << frame if frame_array.length < 9
  end

  def not_over_add_frame_ten(frame_ten = FrameTen.new)
    @frame_array << frame_ten if frame_array.length == 9
  end

  def insert_frame_if_empty(frame, frame_array = @frame_array)
    @frame_array.push(frame) if frame_array.length.zero?
  end

  def game_complete_check(frame_array = @frame_array)
    @game_over = true if frame_array.count == 10 && frame_array[9].over == true
  end
end
