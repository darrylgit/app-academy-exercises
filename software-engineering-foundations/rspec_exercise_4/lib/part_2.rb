def proper_factors(num)
  (1...num).select { |factor| num % factor == 0}
end

def aliquot_sum(num)
  proper_factors(num).sum 
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  output = []

  while output.length < num
    candidate = output[-1] ? output[-1] + 1 : 6

    while !perfect_number?(candidate)
      candidate += 1
    end

    output << candidate
  end

  output
end