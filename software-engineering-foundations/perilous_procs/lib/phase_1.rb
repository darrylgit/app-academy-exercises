def some?(arr, &prc)
  arr.each { |el| return true if prc.call(el) }
  false
end

def exactly?(arr, n, &prc)
  matches = []
  arr.each { |el| matches << el if prc.call(el) }

  matches.length == n
end

def filter_out(arr, &prc)
  matches = []
  arr.each { |el| matches << el if !prc.call(el) }
  
  matches
end