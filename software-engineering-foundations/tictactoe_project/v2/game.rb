require_relative "board"
require_relative "human_player"

class Game
  def initialize(board_size, *marks)
    @players = marks.map { |mark| HumanPlayer.new(mark) }
    @board = Board.new(board_size)
    @current_player = @players[0]
  end

  def switch_turn
    @current_player = @players.rotate!(-1)[0]
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