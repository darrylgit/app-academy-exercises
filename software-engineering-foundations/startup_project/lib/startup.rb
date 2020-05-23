require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.keys.include?(title)
  end

  def >(other_startup)
    @funding > other_startup.funding
  end

  def hire(name, title)
    raise "That is not a valid title" if !self.valid_title?(title)
    
    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    raise "Not enough funding" if  salary > @funding

    employee.pay(salary)
    @funding -= salary
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    @employees.map { |employee| @salaries[employee.title] }.sum / self.size
  end

  def close 
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }
    @employees = [*@employees, *other_startup.employees]
    other_startup.close
  end
end
