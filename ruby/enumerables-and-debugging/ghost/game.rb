# require 'dictionary.rb'
require('set')

class Game
  def initialize(player1, player2)
    @dictionary = Set.new([])

    @file = File.open("dictionary.txt", "r")

    @file.each_line do |line|
      @dictionary.add(line.chomp)
    end

    @file.close

    @fragment = ''
    @player1 = player1
    @player2 = player2
  end
end