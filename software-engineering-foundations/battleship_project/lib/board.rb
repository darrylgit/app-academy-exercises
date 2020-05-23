class Board

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](coordinates)
    @grid[coordinates[0]][coordinates[1]]
  end

  def []=(coordinates, value)
    @grid[coordinates[0]][coordinates[1]] = value
  end

  def num_ships
    #Inject-ception!
    @grid.inject(0) do |total, row|
      total + row.inject(0) { |acc, val| val == :S ? acc + 1 : acc }
    end
  end

end
