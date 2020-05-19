class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select { |idx| @secret_word[idx] == char }
  end

  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end

    @attempted_chars << char

    matching_indices = self.get_matching_indices(char)

    if matching_indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, matching_indices)
    end

    return true
  end

  def ask_user_for_guess
    print "Enter a char: "
    user_input = gets.chomp

    self.try_guess(user_input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts "WIN"
      return true
    end
      
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end

    false
  end

  def game_over?
    if self.lose? || self.win?
      puts @secret_word
      return true
    end

    false
  end

end
