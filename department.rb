class Department
  attr_reader :name, :employees
  def initialize(name)
    @name = name
    @employees = []
  end

  def put_employee_into_department(employee_object)
    @employees << employee_object
  end

  def add_all_salaries
    @employees.inject {|sum, employee_object| sum + employee_object.salary}
  end


end
