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

def zany_zip(*arrs)
  max_length = arrs.map { |arr| arr.length}.max;

  output = Array.new(max_length) { [] }

  arrs.each do |arr|
    while arr.length < max_length
      arr << nil
    end
  end

  arrs.each do |arr|
    arr.each_with_index do |el, i|
      output[i] << el
    end
  end

  output
end

def maximum(arr, &prc)
  arr.inject(nil) do |acc, val| 
    if acc == nil
      acc = val
    end

    acc = prc.call(val) >= prc.call(acc) ? val : acc;
  end
end

def my_group_by(arr, &prc)
  groups = Hash.new()

  arr.each do |el|
    proc_key = prc.call(el)
    if groups.has_key?(proc_key)
      groups[proc_key] << el
    else
      groups[proc_key] = [el]
    end
  end

  groups
end