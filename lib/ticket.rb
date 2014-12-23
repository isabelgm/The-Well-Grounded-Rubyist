class Ticket

  attr_reader :venue, :date, :price
  attr_writer :price 

  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100
  end

end