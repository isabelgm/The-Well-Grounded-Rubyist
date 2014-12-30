def my_loop
  while true
    yield
  end
end

#or even shorter

def my_shorter_loop
  yield while true
end

# then you can call it just like you call 'loop'

# my_shorter_loop { puts "My_shorter_loop'ing forever!"}

#  By providing a code block, you’re giving my_loop something—a chunk of code—to
# which it can yield control. When the method yields to the block, the code in the block
# runs, and then control returns to the method. Yielding isn’t the same as returning
# from a method. Yielding takes place while the method is still running. After the code
# block executes, control returns to the method at the statement immediately following
# the call to yield.
#  The code block is part of the method call—part of its syntax. This is an important
# point: a code block isn’t an argument. The arguments to methods are the arguments.
# The code block is the code block. They’re two separate constructs. You can
# see the logic behind the distinction if you look at the full picture of how method
# calls are put together. 