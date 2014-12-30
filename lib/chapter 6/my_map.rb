# class Array

#   def my_map
#     c = 0
#     acc = []
#     until c == size
#       acc << yield(self[c])
#       c += 1
#     end
#     acc
#   end

# end

# names = ["huy", "quoc", "le"]
# p names.my_map {|name| name.upcase}
# puts names.my_map {|name| name.upcase}

# Like my_each, my_map yields each element of the array in turn. Unlike my_each,
# my_map stores the value that comes back from the block. That’s how it accumulates the
# mapping of the old values to the new values: the new values are based on the old values,
# processed through the block.

class Array

  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1
    end
    self
  end

  def my_map
    acc = []
    my_each {|e| acc << yield(e) }
    acc
  end

end

names = ["huy", "quoc", "le"]
p names.my_map {|name| name.upcase}
puts names.my_map {|name| name.upcase}