class Employee
  attr_reader :name, :salary, :all

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @all = []
    @all << self
  end




end
