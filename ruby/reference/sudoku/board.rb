require_relative "tile.rb"

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

    @grid = grid_arr.each do |row| 
      row.map!{ |tile_val| Tile.new(tile_val) }
    end
  end

  # def render_board
  #   @grid.each()
  # end
end