def proper_factors(num)
  (1...num).select { |factor| num % factor == 0}
end