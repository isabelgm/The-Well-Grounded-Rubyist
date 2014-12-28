# CLASS VARIABLES ACROSS CLASSES AND INSTANCES
# At its simplest, the idea behind a class variable is that it provides a storage mechanism
# that’s shared between a class and instances of that class, and that’s not visible to any
# other objects. No other entity can fill this role. Local variables don’t survive the scope
# change between class definitions and their inner method definitions. Globals do, but
# they’re also visible and mutable everywhere else in the program, not just in one class.
# Constants likewise: instance methods can see the constants defined in the class in
# which they’re defined, but the rest of the program can see those constants, too.
# Instance variables, of course, are visible strictly per object. A class isn’t the same object
# as any of its instances, and no two of its instances are the same as each other. Therefore
# it’s impossible, by definition, for a class to share instance variables with its instances.
#  So class variables have a niche to fill: visibility to a class and its instances, and to no
# one else. Typically, this means being visible in class-method definitions and instancemethod
# definitions, and sometimes at the top level of the class definition. 

# keeping track of car manufacturing statistics with class variables 

class Car

  @@makes = []
  @@cars = {}
  @@total_count = 0

  attr_reader :make

  def self.total_count
    @@total_count
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
      @@total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end

end

Car.add_make("Honda")
Car.add_make("Ford")

h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

puts "Counting cars of same make as h2..."
puts "There are #{h2.make_mates}"

puts "Counting total cars..."
puts "There are #{Car.total_count}."