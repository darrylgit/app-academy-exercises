def zip(*arrs)
  output = Array.new(arrs[0].length) { [] }

  arrs.each do |arr|
    arr.each_with_index do |el, i|
      output[i] << el
    end
  end

  output
end

# ROFL this is the same damn algorithm as xor_select
def prizz_proc(arr, prc1, prc2)
  arr.select { |el| [prc1.call(el), prc2.call(el)].one? }
end