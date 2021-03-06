class Employee
  attr_reader :name, :review, :positive, :all
  attr_accessor :salary
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

  def employee_raise(raise_amount)
    @salary += raise_amount
  end


end
