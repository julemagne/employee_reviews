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

  def test_employee_performance_review
    jarl =  Department.new("Jarl")
    wanda = Employee.new("Wanda", "wanda@pickles.com", "919-288-2888", 200000)
    jarl.put_employee_into_department(wanda)
    wanda.satisfaction(true)
    assert wanda.positive == true
  end

  def test_one_employee_raise
    jarl =  Department.new("Jarl")
    wanda = Employee.new("Wanda", "wanda@pickles.com", "919-288-2888", 200000)
    jarl.put_employee_into_department(wanda)
    wanda.satisfaction(true)
    wanda.employee_raise(10000)
    assert wanda.salary == 210000
  end

  def test_department_raise
    minion =  Department.new("Minion")
    wanda = Employee.new("Wanda", "wanda@pickles.com", "919-288-2888", 200000)
    minion.put_employee_into_department(wanda)
    wanda.give_employee_review("Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects.")
    wanda.satisfaction(true)

    xavier = Employee.new("Xavier", "xavier@pickles.com", "919-288-2888", 120000)
    minion.put_employee_into_department(xavier)
    xavier.give_employee_review("Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go

    Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
    xavier.satisfaction(true)

    yvonne = Employee.new("Yvonne", "yvonne@pickles.com", "919-288-2888", 80000)
    minion.put_employee_into_department(yvonne)
    yvonne.give_employee_review("Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.

    Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic.")
    yvonne.satisfaction(false)

    zeke = Employee.new("Zeke", "zeke@pickles.com", "919-288-2888", 60000)
    minion.put_employee_into_department(zeke)
    yvonne.give_employee_review("Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.

    Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
    yvonne.satisfaction(false)

    minion.department_raise(10000)
    assert wanda.salary == 205000
    assert xavier.salary == 125000
    assert yvonne.salary == 80000
    assert zeke.salary == 60000
  end






# I'm just going to create some employees here...

# board =  Department.new("Board")
# pete_pickles = Employee.new("Pete Pickles", "pete@pickles.com", "919-288-2888", 500000)
# board.put_employee_into_department(pete_pickles)
# pete_pickles.give_employee_review("Pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles pickles.")
# pete_pickles.satisfaction(true)
#
# minion =  Department.new("Minion")
# wanda = Employee.new("Wanda", "wanda@pickles.com", "919-288-2888", 200000)
# minion.put_employee_into_department(wanda)
# wanda.give_employee_review("Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects.")
# wanda.satisfaction(true)
#
# xavier = Employee.new("Xavier", "xavier@pickles.com", "919-288-2888", 120000)
# minion.put_employee_into_department(xavier)
# xavier.give_employee_review("Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go
#
# Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
# xavier.satisfaction(true)
#
# yvonne = Employee.new("Yvonne", "yvonne@pickles.com", "919-288-2888", 80000)
# minion.put_employee_into_department(yvonne)
# yvonne.give_employee_review("Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.
#
# Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic.")
# yvonne.satisfaction(false)
#
# zeke = Employee.new("Zeke", "zeke@pickles.com", "919-288-2888", 60000)
# minion.put_employee_into_department(zeke)
# yvonne.give_employee_review("Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.
#
# Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
# yvonne.satisfaction(false)













end
