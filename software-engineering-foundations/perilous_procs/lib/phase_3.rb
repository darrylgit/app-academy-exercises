def selected_map!(arr, prc1, prc2)
  arr.each_with_index do |el, i|
    arr[i] = prc2.call(el) if prc1.call(el)
  end

  nil
end

def chain_map(val, procs)
  procs.each { |prc| val = prc.call(val) }
  val
end

def proc_suffix(str, proc_hash)
  str.split(' ').map do |word|
    suffix = ""
    proc_hash.keys.each do |prc|
      suffix += proc_hash[prc] if prc.call(word)
    end

    word + suffix
  end.join(' ')
end

def proctition_platinum(arr, *prcs)
  output = Hash.new()

  prcs.each_with_index do |prc, i|
    output[i + 1] = []
    arr.each { |el| output[i + 1] << el if prc.call(el) && !output.values.flatten.include?(el) }
  end

  output
end

def procipher(str, proc_hash)
  str.split(' ').map do |word|
    procs_to_apply = []

    proc_hash.keys.each do |prc|
      procs_to_apply << proc_hash[prc] if prc.call(word)
    end

    procs_to_apply.each do |prc|
      word = prc.call(word)
    end

    word
  end.join(' ')
end