require_relative "item"

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description="")
    return false if !Item.valid_date?(deadline)

    @items << Item.new(title, deadline, description)

    true
  end

  def size
    @items.length
  end

  def valid_index?(i)
    i >= 0 && i < self.size
  end

  def swap(index_1, index_2)
    # Unnecessarily DRY code
    return false if ![index_1, index_2].map { |i| self.valid_index?(i) }.all?

    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]

    true
  end

  def [](index)
    return nil if !self.valid_index?(index)

    @items[index]
  end

  def priority
    return @items[0]
  end

  def print 
    hr = "-" * 42
    puts hr
    puts @label.rjust(21 + label.length/2)
    puts hr
    puts "Index | Item                 | Deadline"
    puts hr
    @items.each_with_index do |item, i|
      index = i.to_s.ljust(6)
      title = item.title.ljust(21)
      deadline = item.deadline

      puts "#{index}| #{title}| #{deadline}"
    end
    puts hr
  end

  def print_full_item(index)
    hr = "-" * 42
    item = self[index]
    center_space = " " * (42 - item.title.length - item.deadline.length)

    puts hr
    puts "#{item.title}#{center_space}#{item.deadline}"
    puts "#{item.description}"
    puts hr
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(index, amount = 1)
    return false if !self.valid_index?(index)

    while amount > 0 && index > 0
      self.swap(index, index - 1)
      amount -= 1
      index -= 1
    end

    true
  end

  def down(index, amount = 1)
    return false if !self.valid_index?(index)

    while amount > 0 && index < self.size
      self.swap(index, index + 1)
      amount -= 1
      index += 1
    end

    true
  end
end