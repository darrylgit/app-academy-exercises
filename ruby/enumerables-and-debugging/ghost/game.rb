require('set')

require_relative 'player.rb'

class Game
  attr_reader :players

  def initialize(*players)
    @fragment = ''

    @players = players.map { |name| Player.new(name) }

    @losses = Hash.new('')

    # Load words into dictionary set
    @dictionary = Set.new([])

    file = File.open("dictionary.txt", "r")

    file.each_line do |line|
      @dictionary.add(line.chomp)
    end

    file.close
  end

  def run
    until @losses.has_value?('GHOST')
      
      self.play_round
      self.display_standings

    end

    loser = @losses.key('GHOST').name
    
    "OMG! #{loser} has spelled GHOST and lost the game."
  end

  def display_standings
    puts "--------------------------"
    puts "STANDINGS:"
    @losses.each { |player, loss| puts "#{player.name}: #{loss}"}
    puts "--------------------------"
  end

  def play_round
    until @dictionary.include?(@fragment)
      self.take_turn(self.current_player)
      self.next_player!
    end

    puts "Ay bendito! #{self.previous_player.name} has spelled \"#{@fragment}\" and lost this round."
    @fragment = ''
    self.record(self.previous_player)
  end

  def record(player)
    if @losses[player] != 'GHOST'
      @losses[player] = 'GHOST'[0...@losses[player].length + 1]
    end

    puts ''
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
    puts "Current fragment: #{@fragment.upcase}" if @fragment.length > 0
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