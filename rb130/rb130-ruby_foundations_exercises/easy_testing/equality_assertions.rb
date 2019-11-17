require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestClass < Minitest::Test
  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal 'xyz', @value.downcase
  end
end
