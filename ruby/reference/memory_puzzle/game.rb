require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

require 'byebug'

class Game

  def initialize(size = 4)
    @previous_guess = nil
    @size = size
    @board = Board.new(size)
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    @player = @human_player
  end

  def play
    @board.populate
    @board.render

    until self.over?
      # First guess
      guess_pos = @player.prompt(@previous_guess, @board)
      @board.reveal(guess_pos)
      @board.render

      # Computer player "sees" card (regardless of whose turn it is)
      @computer_player.receive_revealed_card(@board.reveal(guess_pos), guess_pos)

      self.set_previous_guess(guess_pos)

      # Second guess
      guess_pos = @player.prompt(@previous_guess, @board)
      @board.reveal(guess_pos)
      @board.render

      # Computer player "sees" card (regardless of whose turn it is)
      @computer_player.receive_revealed_card(@board.reveal(guess_pos), guess_pos)
      
      # Check against previous guess
      if @board.reveal(@previous_guess) == @board.reveal(guess_pos)
        puts "It's a match!!!"
        @player.receive_match(@board.reveal(guess_pos), @previous_guess, guess_pos)
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
      @player = @player == @human_player ? @computer_player : @human_player
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