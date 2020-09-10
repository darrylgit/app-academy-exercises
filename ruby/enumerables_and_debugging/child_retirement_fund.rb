def child_retirement_fund(your_age)
  if your_age < 0
    raise "Age cannot be negative"
  end

  child_age = estimate_child_age(your_age)
  child_bank_account = estimate_bank_account(child_age)
  child_years_until_retirement = years_until_retirment(child_age)

  child_bank_account * child_years_until_retirement
end

def estimate_child_age(your_age)
  if your_age < 0
    raise "Age cannot be negative"
  end

  your_age / 2
end

def years_until_retirment(age)
  if age < 0
    raise "Age cannot be negative"
  end

  return 0 if age > 65

  65 - age
end

def estimate_bank_account(age)
  age ** 2
end