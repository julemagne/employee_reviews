require 'minitest/autorun'
require 'minitest/pride'
require './department.rb'
require './employee.rb'

class EmployeeReviewsTest < Minitest::Test

  def test_initialize

  end

  def test_classes_exist
      assert Employee
      assert Department
    end

  def test_create_department
    pickle_co = Department.new("Pickle Co.")
  end
end
