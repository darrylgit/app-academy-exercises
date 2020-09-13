class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    guess = gets.chomp.downcase
    guess
  end

  def alert_invalid_guess
    puts "Oh no, #{@name}! That's an invalid guess. Try again:"
  end
end