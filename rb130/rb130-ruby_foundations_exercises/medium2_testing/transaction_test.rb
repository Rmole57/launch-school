require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

require 'stringio'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new('40\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 40, @transaction.amount_paid
  end
end

# ALTERNATIVE SOLUTION:

# def test_prompt_for_payment
#   input = StringIO.new('40\n')
#   capture_io { @transaction.prompt_for_payment(input: input) }
#   assert_equal 40, @transaction.amount_paid
# end
