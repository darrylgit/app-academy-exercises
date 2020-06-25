def some?(arr, &prc)
  arr.each { |el| return true if prc.call(el) }
  false
end

def exactly?(arr, n, &prc)
  matches = 0
  arr.each { |el| matches += 1 if prc.call(el) }

  matches == n
end

def filter_out(arr, &prc)
  matches = []
  arr.each { |el| matches << el if !prc.call(el) }

  matches
end

def at_least?(arr, n, &prc)
  matches = 0
  arr.each { |el| matches += 1 if prc.call(el) }

  matches >= n
end

def every?(arr, &prc)
  arr.each { |el| return false if !prc.call(el) }
  true
end

def at_most?(arr, n, &prc)
  matches = 0
  arr.each { |el| matches += 1 if prc.call(el) }

  matches <= n
end

def first_index(arr, &prc)
  arr.each_with_index { |el, i| return i if prc.call(el) }
  nil
end