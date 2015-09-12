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

  def test_give_employee_review
    jarl =  Department.new("Jarl")
    wanda = Employee.new("Wanda", "wanda@pickles.com", "919-288-2888", 200000)
    jarl.put_employee_into_department(wanda)
    wanda.give_employee_review("Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects.")
    assert wanda.review == "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects."
  end








end
