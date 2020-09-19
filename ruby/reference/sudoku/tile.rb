require 'colorize'

class Tile 
  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def update_value(val)
    @value = val if @given
  end

  def to_s
    " " + (@given ? @value.to_s.colorize(:light_blue) : @value.to_s) + " "
  end
end