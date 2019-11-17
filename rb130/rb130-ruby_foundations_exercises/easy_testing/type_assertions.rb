require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @value = Numeric.new
  end

  def test_instance_of_question
    assert_instance_of Numeric, @value
  end
end
