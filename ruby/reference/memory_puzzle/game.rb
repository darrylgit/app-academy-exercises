require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

require 'byebug'

class Game

  def initialize(size = 4)
    @previous_guess = nil
    @size = size
    @board = Board.new(size)
    @player = HumanPlayer
  end

  def play
    @board.populate
    @board.render

    until self.over?
      # First guess
      guess_pos = @player.prompt(@previous_guess, @board)
      @board.reveal(guess_pos)
      @board.render
      self.set_previous_guess(guess_pos)

      # Second guess
      guess_pos = @player.prompt(@previous_guess, @board)
      @board.reveal(guess_pos)
      @board.render
      
      # Check against previous guess
      if @board.reveal(@previous_guess) == @board.reveal(guess_pos)
        puts "It's a match!!!"
      else
        puts "No match."

        sleep(2)
        system("clear")
        
        @board.hide(@previous_guess)
        @board.hide(guess_pos)
        @board.render
      end

      self.set_previous_guess(guess_pos)

      # Switch players
      @player = @player == HumanPlayer ? ComputerPlayer : HumanPlayer
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