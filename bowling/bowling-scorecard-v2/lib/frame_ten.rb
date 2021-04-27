# this class is required as it differs from frame one to nine in logic and rolls
class FrameTen < Frame
  attr_reader :roll_three

  def initialize
    @roll_three = false
    super
  end

  def roll(pins_hit)
    if roll_valid?(pins_hit)
      provide_third_roll?
      increment_score(pins_hit)
    else
      puts 'Sorry, that is an invalid roll'
    end
  end

  private

  def increment_score(value)
    if @roll_one == true
      @roll_one = value
      @roll_two = true
    elsif @roll_two == true
      @roll_two = value
      provide_third_roll?
    elsif @roll_three == true
      @roll_three = value
    end
    @score += value
  end

  def provide_third_roll?
    third_helper = 0
    third_helper += @roll_one if @roll_one.class == Integer
    third_helper += @roll_two if @roll_two.class == Integer
    @roll_three = true if third_helper == 10 || @roll_two == 10
    true
  end

  def roll_valid?(roll_value)
    valid_helper = 0
    if @roll_one == true && roll_value.between?(0, 10)
      true
    elsif @roll_two == true && roll_value.between?(0, 10)
      valid_helper += roll_one
      valid_helper += roll_value
      true if valid_helper <= 20
    elsif @roll_three == true && roll_value.between?(0, 10)
      valid_helper += roll_one
      valid_helper += roll_two
      valid_helper += roll_value
      true if valid_helper <= 30
    else
      false
    end
  end
end
