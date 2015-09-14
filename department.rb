class Department
  attr_reader :name, :employees
  def initialize(name:)
    @name = name
    @employees = []
  end

  def put_employee_into_department(employee_object)
    @employees << employee_object
  end

  def add_all_salaries
    @employees.inject(0) {|sum, employee_object| sum + employee_object.salary}
  end

  def department_raise
    @employees.each do |employee|
      raise_amount = yield(employee)
      employee.salary += raise_amount
    end
  end

end
