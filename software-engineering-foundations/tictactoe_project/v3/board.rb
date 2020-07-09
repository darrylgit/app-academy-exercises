class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
  end

  def valid?(position)
    position.all? { |coordinate| coordinate >= 0 && coordinate < @grid.length}
  end

  def empty?(position)
    x, y = position
    @grid[x][y] == "_"
  end

  def place_mark(position, mark)
    raise "Invalid position" if !valid?(position)
    raise "Position has already been marked" if !empty?(position)

    x, y = position
    @grid[x][y] = mark 
  end

  def print
    @grid.each do |row|
      p row
    end

    return "-------------"
  end

  def win_row?(mark)
    @grid.any? { |row| row.all? { |square| square == mark } }
  end

  def win_col?(mark)
    (0..@grid.length - 1).any? { |col| @grid.map { |row| row[col] }.all? { |square| square == mark } }
  end

  def win_diagonal?(mark)
    diag1 = @grid.each_with_index.map { |row, i| row[i] }
    diag2 = @grid.reverse.each_with_index.map { |row, i| row[i] }

    [diag1, diag2].any? { |diag| diag.all? { |square| square == mark } }
  end

  def win?(mark)
    [self.win_row?(mark), self.win_col?(mark), self.win_diagonal?(mark)].any?
  end

  def empty_positions?
    @grid.flatten.any? { |square| square == "_" }
  end

  def legal_positions
    output = []

    # Convert each square into its position, then shovel into output if empty
    positions = @grid.each_with_index { |row, i| row.each_with_index { |square, j| output << [i, j] if self.empty?([i, j]) } }

    output
  end
end