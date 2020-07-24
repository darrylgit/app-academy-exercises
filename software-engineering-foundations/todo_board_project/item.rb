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
  attr_reader :deadline

  def initialize(title, deadline, description)
    raise "Invalid date" if !self.class.valid_date?(deadline)

    @title = title;
    @deadline = deadline;
    @description = description
  end

  def deadline=(new_deadline)
    raise "Invalid date" if !self.class.valid_date?(new_deadline)

    @deadline = new_deadline
  end
end