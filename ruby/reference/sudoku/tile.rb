require 'rubygems'
# require 'bundler/setup'

require 'colorize'

class Tile 
  def initialize(given)
    @value = "3"
    @given = given
  end

  def update_value(val)
    @value = val if @given
  end

  def to_s
    @given ? (puts @value.colorize(:light_blue)) : (puts @value)
    puts "\n"
  end
end