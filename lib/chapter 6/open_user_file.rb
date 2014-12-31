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