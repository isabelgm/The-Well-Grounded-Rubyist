# Demonstrating the generation of a new local scope per method call

# When you start a definition block (method, class, module), you start a new local
# scope, and you also create a block of code with a particular self. But local scope and
# self don’t operate entirely in parallel, not only because they’re not the same thing but
# also because they’re not the same kind of thing.
#  Consider listing below... This program uses recursion: the instance method x calls itself.
# The point is to demonstrate that every time a method is called—even if a previous call
# to the method is still in the process of running—a new local scope is generated. 

class C
  def x(value_for_a, recurse=false)
    a = value_for_a
    print "Here's the inspect-string for 'self':"
    p self.object_id
    puts "And here's a:"
    puts a
      if recurse
        puts "Recursing by calling myself..."
        x("Second value for a")
        puts "Back after recursion; here's a:"
        puts a.object_id
      end
  end
end

c = C.new
c.x("First value for a", true)

# The instance method C#x takes two arguments: a value to assign to the variable a
# and a flag telling the method whether to call itself B. (The use of the flag provides
# a way to prevent infinite recursion.) The first line of the method initializes a C; the
# next several lines of the method print out the string representation of self and the
# value of a D.
#  Now comes the decision: to recurse, or not to recurse. It depends on the value of
# the recurse variable E. If the recursion happens, it calls x without specifying a value
# for the recurse parameter F; that parameter will default to false, and recursion
# won’t happen the second time through.
#  The recursive call uses a different value for the value_for_a argument; therefore,
# different information will be printed out during that call. But upon returning from
# the recursive call, we find that the value of a in this run of x has not changed G. In
# short, every call to x generates a new local scope, even though self doesn’t change.
#  The output from calling x on an instance of C and setting the recurse flag to true
# H looks like this:
# Here's the inspect-string for 'self':#<C:0x21fea8>
# And here's a:
# First value for a
# Recursing by calling myself...
# Here's the inspect-string for 'self':#<C:0x21fea8>
# And here's a:
# Second value for a
# Back after recursion; here's a:
# First value for a



