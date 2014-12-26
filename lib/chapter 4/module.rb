# modules get mixed in to classes (sometimes referred to as mixins) by using the include method
# stack is data structure that operates on a last in first out (LIFO) manner. 
# stacks are usually discussed with queues which exhibit first in first out behaviour (FIFO)
# eg cafeteria, plates are in a stack, customers are in a queue. 
# When designing a program, and identify set of behaviour(s) that may be exhibited by more than one kind of entity or object, good candidate to use a module. 

module MyFirstModule

  def say_hello
   puts "hello"
  end

end 

class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.say_hello