# A protected method is like a slightly kinder, gentler private method. The rule for protected
# methods is as follows: you can call a protected method on an object x, as long as
# the default object (self) is an instance of the same class as x or of an ancestor or
# descendant class of x’s class.
#  This rule sounds convoluted. But it’s generally used for a particular reason: you
# want one instance of a certain class to do something with another instance of its class.

class C

  def initialize(n)
    @n = n
  end

  def n
    @n
  end

  def compare(c)
    if c.n > n
      puts "The other object's n is bigger."
    else
      puts "The other object's n is the same or smaller."
    end
  end

  protected :n

end

c1 = C.new(100)
c2 = C.new(101)

c1.compare(c2)

# The goal in listing 5.9 is to compare one C instance with another C instance. The comparison
# depends on the result of a call to the method n. The object doing the comparing
# (c1, in the example) has to ask the other object (c2) to execute its n method.
# Therefore, n can’t be private.
#  That’s where the protected level comes in. With n protected rather than private, c1
# can ask c2 to execute n, because c1 and c2 are both instances of the same class. But if
# you try to call the n method of a C object when self is anything other than an instance
# of C (or of one C’s ancestors or descendants), the method fails.
#  A protected method is thus like a private method, but with an exemption for cases
# where the class of self (c1) and the class of the object having the method called on it
# (c2) are the same or related by inheritance. 


# Inheritance and method access
# Subclasses inherit the method-access rules of their superclasses. Given a class C
# with a set of access rules, and a class D that’s a subclass of C, instances of D exhibit
# the same access behavior as instances of C. But you can set up new rules inside the
# class definition of D, in which case the new rules take precedence for instances of D
# over the rules inherited from C.