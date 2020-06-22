def strange_sums(nums)
  count = 0

  while nums.length > 1
    nums[1..-1].each { |num| count += 1 if num + nums[0] == 0 }
    nums.shift()
  end

  count
end