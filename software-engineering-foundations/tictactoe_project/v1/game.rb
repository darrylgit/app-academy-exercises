require_relative "board"
require_relative "human_player"

class Game
  def initialize(mark1, mark2)
    @player_1 = HumanPlayer.new(mark1)
    @player_2 = HumanPlayer.new(mark2)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    @current_player = @current_player == @player_1 ? @player_2 : @player_1 
  end

  def play 
    while @board.empty_positions?
      @board.print

      turn_position = @current_player.get_position

      @board.place_mark(turn_position, @current_player.mark)

      if @board.win?(@current_player.mark)
        return "Victory! Congrats #{@current_player.mark.to_s}"
      end

      self.switch_turn
    end

    return "Draw :/"
  end
end