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

  def department_raise(raise_amount)
    deserving = @employees.reject {|employee_object| employee_object.positive == false}
    the_raise = (raise_amount/deserving.length)
    for employee_object in @employees
       if employee_object.positive == true then
         employee_object.salary += the_raise
       end
    end
  end

end
