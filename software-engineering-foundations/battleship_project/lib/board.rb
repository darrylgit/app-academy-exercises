class Board

  # Class method(s)
  def self.print_grid(grid)
    grid.each {|row| puts row.join(" ")}
  end

  # Init, reader(s)
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  # Instance methods
  def [](coordinates)
    @grid[coordinates[0]][coordinates[1]]

    #Turns out, you can also destructure
    # row, col = coordinates
    # @grid[row][col]
  end

  def []=(coordinates, value)
    @grid[coordinates[0]][coordinates[1]] = value

    #Turns out, you can also destructure
    # row, col = coordinates
    # @grid[row][col] = value
  end

  def num_ships
    @grid.inject(0) { |total, row| total + row.count { |square| square == :S } }

    # This actually would have been an excellent use case for flatten. Oh well. 
  end

  def attack(coordinates)
    if self.[cooordinates] == :S 
      self.[coordinates]= :H
      puts "you sunk my battleship"
      return true
    end

    self.[coordinates] = :X
    false
  end

  def place_random_ships
    quota = @size / 4
    
    while self.num_ships < quota
      @grid.each do |row|
        row.each_with_index do |square, i|
          row[i] = :S if rand(0...4) == 0
          return if self.num_ships == quota
        end
      end
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map { |square| square == :S ? :N : square }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
