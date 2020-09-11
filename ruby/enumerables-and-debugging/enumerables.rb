require 'byebug'

class Array 
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end

  def my_select(&prc)
    output = []

    self.my_each do |el|
      output << el if prc.call(el)
    end

    output
  end

  def my_reject(&prc)
    output = []

    self.my_each do |el|
      output << el if !prc.call(el)
    end

    output
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false if !prc.call(el)}
    true
  end

  def my_flatten()
    first_element, *other_elements = self
    
    if first_element.is_a?(Array)
      first_element = first_element.my_flatten
    end

    if other_elements.is_a?(Array) && other_elements.length > 0
      other_elements = other_elements.my_flatten
    end

    [*first_element, *other_elements]
  end

  def my_zip(*arrs)
    output = Array.new(self.length) { [] }

    [self, *arrs].each do |arr|
      while arr.length < self.length
        arr << nil
      end

      arr.each_with_index do |el, i|
        output[i] << el if i < output.length
      end
    end

    output
  end

  def my_rotate(amount = 1)
    # Make new array 
    output = [*self]

    # No unnecessary rotations
    amount = amount % self.length

    if amount > 0
      while amount > 0
        output.push(output.shift)
        amount -= 1
      end
    else 
      while amount < 0
        output.unshift(output.pop)
        amount += 1
      end
    end
  
    output
  end

  def my_join(separator = '')
    output = ''

    self.each_with_index do |el, i|
      output << el
      if i < self.length - 1
        output << separator
      end
    end

    output
  end

  def my_reverse
    output = []

    i = self.length - 1
    while i >= 0
      output << self[i]
      i -= 1
    end

    output
  end
end
