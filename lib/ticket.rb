class Ticket

  attr_reader :venue, :date
  attr_accessor :price 

  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100
  end

end