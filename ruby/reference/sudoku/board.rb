class Board
  def self.from_file(file_path)
    arr = []

    file = File.open(file_path, "r")

    file.each_line do |line|
      arr << (line.chomp.split(''))
    end

    file.close

    arr
  end

  attr_reader :grid

  def initialize(file_path)
    @grid = Board.from_file(file_path)
  end
end