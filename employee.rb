class Employee
  attr_reader :name, :salary, :review, :positive, :all

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = nil
    @positive = false
    @all = []
    @all << self
  end

  def give_employee_review(string)
    @review = string
  end

  def satisfaction(true_or_false)
    @positive = true_or_false
  end




end
