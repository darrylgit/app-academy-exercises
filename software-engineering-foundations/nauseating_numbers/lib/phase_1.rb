require "byebug"

def strange_sums(nums)
  count = 0

  while nums.length > 1
    nums[1..-1].each { |num| count += 1 if num + nums[0] == 0 }
    nums.shift()
  end

  count
end

def pair_product(nums, product)
  pair_exists = false

  while nums.length > 1
    nums[1..-1].each { |num| pair_exists = true if num * nums[0] == product }
    nums.shift()
  end

  pair_exists
end

def rampant_repeats(str, hash)
  output = ""

  str.each_char { |char| output += char * (hash[char] || 1) }

  output
end

def perfect_square(num)
  (1..num).each { |factor| return true if factor * factor == num }
  false
end

perfect_square(64)