class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    guess = gets.chomp
    guess
  end

  def alert_invalid_guess
  end
end