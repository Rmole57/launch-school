class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(item)
    raise TypeError, 'can only add Todo objects' unless item.instance_of?(Todo)
    @todos << item
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  # The #done! method below is included as per the LS solution. However,
  # after implementing the #mark_all_done method, this method could be
  # omitted. Also, this could have been implemented like so:
  # @todos.each { |item| item.done! }
  # but LS seemed to want to implement a solution that took advantage
  # of the #mark_done_at method we implemented earlier.
  def done!
    @todos.each_index { |idx| mark_done_at(idx) }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    # implemented this way to raise the IndexError
    @todos.delete_at(idx) if item_at(idx)
  end

  def to_s
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    # the Array#each method returns an Enumerator if no block is given
    return self.to_enum(:each) unless block_given?

    @todos.each do |todo|
      yield(todo)
    end

    # typically, the #each method returns the calling object
    self
  end

  def select
    # the Array#select method returns an Enumerator if no block is given
    return self.to_enum(:select) unless block_given?

    # the #select method returns a NEW object of the calling object's class
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end

  # returns first Todo by title, or nil if no match
  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(str)
    # written this way so it short circuits and doesn't raise an error
    # if the string title doesn't exist in the list, else it would raise
    # a NoMethodError, as you would be trying to call #done! on NilClass object
    # since calling #first on an empty array (what select returns if it doesn't
    # find any items in the calling object matching the requirement) returns nil
    find_by_title(str) && find_by_title(str).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

# BELOW ARE THE GIVEN REQUIREMENTS/SPECS FOR THE PROGRAM'S BEHAVIORS:

# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add
# list << todo3                   # adds todo3 to end of list, returns list

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# list.done?                     # returns true if all todos in the list are done, otherwise false                         

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym

# ---- More Tests ----

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# puts list

# list.pop

# puts list

# list.mark_done_at(1)

# puts list

# ---- #each Method -----

# list.each do |todo|
#   puts todo
# end

# ---- #select Method -----

# list.select { |todo| todo.done? }
