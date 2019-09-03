class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# FURTHER EXPLORATION:

# Question:

# This example is rather contrived and unrealistic, but this type of
# situation occurs frequently in applications. Can you think of any
# applications where protected methods would be desirable?

# Answer:

# Any application where you want to compare an attribute that shouldn't
# be accessible outside the class.

# Maybe you have a Person class with a @weight attribute and need to
# compare the weight to another Person object. And perhaps the weight
# information is considered sensitive.

# Perhaps you have a Student class that has a @grade attribute and
# you need to rank all of the Students based on their grades. But grades
# are considered sensitive information.

# A more common/realistic scenario might be a username validation for a profile.
# You would have a User class with a @username attribute. And maybe you also have
# a log of already existing usernames (which could be stored in a class variable,
# @@users). So when you create a new profile, you have to check the @username you're
# assigning and compare it to all of the @usernames in @@users to ensure the name
# is not already taken, else you'll be thrown an error message upon instantiation
# of the User object.
