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
end