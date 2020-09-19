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
    @given ? (puts @value.to_s.colorize(:light_blue)) : (puts @value.to_s)
    puts "\n"
  end
end