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
    until @dictionary.include?(@fragment)
      self.take_turn(self.current_player)
      self.next_player!
    end

    puts "Ay bendito! #{self.previous_player.name} has spelled \"#{@fragment}\" and lost this round."
    @fragment = ''
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
    puts "Current fragment: #{@fragment.upcase}"
    puts "#{player.name}, enter a letter:"
    guess = player.guess

    while !self.valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end

    @fragment += guess

    puts "Letter accepted!"
  end

  def valid_play?(str)
    # Check that input is a single letter
    return false if str.length != 1 || !'abcdefghijklmnopqrstuvwxyz'.include?(str)

    # Check that possible words exist after adding guess
    # @dictionary.each { |word| return true if word.match(/^#{Regexp.quote(@fragment + str)}/)}
    @dictionary.each { |word| return true if word.start_with?(@fragment + str)}

    false
  end
end