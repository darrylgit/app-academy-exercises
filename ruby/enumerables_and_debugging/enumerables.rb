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
end
