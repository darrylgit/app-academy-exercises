require 'byebug'

def range(start_val, end_val)
  return [] if start_val >= end_val

  [start_val] + range(start_val + 1, end_val)
end

def array_sum_recursive(arr)
  return arr[0] if arr.length == 1

  arr[0] + array_sum_recursive(arr[1..-1])
end

def array_sum_iterative(arr)
  arr.inject() { |acc, val| acc + val }
end

def exp_1(base, exp)
  return 1 if exp == 0

  base * exp_1(base, exp - 1)
end

def exp_2(base, exp)
  return 1 if exp == 0

  exp.even? ? exp_2(base, exp / 2) * exp_2(base, exp / 2) : base * exp_2(base, (exp - 1) / 2) * exp_2(base, (exp - 1) / 2)
end

class Array 
  def deep_dup
    # Base case
    return [*self] if self.none? { |el| el.is_a?(Array) }

    output = []

    # Shovel the result of the recursive call on element if array, else simply shovel element
    self.each do |el|
      el.is_a?(Array) ? output << el.deep_dup : output << el
    end

    output
  end
end

def fibonacci(n)
  return [] if n <= 0
  return [1] if n == 1
  return [1, 1] if n == 2

  prev_arr = fibonacci(n-1)

  [*prev_arr, prev_arr[-2] + prev_arr[-1]]
end

def bsearch(arr, val)
  # Base case: nothing found
  return if arr.empty?

  # Get middle index
  middle_index = (arr.length / 2).floor

  # Found it!
  return middle_index if arr[middle_index] == val

  if arr[middle_index] > val
    # Search preceding subarray
    return bsearch(arr[0...middle_index], val)
  else
    # Search following subarray
    middle_index += 1
    found_index = bsearch(arr[middle_index..-1], val)
    return middle_index + found_index if found_index
  end

  # Implicit return of nil
end

def merge_sort(arr)
  return arr if arr.length <= 1

  # Get middle index
  middle_index = (arr.length / 2).floor

  arr_first_half = arr[0...middle_index]
  arr_second_half = arr[middle_index..-1]

  merge(merge_sort(arr_first_half), merge_sort(arr_second_half))
end

def merge(arr1, arr2)
  # Chose to do this without Array.sort

  output = []

  all_values = [*arr1, *arr2]

  # Shovel last value into output array immediately, just so we don't have to deal with nil comparisons
  output << all_values.pop


  while all_values.length > 0
    # Pop last value off all_values
    popped_value = all_values.pop

    # If it's bigger than the last value in the output array, shovel
    if popped_value >= output[-1]
      output << popped_value
      next
    end

    # Else, iterate through output array until we find a value greater than the popped value, then insert 
    output.each_with_index do |val, i|
      if val > popped_value
        output.insert(i, popped_value)
        break
      end
    end
  end

  output
end