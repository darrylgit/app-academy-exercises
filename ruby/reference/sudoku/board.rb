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

  def solved
  end

  def grid_values
    @grid.map do |row|
      row.map { |tile| tile.value } 
    end
  end

  def rows_solved?
    grid_values = self.grid_values

    grid_values.each do |row|
      (1..9).each { |value| return false if !row.include?(value) }
    end

    true
  end 

  def columns_solved?
    grid_values = self.grid_values

    (0...9).each do |col_number|
      column = grid_values.map { |row| row[col_number] }.flatten
      
      (1..9).each { |value| return false if !column.include?(value) }
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