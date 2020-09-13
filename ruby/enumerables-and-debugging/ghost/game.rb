require('set')

require './player.rb'

class Game
  attr_reader :players
  def initialize(*players)
    @fragment = ''

    @players = players.map { |name| Player.new(name) }

    # Load words into dictionary set
    @dictionary = Set.new([])

    @file = File.open("dictionary.txt", "r")

    @file.each_line do |line|
      @dictionary.add(line.chomp)
    end

    @file.close
  end

  def play_round
  end

  def current_player
    @players[0]
  end

  def previous_player
    @players[-1]
  end

  def next_player!
    @players.push(@players.shift)
  end

  def take_turn(player)
  end

  def valid_play?(str)
  end
end