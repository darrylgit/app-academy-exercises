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
    return self if self.length == 1 && !self[0].is_a?(Array)
    
    first_element = self[0]
    if first_element.is_a?(Array)
      first_element = first_element.my_flatten
    end

    elements_after_first = self[1..-1]
    if elements_after_first.is_a?(Array)
      elements_after_first = elements_after_first.my_flatten
    end

    [*first_element, *elements_after_first]
  end
end
