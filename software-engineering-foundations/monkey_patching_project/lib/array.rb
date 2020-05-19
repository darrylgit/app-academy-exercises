# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

    self.max - self.min
  end

  def average
    return nil if self.length == 0

    self.sum * 1.0 / self.length
  end

  def median
    arr = self.sort

    while arr.length > 2
      arr.pop
      arr.shift
    end

    return arr.sum / 2.0 if arr.length == 2
    
    arr[0]
  end

  def counts
    countsHash = Hash.new(0)

    self.each { |el| countsHash[el] += 1 }

    countsHash
  end

  def my_count(arg)
    self.inject(0) { |acc, el| el == arg ? acc + 1 : acc }
  end

  def my_index(arg)
    self.each_with_index { |el, i| return i if el == arg }

    nil
  end

  def my_uniq
    self.inject([]) { |acc, el| !acc.include?(el) ? [*acc, el] : acc }
  end

  def my_transpose
    output = []
    self.length.times { output.push([]) }
    
    self.each do |subArr|
      subArr.each_with_index { |el, i| output[i] << el }
    end

    output
  end
end
