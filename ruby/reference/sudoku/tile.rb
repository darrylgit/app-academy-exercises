require 'colorize'

class Tile 
  def initialize(value)
    @value = value.to_i

    @given = @value == 0 
  end

  def update_value(val)
    @value = val if @given
  end

  def to_s
    # Print a space if value is zero
    value_to_print = @value == 0 ? " " : @value.to_s
    
    " " + (@given ? value_to_print.colorize(:light_blue) : value_to_print) + " "
  end
end