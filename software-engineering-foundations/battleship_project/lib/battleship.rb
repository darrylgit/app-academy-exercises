require_relative "board"
require_relative "player"

class Battleship

  # Init, readers
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new()
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  # Instance methods
  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    return false if @remaining_misses > 0

    puts "you lose"
    true
  end

  def win?
    return false if @board.num_ships > 0

    puts "you win"
    true
  end

  def game_over?
    self.lose? || self.win?
  end

  def turn
    coordinates = @player.get_move
    @remaining_misses -= 1 if !@board.attack(coordinates)
    @board.print
    puts "Remaining misses: #{@remaining_misses}"
  end

end
