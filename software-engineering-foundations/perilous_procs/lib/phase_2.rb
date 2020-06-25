def xnor_select(arr, prc1, prc2)
  arr.select { |el| prc1.call(el) == prc2.call(el) }
end