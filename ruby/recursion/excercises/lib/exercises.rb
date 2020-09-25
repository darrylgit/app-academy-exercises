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