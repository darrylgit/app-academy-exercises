def sum_to(n)
  return nil if n < 0
  return n if n <=0

  n + sum_to(n -1)
end

def add_numbers(arr)
  return arr[0] if arr.length <= 1

  arr.pop + add_numbers(arr)
end

def gamma_fnc(n)
  return nil if n <= 0
  return n if n == 1

  (n - 1) * gamma_fnc(n - 1)
end