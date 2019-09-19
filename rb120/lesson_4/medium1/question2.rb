class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

invoice1 = InvoiceEntry.new('tomatoes', 3)
p invoice1.quantity
invoice1.update_quantity(7)
p invoice1.quantity
invoice1.update_quantity(-1)
p invoice1.quantity

# ALTERNATIVE SOLUTION:

# class InvoiceEntry
#   attr_reader :product_name
#   attr_accessor :quantity

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     self.quantity = updated_count if updated_count >= 0
#   end
# end
