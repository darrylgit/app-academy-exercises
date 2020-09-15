require_relative 'board.rb'

require 'byebug'

class Game

  def initialize(size = 4)
    @previous_guess = nil
    # @revealed_value = nil
    @size = size
    @board = Board.new(size)
  end

  def play
    @board.populate
    @board.render

    until self.over?
      guess_pos = self.prompt

      # Check against previous guess
      if @previous_guess
        if @board.reveal(@previous_guess) == @board.reveal(guess_pos)
          @board.render
          puts "It's a match!!!"
        else
          @board.render
          puts "No match."
          @board.hide(@previous_guess)
          @board.hide(guess_pos)
          sleep(2)
          system("clear")
          @board.render
        end
      else
        @board.reveal(guess_pos)
        @board.render
      end
    

      self.set_previous_guess(guess_pos)
    end

    "You win!!!"
  end

  def prompt
    # Get user input
    @previous_guess ? (puts "Now enter a second set of coordinates.") : (puts "Guess time! Enter some coordinates, please.")

    guess_pos = []

    loop do
      
      guess = gets.chomp
      guess_pos = guess.split(' ').map(&:to_i)

    break if self.valid_guess?(guess_pos)

    end

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

    # Check that card is not already revealed
    if @board[pos].revealed
      puts "ERROR: This card has already been revealed."
      return false
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
    @board.won?
  end
end