QUESTION:

If we have this code:
```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```
What happens in each of the following cases:

case 1:
```ruby
hello = Hello.new
hello.hi
```
case 2:
```ruby
hello = Hello.new
hello.bye
```
case 3:
```ruby
hello = Hello.new
hello.greet
```
case 4:
```ruby
hello = Hello.new
hello.greet("Goodbye")
```
case 5:
```ruby
Hello.hi
```

ANSWER:

case1:
The code will output `Hello`.

case 2:
The code will throw a `NoMethodError`.

case 3:
The code will throw an `ArgumentError`.

case4:
The code will output `Goodbye`.

case5:
The code will throw a `NoMethodError`.
