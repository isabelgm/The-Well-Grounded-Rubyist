class Array

  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1
    end
    self
  end

end

array = [1,2,3,4,5]

array.my_each{|e| puts "The block just got handed #{e}."}


# define my_each in terms of my_times

class Array

  #  def my_times
  #   c = 0
  #   until c == self
  #     yield(c)
  #     c += 1
  #   end
  #   self
  # end

  # def my_each
  #   size.my_times do |i|
  #     yield self |i|
  #   end
  #   self
  # end

end

# Using my_times saves you the trouble of writing loop-counter code in my_each. But
# it’s a bit backward: many of Ruby’s iterators are built on top of each, not the other
# way around. Given the definition of my_each in the main text, how would you use it in
# an implementation of my_times? 