require_relative 'board.rb'
require_relative 'human_player.rb'

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
      guess_pos = HumanPlayer.prompt(@previous_guess, @board)

      # Check against previous guess
      if @previous_guess
        if @board.reveal(@previous_guess) == @board.reveal(guess_pos)
          @board.render
          puts "It's a match!!!"
        else
          @board.render
          puts "No match."

          sleep(2)
          system("clear")
          
          @board.hide(@previous_guess)
          @board.hide(guess_pos)
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

  def set_previous_guess(guess)
    if @previous_guess
      @previous_guess = nil
    else
      @previous_guess = guess
    end
  end

  
  def over?
    @board.won?
  end
end