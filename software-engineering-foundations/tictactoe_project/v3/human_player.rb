class HumanPlayer
  attr_reader :mark
  
  def initialize(mark)
    @mark = mark
  end
  
  def is_i?(str)
    str.to_i.to_s == str
  end

  def get_position(legal_positions)
    puts "#{@mark.to_s}: Enter a position! (format: <num><space><num>)"
    position_input = gets.chomp
    
    raise "Invalid format: must be <num><space><num>" if !self.is_i?(position_input[0]) || !self.is_i?(position_input[2]) || position_input[1] != " "

    got_position = [position_input[0].to_i, position_input[2].to_i]

    position_legal = false

    legal_positions.each { |position| position_legal = true if position[0] == got_position[0] && position[1] == got_position[1] }

    return got_position if position_legal

    puts "#{got_position} is not a legal position"
    return get_position(legal_positions)
  end
end