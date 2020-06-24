require "phase_2"

def matrix_addition_reloaded(*matrices)
  # Check dem heights and widths
  return nil if matrices.map { |matrix| matrix.length }.uniq.length > 1
  return nil if matrices.map { |matrix| matrix[0].length }.uniq.length > 1

  # Initialize accumulator
  init = matrices[0].map { |arr| arr.map { 0 }}

  # Add 'em up
  matrices.inject(init) { |acc, val| matrix_addition(acc, val) }
end

def squarocol?(matrix)
  # Check rows
  return true if matrix.map { |arr| arr.uniq }.any? { |row| row.length == 1 }

  # Check columns
  rotated_matrix = Array.new(matrix.length) { [] }
  matrix.each do |arr|
    arr.each_with_index { |el, i| rotated_matrix[i] << el }
  end

  return true if rotated_matrix.map { |arr| arr.uniq }.any? { |row| row.length == 1 }

  false
end

def squaragonal?(matrix)
  diagonal_1 = matrix.each.with_index.inject([]) { |acc, (val, i)| [*acc, val[i]] }
  diagonal_2 = matrix.reverse.each.with_index.inject([]) { |acc, (val, i)| [*acc, val[i]] }

  [diagonal_1, diagonal_2].map { |diag| diag.uniq }.any? { |arr| arr.length == 1 }
end

def pascals_triangle(n)
  triangle = []

  while n > 0
    # Initial level
    if !triangle[-1] 
      triangle << [1]
    else
      new_level = []
      # Bookend previous level with actual zeroes to make our lives easier
      prev_level = [0, *triangle[-1], 0]

      # Shovel all sums into new_level
      (0..prev_level.length - 2).each do |index|
        new_level << prev_level[index] + prev_level[index + 1] 
      end

      triangle << new_level
    end

    n -= 1
  end

  triangle
end