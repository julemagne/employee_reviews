require 'minitest/autorun'
require 'minitest/pride'
require './department.rb'
require './employee.rb'
require 'byebug'

class EmployeeReviewsTest < Minitest::Test

  def test_initialize

  end

  def test_classes_exist
      assert Employee
      assert Department
    end

  def test_create_department
    pickle_co = Department.new("Pickle Co.")
    assert pickle_co
  end

  def test_create_employee
    pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
    assert pete_pickles
  end

  def test_add_employee_to_department
    board =  Department.new("Board")
    pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
    board.put_employee_into_department(pete_pickles)
    assert board.employees.include?(pete_pickles)
  end

  def test_get_employee_name
    pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
    assert "Pete Pickles" == pete_pickles.name
  end

  def test_get_employee_salary
    pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
    assert 500000 == pete_pickles.salary
  end

  def test_get_department_name
    board =  Department.new("Board")
    assert "Board" == board.name
  end

  def test_department_total_salary
    board =  Department.new("Board")
    pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
    board.put_employee_into_department(pete_pickles)
    assert 500000 == board.add_all_salaries
  end









end
