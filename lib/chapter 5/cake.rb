#Deploying method-access rules
#Private methods 

class Cake

  def initialize(batter)
    @batter = batter
    @baked = true
  end

end

class Egg
end

class Flour
end

class Baker

  def bake_cake
    @batter = []
    pour_flour
    add_egg
    stir_batter
    return Cake.new(@batter)
  end

  def pour_flour
    @batter.push(Flour.new)
  end

  def add_egg
    @batter.push(Egg.new)
  end

  def stir_batter
  end

  private :pour_flour, :add_egg, :stir_batter

end

# There’s something new in this code: the private method B, which takes as arguments
# a list of the methods you want to make private. (If you don’t supply any arguments,
# the call to private acts like an on switch: all the instance methods you define
# below it, until you reverse the effect by calling public or protected, will be private.)
#  Private means that the method can’t be called with an explicit receiver. You can’t say
# b = Baker.new
# b.add_egg
# As you’ll see if you try it, calling add_egg this way results in a fatal error. add_egg is a
# private method, but you’ve specified the receiving object (b) explicitly. That’s not
# allowed.
#  OK; let’s go along with the rules. We won’t specify a receiver. We’ll just say
# add_egg
# But wait. Can we call add_egg in isolation? Where will the message go? How can a
# method be called if there’s no object handling the message?
#  A little detective work will answer this question.
#  If you don’t use an explicit receiver for a method call, Ruby assumes that you want
# to send the message to the current object, self. Thinking logically, you can conclude
# that the message “add_egg” has an object to go to only if self is an object that responds
# to “add_egg.” In other words, you can only call the add_egg instance method of Baker
# when self is an instance of Baker.
#  And when is self an instance of Baker?
#  When any instance method of Baker is being executed. Inside the definition of
# bake_cake, for example, you can call add_egg, and Ruby will know what to do. Whenever
# Ruby hits that call to add_egg inside that method definition, it sends the message
# add_egg to self, and self is a Baker object. 


# Private and singleton are different
# It’s important to note the difference between a private method and a singleton method.
# A singleton method is “private” in the loose, informal sense that it belongs to
# only one object, but it isn’t private in the technical sense. (You can make a singleton
# method private, but by default it isn’t.) A private, non-singleton instance method, on
# the other hand, may be shared by any number of objects but can only be called under
# the right circumstances. What determines whether you can call a private method isn’t
# the object you’re sending the message to, but which object is self at the time you
# send the message. 


# It comes down to this: by tagging add_egg as private, you’re saying the Baker object
# gets to send this message to itself (the baker can tell himself or herself to add an egg
# to the batter), but no one else can send the message to the baker (you, as an outsider,
# can’t tell the baker to add an egg to the batter). Ruby enforces this privacy through
# the mechanism of forbidding an explicit receiver. And the only circumstances under
# which you can omit the receiver are precisely the circumstances in which it’s OK to call
# a private method. 