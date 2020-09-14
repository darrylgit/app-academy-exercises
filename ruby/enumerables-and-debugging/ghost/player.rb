class Player
  attr_reader :name, :eliminated

  def initialize(name)
    @name = name
    @eliminated = false
  end

  def guess
    guess = gets.chomp.downcase
    guess
  end

  def alert_invalid_guess
    puts "Oh no, #{@name}! That's an invalid guess. Try again:"
  end

  def eliminate
    @eliminated = true
  end
end