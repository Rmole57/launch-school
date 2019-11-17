require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @list = ['abc', 'xyz']
  end

  def test_includes_question
    assert_includes @list, 'xyz'
  end
end

# ALTERNATIVE SOLUTION:

# assert_equal true, list.include?('xyz')
