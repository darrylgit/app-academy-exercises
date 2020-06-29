def xnor_select(arr, prc1, prc2)
  arr.select { |el| prc1.call(el) == prc2.call(el) }
end

def filter_out!(arr, &prc)
  filtered = arr.select { |el| !prc.call(el) }

  while arr.length > 0
    arr.pop
  end

  while filtered.length > 0
    arr.push(filtered.shift)
  end
end

def multi_map(arr, n = 1, &prc)
  n.times { arr = arr.map { |el| prc.call(el) }}
  arr
end