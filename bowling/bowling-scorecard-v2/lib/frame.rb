# frame, which is basically the holder of attributes for the scorecard.
class Frame
  attr_accessor :roll_one, :roll_two, :strike, :spare, :over, :score, :bonus

  def initialize
    @roll_one = true
    @roll_two = false
    @over = false
    @strike = false
    @spare = false
    @bonus = 0
    @score = 0
  end

  def roll(pins_hit)
    if valid_roll(pins_hit, @roll_one, @roll_two)
      strike_check(pins_hit, @roll_one)
      spare_check(pins_hit, @roll_one, @roll_two)
      increment_score(pins_hit, @roll_one, @roll_two)
      increment_roll(@roll_one, @roll_two)
    else
      puts 'Sorry, that is an invalid roll'
    end
  end

  private

  def valid_roll(roll_value, roll_one, roll_two)
    valid_helper = 0
    if roll_one == true && roll_value.between?(0, 10)
      true
    elsif roll_two == true
      if roll_value.between?(0, 10)
        valid_helper += roll_one
        valid_helper += roll_value
        true if valid_helper <= 10
      else
        false
      end
    end
  end

  def increment_score(value, roll_one, roll_two)
    if roll_one == true
      @roll_one = value
    elsif roll_two == true
      @roll_two = value
    end
    @score += value
  end

  def increment_roll(roll_one, roll_two)
    if roll_two.class == Integer && roll_one.class == Integer
      @over = true
    elsif roll_one.class == Integer
      @roll_two = true
    end
  end

  def spare_check(pins_hit, roll_one, roll_two)
    spare_helper = 0
    if roll_two == true
      spare_helper += roll_one
      spare_helper += pins_hit
      if spare_helper == 10
        @spare = true
        @over = true
      end
    end
  end

  def strike_check(roll, roll_one)
    strike_update && game_over if roll_one == true && roll == 10
  end

  def game_over
    @over = true
  end

  def strike_update
    @strike = true
  end
end
