require('set')

require_relative 'player.rb'

class Game
  attr_reader :players
  def initialize(*players)
    @fragment = ''

    @players = players.map { |name| Player.new(name) }

    # Load words into dictionary set
    @dictionary = Set.new([])

    file = File.open("dictionary.txt", "r")

    file.each_line do |line|
      @dictionary.add(line.chomp)
    end

    file.close
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
    puts "Enter a letter:"
    guess = player.guess

    while !self.valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end

    @fragment += guess
  end

  def valid_play?(str)
    # Check that input is a single letter
    return false if str.length != 1 || !'abcdefghijklmnopqrstuvwxyz'.include?(str)

    #Check that possible words exist after adding guess
    @dictionary.each { |word| return true if word.match(/^#{Regexp.quote(@fragment + str)}/)}

    false
  end
end