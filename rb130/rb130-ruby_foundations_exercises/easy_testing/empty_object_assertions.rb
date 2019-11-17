require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @list = []
  end

  def test_empty_question
    assert_empty @list
  end
end

# ALTERNATIVE SOLUTION:

# assert_equal true, list.empty?
