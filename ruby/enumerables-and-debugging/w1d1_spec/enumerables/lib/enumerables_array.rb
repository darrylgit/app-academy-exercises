def factors(num)
  output = []
  i = 1

  while i <= num
    if (num % i == 0)
      output << i
    end
    i += 1
  end

  return output
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |el, next_el| el <=> next_el }

    sorted = false

    while !sorted
        sorted = true
        (0...self.length - 1).each do |i|
        
            if prc.call(self[i], self[i + 1]) == 1
                sorted = false
                self[i], self[i + 1] = self[i + 1], self[i]
            end
        end
    end

    self
  end

  def bubble_sort(&prc)
    [*self].bubble_sort!(&prc)
  end
end