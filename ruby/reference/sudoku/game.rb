require_relative 'board.rb'

class Game
  def initialize
    @board = Board.new('./puzzles/sudoku1_almost.txt')
  end

  def play
    until board.solved?
      @board.render
      self.prompt
      @board[row, column] = val 
  end

  def prompt
    puts "Enter three integers in the format: row column value"

    do

      user_input = gets.chomp
      row, column, value = user_input.split(" ").map!{ |number| number.to_i }

    break if self.valid_input?(row, column, value)
  end

  def valid_input?(row, column, value)

  end
end