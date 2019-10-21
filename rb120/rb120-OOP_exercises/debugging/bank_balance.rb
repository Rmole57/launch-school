class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance         # => 50

# ATERNATIVE SOLUTION:

# class BankAccount
#   attr_accessor :balance

#   def initialize(account_number, client)
#     @account_number = account_number
#     @client = client
#     @balance = 0
#   end

#   def deposit(amount)
#     if amount > 0
#       self.balance += amount
#       "$#{amount} deposited. Total balance is $#{balance}."
#     else
#       "Invalid. Enter a positive amount."
#     end
#   end

#   def withdraw(amount)
#     if amount > 0 && valid_transaction?(balance - amount)
#       self.balance -= amount
#       "$#{amount} withdrawn. Total balance is $#{balance}."
#     else
#       "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
#     end
#   end

#   def valid_transaction?(new_balance)
#     new_balance >= 0
#   end
# end

# FURTHER EXPLORATION:

# If you mutate the argument of a setter method within the method body,
# the method will return the mutated value of the argument. If you assign
# the value to an instance variable within the setter method (which is what
# you should always do since that is what setter methods are designed for),
# you will be assigning the mutated value to the instance variable whether you
# mutate the value before or after the assignment within the method body:

# class Person
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end
  
#   def name=(other)
#     @name = other
#     other.upcase!
#   end
# end

# mike = Person.new('mike')
# puts mike.name            # => mike
# puts mike.name = 'bob'    # => BOB
# puts mike.name            # => BOB

# ----- or -----

# class Person
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end
  
#   def name=(other)
#     other.upcase!
#     @name = other
#   end
# end

# mike = Person.new('mike')
# puts mike.name            # => mike
# puts mike.name = 'bob'    # => BOB
# puts mike.name            # => BOB

# Also might be worth noting that if you re-assign the instance
# variable to an altered version of the argument (non-mutated),
# the setter method will still return the original argument while
# the instance variable will be re-assigned to the altered version:

# class Person
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end
  
#   def name=(other)
#     @name = other.upcase
#   end
# end

# mike = Person.new('mike')
# puts mike.name            # => mike
# puts mike.name = 'bob'    # => bob
# puts mike.name            # => BOB
