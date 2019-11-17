require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @value = 5
  end

  def test_odd_question
    assert_equal true, @value.odd?
  end
end

# ALTERNATIVE SOLUTION:

# assert value.odd?, 'value is not odd'
