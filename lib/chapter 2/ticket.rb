class Ticket

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