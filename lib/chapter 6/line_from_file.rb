# The ensure clause
# Let’s say you want to read a line from a data file and raise an exception if the line
# doesn’t include a particular substring. If it does include the substring, you want to
# return the line. If it doesn’t, you want to raise ArgumentError. But whatever happens,
# you want to close the file handle before the method finishes.
#  Here’s how you might accomplish this, using an ensure clause:

def line_from_file(filename, pattern)
  fh = File.open(filename)
  begin 
    line = fh.gets
    raise ArgumentError unless line.include?(pattern)
  rescue ArgumentError
    puts "Invalid line!"
    raise 
  ensure
    fh.close
  end
  return line
end

# In this example, the begin/end block wraps the line that reads from the file, and the
# rescue clause only handles ArgumentError—which means that if something else goes
# wrong (like the file not existing), it isn’t rescued. But if ArgumentError is raised based
# on the test for the inclusion of the substring pattern in the string line, the rescue
# clause is executed.
#  Moreover, the ensure clause is executed whether an exception is raised or not.
# ensure is pegged to the begin/end structure of which it’s a part, and its execution is
# unconditional. In this example, we want to ensure that the filehandle gets closed. The
# ensure clause takes care of this, whatever else may have happened. 

# There’s a better way to open a file: involving a code block that wraps the
# file operations and takes care of closing the file for you. But one thing at
# a time; you’ll see that technique when we look at file and I/O techniques
# in chapter 12. 