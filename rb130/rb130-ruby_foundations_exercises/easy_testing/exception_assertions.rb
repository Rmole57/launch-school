require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class TestClass < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_raise_noexperience
    assert_raises NoExperienceError do
      @employee.hire
    end
  end
end
