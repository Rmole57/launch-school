require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    self
  end
end

class TestClass < Minitest::Test
  def setup
    @list = List.new
  end

  def test_same_object
    assert_same @list, @list.process
  end
end
