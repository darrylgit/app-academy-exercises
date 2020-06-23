def anti_prime?(num)
  (1...num).map { |number| divisor_count(number) }.max < divisor_count(num)
end

def divisor_count(num)
  (1...num).inject(0) { |acc, factor| num % factor == 0 ? acc + 1 : acc }
end
