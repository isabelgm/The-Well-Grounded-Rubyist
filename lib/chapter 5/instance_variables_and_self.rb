class C
  puts "Just inside class definition block. Here's self: "
  p self

  @v = "I am an instance variable at the top level of a class body."
  puts "And here's the instance variable @v, belonging to #{self}: "
  p @v

  def show_var
    puts "Inside an instance method definition block. Here's self: "
    p self
    puts "And here's the instance variable @v, belonging to #{self}: "
    p @v
  end
end

c = C.new
c.show_var

# Sure enough, each of these two different objects (the class object C and the instance
# of C, c) has its own instance variable @v. The fact that the instance’s @v is nil demonstrates
# that the assignment to the class’s @v had nothing to do with the instance’s @v.
#  Understanding self—both the basic fact that such a role is being played by some
# object at every point in a program and knowing how to tell which object is self—is one
# of the most vital aspects of understanding Ruby. Another equally vital aspect is understanding
# scope, to which we’ll turn now. 