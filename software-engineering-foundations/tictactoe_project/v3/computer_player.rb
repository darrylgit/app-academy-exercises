class ComputerPlayer
  attr_reader :mark
  
  def initialize(mark)
    @mark = mark
  end
  
  def get_position(legal_positions)
    got_position = legal_positions.sample

    puts "Computer #{@mark.to_s} chose #{got_position}"
    got_position
  end
end