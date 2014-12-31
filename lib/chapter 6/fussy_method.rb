# To raise an exception, you use raise plus the name of the exception you wish to
# raise. If you don’t provide an exception name (and if you’re not re-raising a different
# kind of exception, as described in section 6.4.4), Ruby raises the rather generic
# RuntimeError. You can also give raise a second argument, which is used as the message
# string when the exception is raised:

def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end

#fussy_method(20)

# You can also use rescue in such a case:

begin 
  fussy_method(20)
rescue ArgumentError
  puts "That was not an acceptable number!"
end

# By only rescuing ArgumentError, you ensure that if anything else goes wrong and
# some other exception is raised, you won’t trap it. That way, you don’t inadvertently
# mask problems by rescuing excessively.
#  A nice tweak is that if you give raise a message as the only argument, rather than
# as the second argument where an exception class is the first argument, raise figures
# out that you want it to raise a RuntimeError using the message provided. These two
# lines are equivalent:

raise "Problem!"
raise RuntimeError, "Problem!"