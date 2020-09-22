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
    
    return "You win!"
  end

  def prompt
    user_input = []
    puts "Enter three integers in the format: row column value"

    loop do

      user_input = gets.chomp.split(" ")

    break if self.valid_input?(user_input)

    end

    row, column, value = user_input

    row = row.to_i
    column = column.to_i
    value = value.to_i

  end

  def valid_input?(input_values)
    if input_values.length == 0
      puts "Uh oh, we couldn't find anything you typed in. Try again?"
      return false
    elsif input_values.length == 1
      puts "Hmmm... we got a row from you, but not a column or a value."
      return false
    elsif input_values.length == 2
      puts "Oh dear, we got a row and column from you, but not a value!"
      return false
    end

    numbers_0_8 = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    numbers_1_9 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    row, column, value = input_values

    if !numbers_0_8.include?(row) || !numbers_0_8.include?(column)
      puts "Row and column indices are zero-indexed, i.e they need to be a number between 0 and 8"
      return false
    end

    if !numbers_1_9.include?(value)
      puts "Sudoku values must be a number between 1 and 9"
      return false
    end
    
    true
  end

end