def my_map(arr, &prc)
  arr.each_with_index { |el, i| arr[i] = prc.call(el) }
end

def my_select(arr, &prc)
  selected = []

  arr.each { |el| prc.call(el) ? selected << el : true }

  selected
end

def my_count(arr, &prc)
  arr.inject(0) { |acc, el| prc.call(el) ? acc + 1 : acc }
end

def my_any?(arr, &prc)
  arr.each do |el|
    if prc.call(el)
      return true
    end
  end
  
  false
end

def my_all?(arr, &prc)
  arr.each do |el|
    if !prc.call(el)
      return false
    end
  end
  
  true
end

def my_none?(arr, &prc)
  arr.each do |el|
    if prc.call(el)
      return false
    end
  end
  
  true
end