QUESTION:

In the last question Alan showed Alyssa this code which
keeps track of items for a shopping cart application:
```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
```
Alyssa noticed that this will fail when `update_quantity` is called.
Since `quantity` is an instance variable, it must be accessed with the
`@quantity` notation when setting it. One way to fix this is to change
`attr_reader` to `attr_accessor` and change `quantity` to `self.quantity`.

Is there anything wrong with fixing it this way?

ANSWER:

Nothing is necessarily "wrong" per se. It depends on what your intention
for the program is, but by using `attr_accessor` you also create a public
setter method for clients to utilize. Essentially they can change the
`quantity` themselves simply by calling the setter method on the instance
itself like so:
```ruby
invoice1 = InvoiceEntry.new('tomatoes', 3)
invoice1.quantity = 4
```
It kind of makes the `update_quantity` method a bit redundant and
eliminates the guard clause to make sure that the `updated_count`
is a positive number (this is because the default setter method
would essentially allow you to set `quantity` to any value). Of
course, if you wanted to use syntax like the example above, you
could always just manually write a setter method to accomodate
your intentions like so:
```ruby
def quantity=(updated_count)
  @quantity = updated_count if updated_count >= 0
end
```
