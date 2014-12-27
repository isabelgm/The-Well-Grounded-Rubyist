# Calling methods (that is, sending messages to objects) usually involves the dot notation:

# obj.talk
# ticket.venue
# "abc".capitalize

# That’s the normal, full form of the method-calling syntax in Ruby. But a special rule
# governs method calls: if the receiver of the message is self, you can omit the receiver
# and the dot. Ruby will use self as the default receiver, meaning the message you send
# will be sent to self, as the following equivalencies show:

# talk - same as self.talk
# venue - same as self.venue
# capitalize - same as self.capitalize

# WARNING You can give a method and a local variable the same name, but it’s rarely
# if ever a good idea. If both a method and a variable of a given name exist,
# and you use the bare identifier (like talk), the variable takes precedence.
# To force Ruby to see the identifier as a method name, you’d have
# to use self.talk or call the method with an empty argument list:
# talk(). Because variables don’t take arguments, the parentheses establish
# that you mean the method rather than the variable. Again, it’s best to
# avoid these name clashes if you can. 

class C
  def C.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end
  no_dot
end

C.no_dot

class D
  def x
    puts "This is method 'x'"
  end
  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end

d = D.new
d.y

# There’s one situation where you can’t omit the object-plus-dot part of a method
# call: when the method name ends with an equal sign—a setter method, in other words.
# You have to do self.venue = "Town Hall" rather than venue = "Town Hall" if you want
# to call the method venue= on self. The reason is that Ruby always interprets the
# sequence identifier = value as an assignment to a local variable. To call the method
# venue= on the current object, you need to include the explicit self. Otherwise, you
# end up with a variable called venue and no call to the setter method.


# The default to self as receiver for dotless method invocations allows you to streamline
# your code nicely in cases where one method makes use of another. A common
# case is composing a whole name from its components: first, optional middle, and last.
# Listing 5.2 shows a technique for doing this, using attributes for the three name values
# and conditional logic to include the middle name, plus a trailing space, if and only if
# there is a middle name. 

# Composing whole name from values, using method calls on implicit self

class Person 
  attr_accessor :first_name, :middle_name, :last_name

  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end

huy = Person.new
huy.first_name = "Huy"
huy.last_name = "Le"

puts "Huy's whole name: #{huy.whole_name}"
huy.middle_name = "Quoc"

puts "Huy's whole name is: #{huy.whole_name}"
