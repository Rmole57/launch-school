class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# FURTHER EXPLORATION:

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def switch_status
#     "This machine's switch is #{switch}!"
#   end

#   private

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# machine = Machine.new
# machine.start
# puts machine.switch_status # => "This machine's switch is on!"
# machine.stop
# puts machine.switch_status # => "This machine's switch is off!"
