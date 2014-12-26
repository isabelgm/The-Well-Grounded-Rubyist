#using 'super' to wrap a method in a subclass

class Bicycle

  attr_reader :gears, :wheels, :seats

  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end

end

class Tandem < Bicycle

  def initialize(gears = 3)
    super
    @seats = 2
  end

end

# super provides a super provides a nice clean way to make a tandem almost like a bicycle. We change
# only what needs to be changed (the number of seats); and super triggers the earlier
# initialize method, which sets bicycle-like default values for the other properties
# of the tandem.

t = Tandem.new(:gears)

puts t