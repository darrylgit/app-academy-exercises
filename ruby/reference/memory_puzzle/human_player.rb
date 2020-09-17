class HumanPlayer
  def prompt(prev_guess, board)
    # Get user input
    prev_guess ? (puts "Now enter a second set of coordinates.") : (puts "Guess time! Enter some coordinates, please.")

    guess_pos = []

    loop do
      
      guess = gets.chomp
      guess_pos = guess.split(' ').map(&:to_i)

    break if self.valid_guess?(guess_pos, prev_guess, board)

    end

    guess_pos
  end

  def valid_guess?(pos, prev_guess, board)
    # Check length
    if pos.length != 2
      puts "ERROR: Guess must be two space-separated integers."
      return false
    end

    # Check against previous guess
    if prev_guess
      prev_row, prev_col = prev_guess
      row, col = pos

      if row == prev_row && col == prev_col
        puts "ERROR: Guess cannot be the same as the previous guess." 
        return false 
      end
    end

    # Check that card is not already revealed
    if board[pos].revealed
      puts "ERROR: This card has already been revealed."
      return false
    end

    # Check that coordinate values are neither too big nor too small
    valid_range = pos.all? { |val| val >= 0 && val <= board.size }
    if !valid_range
      puts "ERROR: Coordinates must be within bounds of board."
      return false
    end

    true
  end

  def receive_revealed_card(val, pos)
    # Dummy method
  end

  def receive_match(val, *positions)
    # Dummy method
  end
end