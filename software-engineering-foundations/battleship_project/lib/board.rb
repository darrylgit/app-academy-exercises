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
    @grid.inject(0) { |total, row| total + row.count { |el| el == :S } }
  end

end
