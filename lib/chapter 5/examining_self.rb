#self in class, module and method definitions

class C
  puts "Just started class C"
  puts self

  module M
    puts "Nested module C::M: "
    puts self
  end
  puts "Back in the outer level of C: "
  puts self
end

#self in instance method definitions

class D
  def x
    puts "Class D, method x: "
    puts self
  end
end

d = D.new
d.x
puts "That was a call to x by : #{d}"

#self in singleton method and class method definitions

obj = Object.new
def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end

obj.show_me
puts "Back from call to show_me by #{obj}"

#self from inside a class method of include E

class E
  def E.x 
    puts "Class method of class E"
    puts "self: #{self}"
  end
end

E.x


#Using self instead of hard-coded class names

class F
  def self.x
    puts "Class method of class F"
    puts "self: #{self}"
  end
end

F.x

class G < F
end

G.x

# G gets to call x, because subclasses get to call the class methods of their superclasses.
# As you’ll see if you run the code, the method F.x reports self—correctly—
# as being G, because it’s G on which the method is called. 