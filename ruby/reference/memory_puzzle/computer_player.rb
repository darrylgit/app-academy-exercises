class ComputerPlayer
  def initialize
    @matched_cards = {}
    @known_cards = {}
  end

  def self.prompt(arg1, arg2)
    puts "Woah I'm a computer"
  end

  def self.receive_revealed_card(val, pos)
    @known_cards[val] = pos
  end
end