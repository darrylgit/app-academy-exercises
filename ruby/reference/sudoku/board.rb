require_relative "tile.rb"

require "byebug"

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
    grid_arr = Board.from_file(file_path)

    grid_arr.map! do |row|
      row.map!{ |tile_val| Tile.new(tile_val) }
    end

    @grid = grid_arr
  end

  def solved?
    grid_values = self.grid_values

    [self.rows_solved?(grid_values),  
    self.columns_solved?(grid_values), 
    self.three_by_three_squares_solved?(grid_values)].all?
  end

  def [] (*coords)
    row, column = coords
    return @grid[row][column]
  end

  def []=(row, column, value)
    tile = self[row, column]
    tile.update_value(value)
  end

  def grid_values
    @grid.map do |row|
      row.map { |tile| tile.value } 
    end
  end

  def rows_solved?(grid_values)
    grid_values.each do |row|
      (1..9).each { |value| return false if !row.include?(value) }
    end

    true
  end 

  def columns_solved?(grid_values)
    (0...9).each do |col_number|
      column = grid_values.map { |row| row[col_number] }.flatten
      
      (1..9).each { |value| return false if !column.include?(value) }
    end

    true
  end

  def three_by_three_squares_solved?(grid_values)
    current_square = []

    # Time for a quadruple loop

    # Start at 0, increment by 3
    starting_tile_row = 0
    while starting_tile_row < 9
      # Start at 0, increment by 3
      starting_tile_column = 0
      while starting_tile_column < 9
        # Iterate through each of the three rows in the square
        tile_row_within_square = 0
        while tile_row_within_square < 3
          current_row = starting_tile_row + tile_row_within_square

          # Iterate through each of the three colums within said row of current square
          (starting_tile_column..starting_tile_column + 2).each do |column|
            current_square << grid_values[current_row][column]
          end

          # Move down to the next row
          tile_row_within_square += 1
        end
        # At this point, we have nine values in the current_square array
        # Check for 1-9
        (1..9).each { |value| return false if !current_square.include?(value) }

        # Clear array
        current_square = []
        
        # Move one square column over
        starting_tile_column += 3
      end
      # Move one square row down
      starting_tile_row += 3
    end
    
    true
  end

  def render
    puts "\n"
    @grid.each_with_index do |row, row_number|
      row.each_with_index do |tile, i|
        if row_number < 3 || row_number > 5
          if i < 3 || i > 5
            print tile.to_s.colorize( :background => :light_black )
          else
            print tile.to_s
          end
        else
          if i < 3 || i > 5
            print tile.to_s
          else
            print tile.to_s.colorize( :background => :light_black )
          end
        end
      end
      puts "\n"
      puts "\n"
    end

    nil
  end

end