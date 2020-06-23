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