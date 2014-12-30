n = 1 
loop do
  n = n + 1
  break if n > 9
end

n = 1 
loop do
  puts n # will display n 1 .. 9
  n = n + 1
  next unless n == 10
  #puts n # will display 10 at the end
  break
end

# Here, control falls through to the break statement only if n == 10 is true. If n == 10 is
# not true (unless n == 10), the next is executed, and control jumps back to the beginning
# of the loop before it reaches break.
#  You can also loop conditionally: while a given condition is true or until a condition
# becomes true. 

n = 1
while n < 11
  puts n 
  n = n + 1
end
puts "Done!"

# As long as the condition n < 11 is true, the loop executes. Inside the loop, n is incremented
# by 1. The eleventh time the condition is tested, it’s false (n is no longer less
# than 11), and the execution of the loop terminates. 

#  There is a difference between putting while at the beginning and putting it at the
# end. If you put while at the beginning, and if the while condition is false, the code
# isn’t executed:
# n = 10
# while n < 10
#  puts n
# end
# Because n is already greater than 10 when the test n < 10 is performed the first time,
# the body of the statement isn’t executed. But if you put the while test at the end
# n = 10
# begin
#  puts n
# end while n < 10
# the number 10 is printed. Obviously n isn’t less than 10 at any point. But because the
# while test is positioned at the end of the statement, the body is executed once before
# the test is performed. 

# THE until KEYWORD
# until is used the same way as while but with reverse logic. Here’s another laborintensive
# way to print out the integers from 1 to 10, this time illustrating the use of
# until:
n = 1
until n > 10
 puts n
 n = n + 1
end
# The body of the loop (the printing and incrementing of n, in this example) is executed
# repeatedly until the condition is true.
#  You can also use until in the post-block position, in conjunction with a begin/
# end pairing. As with while, the block will execute once before the until condition
# is tested.
#  Like their cousins if and unless, while and until can be used in modifier position
# in one-line statements.
# THE while AND until MODIFIERS
# Here’s a slightly shorter way to count to 10, using until in modifier position:
n = 1
n = n + 1 until n == 10
puts "We've reached 10!"
# In place of the until statement, you could also use while n < 10

#  Looping based on a list of values
# Let’s say you want to print a chart of Fahrenheit equivalents of Celsius values. You can
# do this by putting the Celsius values in an array and then looping through the array
# using the for/in keyword pair. The loop runs once for each value in the array; each
# time through, that value is assigned to a variable you specify:

celsius = [0, 10, 20, 30, 40, 50, 60, 70 80, 90, 100]
puts "Celsius\tFahrenheit"
for c in celsius 
  puts "c\t#{Temperature.c2f(c)}"
end

# The body of the loop (the puts statement) runs 11 times. The first time through, the
# value of c is 0. The second time, c is 10; the third time, it’s 20; and so forth.
# for is a powerful tool. Oddly enough, though, on closer inspection it turns out
# that for is just an alternate way of doing something even more powerful…. 