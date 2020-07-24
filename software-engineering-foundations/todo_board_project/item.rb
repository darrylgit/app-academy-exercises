class Item
  def self.valid_date?(str)
    year, month, day = *str.split("-")

    month = month.to_i
    day = day.to_i
    return false if month < 1 || month > 12
    return false if day < 1 || day > 31

    true
  end
end