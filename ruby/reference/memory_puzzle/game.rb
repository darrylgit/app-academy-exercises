require_relative 'board.rb'

require 'byebug'

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

    guess_pos = []

    loop do
      
      guess = gets.chomp
      guess_pos = guess.split(' ').map(&:to_i)

    break if self.valid_guess?(guess_pos)

    end

    self.set_previous_guess(guess_pos)

    guess_pos
  end

  def set_previous_guess(guess)
    if @previous_guess
      @previous_guess = nil
    else
      @previous_guess = guess
    end
  end

  def valid_guess?(pos)
    # Check length
    if pos.length != 2
      puts "ERROR: Guess must be two space-separated integers."
      return false
    end

    # Check against previous guess
    if @previous_guess
      prev_row, prev_col = @previous_guess
      row, col = pos

      if row == prev_row && col == prev_col
        puts "ERROR: Guess cannot be the same as the previous guess." 
        return false 
      end
    end

    # Check that coordinate values are neither too big nor too small
    valid_range = pos.all? { |val| val >= 0 && val <= @size }
    if !valid_range
      puts "ERROR: Coordinates must be within bounds of board."
      return false
    end

    true
  end

  def over?
    board.won?
  end
end