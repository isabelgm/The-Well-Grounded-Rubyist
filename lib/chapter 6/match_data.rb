name = "David A. Black"
if m = /la/.match(name)
  puts "Found a match!"

  print "Here's the unmatched start of the string: "
  puts m.pre_match
  print "Here's the unmatched end of the string: "
  puts m.post_match
else
  puts "No match"
end 

# The variable m is assigned in the conditional B and will be nil if there’s no match.
# The deck is stacked in the example, of course: there is a match, so m is a MatchData
# object and can be queried. In the example, we ask it about the parts of the string that
# occurred before and after the matched part of the string, and it gives us the relevant
# substrings.
#  As always, you could rewrite the assignment and the conditional test like this:
# m = /la/.match(name)
# if m
#  # etc.
# You don’t have to combine them into one expression. But at least in this case there’s
# some semantic weight to doing so: the expression may or may not pass the conditional
# test, so it’s reasonable to test it.
#  Although if and friends are Ruby’s bread-and-butter conditional keywords,
# they’re not the only ones. We’ll look next at case statements. 