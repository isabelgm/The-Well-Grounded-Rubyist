class Ticket

  def initialize(venue, date, price)
    @venue = venue
    @date = date
    @price = price
  end

  def venue
    @venue
  end

  def date
    @date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100
  end

  def price
    @price
  end

end