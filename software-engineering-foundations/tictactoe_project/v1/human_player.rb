class HumanPlayer
  attr_reader :mark
  
  def initialize(mark)
    @mark = mark
  end
  
  def is_i?(str)
    str.to_i.to_s == str
  end

  def get_position
    p "#{@mark.to_s}: Enter a position! (format: <num><space><num>)"
    position_input = gets.chomp

    
    raise "Invalid format: must be <num><space><num>" if !self.is_i?(position_input[0]) || !self.is_i?(position_input[2]) || position_input[1] != " "

    [position_input[0].to_i, position_input[2].to_i]
  end

  
end