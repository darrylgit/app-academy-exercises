class Card
  def initialize
    @value = "L"
    @revealed = false
  end

  def ==(other_value)
    @value == other_value
  end

  def display
    @revealed ? @value : ''
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end
end