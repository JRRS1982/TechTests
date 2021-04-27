# first step, creating a game class to hold the data we will need.
class Game
  attr_reader :score_array

  def initialize
    @score_array = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0],
                    [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]
    @roll_helper = 0
    @frame_helper = 0
    @score_helper = 0
    @strike_helper = 0
    @spare_helper = 0
  end

  def frame
    @frame_helper + 1
  end

  def over?
    frame > 10
  end

  def score
    @score_helper = 0
    @spare_helper = 0
    @strike_helper = 0
    @score_array.each.with_index do |item, index|
      if a_strike?(item)
        @strike_helper = calculate_strike_bonus(index)
        @score_helper += item.flatten.reduce(&:+)
        @score_helper += @strike_helper
      elsif a_spare?(item)
        @spare_helper = calculate_spare_bonus(index)
        @score_helper += item.flatten.reduce(&:+)
        @score_helper += @spare_helper
      else
        @score_helper += item.flatten.reduce(&:+)
      end
    end
    @strike_helper = 0
    @spare_helper = 0
    @score_helper
  end

  def a_strike?(array_of_two_rolls)
    array_of_two_rolls[0] == 10
  end

  def a_spare?(array_of_two_rolls)
    temp_total = array_of_two_rolls[0] + array_of_two_rolls[1]
    temp_total == 10
  end

  def roll(pins)
    @score_array[@frame_helper][@roll_helper] = pins
    @roll_helper += 1
    if @score_array[10]
    elsif @roll_helper == 2 || pins == 10
      @frame_helper += 1
      @roll_helper = 0
    end
  end

  def statement
    statement_heading
  end

  def reset_score_array
    @score_array = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0],
                    [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]
  end

  def calculate_strike_bonus(current_score_array_index)
    strike_bonus = 0
    score_array_index = current_score_array_index
    # get the score of the next two rolls
    strike_bonus += @score_array[score_array_index += 1][0]
    strike_bonus += @score_array[score_array_index][1]
    # if the score of the next roll is a strike check the score calculate that
    if @score_array[current_score_array_index += 1][0] == 10
      strike_bonus += @score_array[current_score_array_index += 1][0]
      strike_bonus += @score_array[current_score_array_index][1]
    end
    strike_bonus
  end

  def calculate_spare_bonus(current_score_array_index)
    @score_array[current_score_array_index += 1][0]
  end

  private

  def statement_heading
    'Frame || Roll 1 || Roll 2 || Frame Score || Total'
  end
end
