require 'byebug'

class ComputerPlayer
  def initialize
    @matched_cards = {}
    @known_cards = Hash.new { |h, k| h[k] = [] }
  end

  def prompt(prev_guess, board)
    debugger
    unrevealed_squares = board.unrevealed_squares

    # If no previous guess
    if !prev_guess
      # Check for any new matches, return 
      if check_for_matches
        return check_for_matches[1]
      end

      return unrevealed_squares.sample
    # If previous guess:
    else
       # Check for any new matches, return 
       if check_for_matches
        return check_for_matches[0]
      end

      return unrevealed_squares.sample
    end
  end

  def check_for_matches
    @known_cards.each_value do |val|
      if val.length == 2
        return val
      end
    end

    false
  end

  def receive_match
  end

  def receive_revealed_card(val, pos)
 
    @known_cards[val] << pos

    # Remove duplicates
    @known_cards[val].uniq!
   
  end
end