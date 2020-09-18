require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

require 'byebug'

class Game
  attr_reader :board

  def initialize(size = 4)
    @previous_guess = nil

    size = size.to_i
    raise 'Max board size is 10' if size > 10
    if size % 2 == 1
      size += 1
      puts "Size must be an even number. Let me round that up to #{size.to_i} for you."
    end

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
        @human_player.receive_match(@board.reveal(guess_pos), @previous_guess, guess_pos)
        @computer_player.receive_match(@board.reveal(guess_pos), @previous_guess, guess_pos)
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

    # Determine winner
    case win_status = @computer_player.matched_cards.keys.length <=> @size / 4
    when -1 
      return "You win!!!"
    when 0 
      return "Draw"
    when 1 
      return "You lose"
    end
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

if __FILE__ == $PROGRAM_NAME
  size = ARGV[0] ? ARGV[0] : 4

  game = Game.new(size)
  game.play
end