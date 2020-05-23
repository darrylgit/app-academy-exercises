class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  # Class methods
  def self.valid_pegs?(arr)
    arr.all? { |peg| POSSIBLE_PEGS.keys.include?(peg.upcase) }
  end

  def self.random(length)
    pegs = (0...length).map { |el| el = POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  # Reader(s) and init
  attr_reader :pegs

  def initialize(arr)
    raise "Pegs not valid" if !Code.valid_pegs?(arr)

    @pegs = arr.map(&:upcase)
  end

  # Instance methods
  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    # Fancy-pants one-liner!
    # Patching the optional index argument available in Javascript's Array.reduce()
    guess.pegs.each_with_index.inject(0) { |acc, (peg, i)| peg == @pegs[i] ? acc + 1 : acc }

    # Alternate, non-inject route:
    # tally = 0
    # guess.pegs.each_with_index { |peg, i| tally += 1 if @pegs[i] == peg }
    # tally
  end

  def num_near_matches(guess)
    tally = 0
    guess.pegs.each_with_index { |peg, i| tally += 1 if @pegs.include?(peg) && @pegs[i] != peg }
    tally

    # I love reducing arrays, but it's not always the way to go:

    # total_right = guess.pegs.inject(0) { |acc, peg| @pegs.include?(peg) ? acc + 1 : acc }
    # exact_matches = self.num_exact_matches(guess)
    # total_right - exact_matches
  end

  def ==(code)
    code.pegs == @pegs
  end

end
