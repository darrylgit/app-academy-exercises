class GuessingGame
  def initialize(min, max)
    @game_over = false
    @secret_num = rand(min..max)
    @num_attempts = 0
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    if num == @secret_num
      puts "you win"
      @game_over = true
    else
      @num_attempts += 1
      if num < @secret_num 
        puts "too small" 
      else 
        puts "too big"
      end
    end
  end
      

  def ask_user
    print "enter a number "
    guess = gets.chomp.to_i

    self.check_num(guess)
  end
end
