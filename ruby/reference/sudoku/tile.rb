require 'rubygems'
# require 'bundler/setup'

require 'colorize'

class Tile 
  def initialize
    @value = "3"
    @given = true
  end

  def to_s
    @given ? (puts @value.colorize(:light_blue)) : (puts @value)
    puts "\n"
  end
end