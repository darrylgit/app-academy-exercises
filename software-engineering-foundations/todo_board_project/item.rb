class Item
  def self.valid_date?(str)
    year, month, day = *str.split("-")

    month = month.to_i
    day = day.to_i
    return false if month < 1 || month > 12
    return false if day < 1 || day > 31

    true
  end

  attr_accessor :title, :description
  attr_reader :deadline, :done

  def initialize(title, deadline, description)
    raise "Invalid date" if !self.class.valid_date?(deadline)

    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    raise "Invalid date" if !self.class.valid_date?(new_deadline)

    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end