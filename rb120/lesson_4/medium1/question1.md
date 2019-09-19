QUESTION:

Ben asked Alyssa to code review the following code:
```ruby
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
```
Alyssa glanced over the code quickly and said - "It looks fine,
except that you forgot to put the `@` before `balance` when you refer
to the balance instance variable in the body of the `positive_balance?`
method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not
missing an `@`!"

Who is right, Ben or Alyssa, and why?

ANSWER:

Ben is right here. He's not reassigning `@balance` so there is no
need to access it directly and he added `attr_reader :balance` at the
top of his code. This creates the `balance` getter method and allow Ben
to drop the `@` since `balance` will return the value of `@balance` when
invoked.
