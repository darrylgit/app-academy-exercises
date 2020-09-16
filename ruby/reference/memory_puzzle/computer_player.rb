class ComputerPlayer
  def initialize
    @matched_cards = {}
    @known_cards = {}
  end

  def self.prompt
  end

  def self.receive_revealed_card(val, pos)
    @known_cards[val] = pos
  end
end