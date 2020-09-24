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