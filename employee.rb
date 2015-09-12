class Employee
  attr_reader :name, :salary, :review, :all

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = nil
    @all = []
    @all << self
  end

  def give_employee_review(string)
    @review = string
  end



end
