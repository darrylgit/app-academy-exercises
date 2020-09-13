require('set')

require './player.rb'

class Game
  attr_reader :players
  def initialize(*players)
    @dictionary = Set.new([])

    @file = File.open("dictionary.txt", "r")

    @file.each_line do |line|
      @dictionary.add(line.chomp)
    end

    @file.close

    @fragment = ''

    @players = players.map { |name| Player.new(name) }
  end

  def play_round
  end

  def current_player
  end

  def previous_player
  end

  def next_player!
  end

  def take_turn(player)
  end

  def valid_play?(str)
  end
end