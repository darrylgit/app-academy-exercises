class Card
  attr_reader :value
  
  def initialize(value)
    @value = value
    @revealed = false
  end

  def ==(other_value)
    @value == other_value
  end

  def display
    @revealed ? self.to_s : ' '
  end

  def to_s
    @value.to_s
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end
end