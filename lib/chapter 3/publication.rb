#This illustrates "Inheritance"
#Ruby classes can only inherit from one superclass - single inheritance

class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

mag = Magazine.new
mag.publisher = "David A. Black"
mag.editor = "Joe Smith"
puts "Mag is published by #{mag.publisher}, and edited by #{mag.editor}."


class Person
  def species
    "Homo Sapiens"
  end
end

class Rubyist < Person
end

david = Rubyist.new
puts david.species

#example of Class.new with a block
c = Class.new do 
  def say_hello
    puts "Hello!"
  end
end
#if an instance of the class (with c.new), you'll be able to call the method say_hello on that instance