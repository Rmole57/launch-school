class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# ALTERNATIVE SOLUTIONS:

# 1)
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     return unless block_given?
#     recording = yield
#     record(recording)
#   end

#   def play
#     puts @recordings.last
#   end
# end

# 2)
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     recording = yield if block_given?
#     record(recording) if recording
#   end

#   def play
#     puts @recordings.last
#   end
# end
