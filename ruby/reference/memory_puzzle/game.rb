require_relative 'board.rb'

class Game

  def initialize(size = 4)
    @previous_guess = nil
    @size = size
    @board = Board.new(size)
  end

  def play
    until self.over?
      board.render

    end
  end

  def prompt
    # Get user input
    puts "Guess time! Enter some coordinates, please."
    guess = gets.chomp
    guess_pos = guess.split(' ').map(&:to_i)

    # Validate
    until valid_guess?(guess_pos)
      puts "ERROR: Guess must be two integers within the bounds of the board size."
      guess = gets.chomp
      guess_pos = guess.split(' ').map(&:to_i)
    end

    guess_pos
  end

  def valid_guess?(pos)
    # Check length
    return false if pos.length != 2

    # Check that coordinate values are neither too big nor too small
    pos.all? { |val| val >= 0 && val <= @size }
  end

  def over?
    board.won?
  end
end