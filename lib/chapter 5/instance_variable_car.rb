class Car

  @@makes = []
  @@cars = {}

  attr_reader :make

  def self.total_count
    @total_count ||= 0
  end

  def self.total_count=(n)
    @total_count = n
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end

end

class Hybrid < Car
end

Car.add_make("Honda")
Car.add_make("Ford")

h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

h3 = Hybrid.new("Honda")
f2 = Hybrid.new("Ford")

puts "There are #{Hybrid.total_count} hybrids on the road!"


# The key here is storing the counter in an instance variable and wrapping it in accessor
# methods—manually written ones, but accessor methods nonetheless. We’ve added the
# methods Car.total_count and Car.total_count=. The first of these two methods
# performs the task of initializing @total_count to zero B. It does the initialization
# conditionally, using the “or equals” operator, so that on the second and subsequent
# calls to total_count, the instance variable is already initialized and is returned.
#  The total_count= method is an attribute-writer method, likewise written as a class
# method so that the object whose instance variable is in use is the class object C. With
# these methods in place, we can now increment the total count from inside the
# instance method initialize by calling self.class.total_count= D.
#  The payoff comes when we subclass Car. Let’s have another look at Hybrid and
# some sample code that uses it:
# class Hybrid < Car
# end
# h3 = Hybrid.new("Honda")
# f2 = Hybrid.new("Ford")
# puts "There are #{Hybrid.total_count} hybrids on the road!"
# Hybrid is a new class object. It isn’t the same object as Car. Therefore, it has its own
# instance variables. When we create a new Hybrid instance, the initialize method from
# Car is executed. But this time, the expression
# self.class.total_count += 1
# has a different meaning. The self here is Hybrid, not Car. That means when the
# total_count= class method is executed, the instance variable @total_count belongs
# to Hybrid. (Instance variables always belong to self.) Adding to Hybrid’s total count
# therefore won’t affect Car’s total count.

# We’ve brought it about that a subclass of Car can maintain its own state, because
# we’ve shifted from a class variable to an instance variable. Every time total_count or 
# total_count= is called, the @total_count to which it refers is the one belonging to
# self at that point in execution. Once again, we’re back in business using instance variables
# to maintain state per object (class objects, in this case).
#  The biggest obstacle to understanding these examples is the fact that classes are
# objects. Car and Hybrid not only don’t share instance variables with each other, but
# also don’t share them with their own instances. Every object, whether it’s a car, a person,
# or a class, gets to have its own stash of instance variables. 