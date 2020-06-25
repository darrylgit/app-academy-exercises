def some?(arr, &prc)
  arr.each { |el| return true if prc.call(el) }
  false
end