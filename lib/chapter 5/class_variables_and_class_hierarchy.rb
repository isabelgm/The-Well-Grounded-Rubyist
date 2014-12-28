class Parent
  @@value = 100
end

class Child < Parent
  @@value = 200
end

class Parent
  puts @@value
end

# What gets printed is 200. The Child class is a subclass of Parent, and that means
# Parent and Child share the same class variables—not different class variables with the
# same names, but the same actual variables. When you assign to @@value in Child,
# you’re setting the one and only @@value variable that’s shared throughout the hierarchy—that
# is, by Parent and Child and any other descendant classes of either of them.
# The term class variable becomes a bit difficult to reconcile with the fact that two (and
# potentially a lot more) classes share exactly the same ones. 

# Class variables are popular because they’re the easiest way to distribute data
# in that configuration. 