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
    total_salary = 0
    @employees.each {|employee|
     total_salary += employee.salary
    }
    return total_salary
  end


end
