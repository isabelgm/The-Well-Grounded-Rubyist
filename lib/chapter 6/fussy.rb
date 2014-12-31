# To assign the exception object to a variable, you use the special operator => along with
# the rescue command. The exception object, like any object, responds to messages.
# Particularly useful are the backtrace and message methods. backtrace returns an
# array of strings representing the call stack at the time the exception was raised:
# method names, filenames, and line numbers, showing a full roadmap of the code that
# was executed along the way to the exception. message returns the message string provided
# to raise, if any

def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end

begin
  fussy_method(20)
rescue ArgumentError => e 
  puts "That was not an acceptable number!"
  puts "Here's the backtrace for this exception: "
  puts e.backtrace
  puts "And here's the exception object's message: "
  puts e.message
end

# In the rescue clause, we assign the exception object to the variable e B and then ask
# the exception object to display its backtrace C and its message D. Assuming you’ve
# got one blank line between fussy_method and the begin keyword, you’ll see the following
# output (and, in any case, you’ll see something almost identical, although the
# line numbers may differ) when you run fussy.rb: 