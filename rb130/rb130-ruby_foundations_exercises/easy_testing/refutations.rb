require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @list = ['abc', 'def']
  end

  def test_includes_question
    refute_includes @list, 'xyz'
  end
end
