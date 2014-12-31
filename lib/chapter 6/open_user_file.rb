def open_user_file
  print "File to open: "
  filename = gets.chomp
  fh = File.open(filename)
  yield fh
  fh.close
rescue
  puts "Couldn't open your file!"
end

# if the file opening operation triggers an exception, control jumps directly
# to the rescue clause. The def/end keywords serve to delimit the scope of the
# rescue operation.

def open_user_file
  print "File to open: "
  filename = gets.chomp
  begin
    fh = File.open(filename)
  rescue
    puts "Couldn't open your file!"
    return
  end
  yield fh
  fh.close
end

#In this version teh rescue clause governs what comes between the begin keyword and rescue. Moreover, 
# it's necessary to give an explicit return command in side the rescue clause because otherwise the 
# method will continue to execute. 

#  Here’s a second version of the begin/end block from the open_user_file method
# a few examples back. This version assumes that you have a logfile method that
# returns a writeable file handle on a log file:

# begin 
#   fh = File.open(filename)
# rescue => e 
#   logfile.puts("User tried to open #{filename}, #{Time.now}")
#   logfile.puts("Exception: #{e.message}")
#   raise
# end

# The idea here is to intercept the exception, make a note of it in the logfile, and then
# re-raise it by calling raise. (Even though there’s no argument to raise, from inside a
# rescue clause it figures out that you want to re-raise the exception being handled and
# not the usual generic RuntimeError.) The spot in the program that called
# open_user_file in the first place then has to handle the exception—or not, if it’s better
# to allow it to stop program execution. 