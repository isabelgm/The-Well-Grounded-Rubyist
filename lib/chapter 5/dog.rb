# PRIVATE SETTER (=) METHODS
# The implementation of private access through the “No explicit receiver” rule runs
# into a hitch when it comes to methods that end with equal signs. As you’ll recall, when
# you call a setter method, you have to specify the receiver. You can’t do this
# dog_years = age * 7
# because Ruby will think that dog_years is a local variable. You have to do this:
# self.dog_years = age * 7
# But the need for an explicit receiver makes it hard to declare the method dog_years=
# private, at least by the logic of the “No explicit receiver” requirement for calling private
# methods.
#  The way out of this conundrum is that Ruby doesn’t apply the rule to setter methods.
# If you declare dog_years= private, you can call it with a receiver—as long as the
# receiver is self. It can’t be another reference to self; it has to be the keyword self.
#  Here’s an implementation of a dog-years-aware Dog:

class Dog
  attr_reader :age, :dog_years

  def dog_years=(years)
    @dog_years = years
  end

  def age=(years)
    @age = years
    self.dog_years = years * 7
  end

  private :dog_years=

end

rover = Dog.new
rover.age = 10

puts "Rover is #{rover.dog_years} in dog years."