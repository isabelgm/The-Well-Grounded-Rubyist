class Ticket

  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]  #Constants begin with a capital letter. You assisgn to constants much as you do to variables. 

  attr_reader :venue, :date
  attr :price, true

  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100
  end

  def Ticket.most_expensive(*tickets) #this is a singleton method defined on a class object. This goes to the class Ticket and not to a particular ticket.
    tickets.max_by(&:price)
  end

end

th = Ticket.new("Town Hall","11/12/13")
cc = Ticket.new("Convention Center","12/13/14/")
fg = Ticket.new("Fairgrounds", "13/14/15/")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)
puts "The highest-priced ticket is the one for #{highest.venue}."


# puts "Testing the response of a ticket instance... "
# wrong = fg.most_expensive


# Remember: 
#   1. Classes are objects.
#   2. Instances of classes are objects too
#   3. A class object (like Ticket) has its own methods, its own state, its own identity. 
#      It doesn't share these things with instances of itself. 
#      Sending a message to Ticket isn't the same thing as sending a message to fg or cc or any other instance ticket. 

puts "We've closed Class definition"
puts "So we have to use the path notation (::) to reach the constant"
puts "the venues are:"
puts Ticket::VENUES

# The double colon notation pinpoints the constant VENUES inside teh class known by the constant Ticket, and the list of venues is printed out. 

venues = Ticket::venues
venues << "High School Gym"
