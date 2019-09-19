class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tom = AngryCat.new(8, 'Tom')
garfield = AngryCat.new(15, 'Garfield')

tom.age
tom.name

garfield.age
garfield.name
