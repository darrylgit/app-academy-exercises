def range(start_val, end_val)
  return [] if start_val >= end_val

  [start_val] + range(start_val + 1, end_val)
end