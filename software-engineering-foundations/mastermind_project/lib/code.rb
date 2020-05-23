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

end
