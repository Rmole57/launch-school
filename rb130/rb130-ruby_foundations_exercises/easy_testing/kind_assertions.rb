require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @value = 8
  end

  def test_kind_of_question
    assert_kind_of Numeric, @value
  end
end
