def zip(*arrs)
  output = Array.new(arrs[0].length) { [] }

  arrs.each do |arr|
    arr.each_with_index do |el, i|
      output[i] << el
    end
  end

  output
end