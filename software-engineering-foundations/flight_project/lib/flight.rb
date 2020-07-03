class Flight
  attr_reader :passengers

  def initialize(str, num)
    @flight_number = str
    @capacity = num
    @passengers = []
  end

  def full?
    !(@passengers.length < @capacity)
  end

  def board_passenger(passenger)
    if !self.full? && passenger.has_flight?(@flight_number)
      @passengers << passenger
    end
  end

  def list_passengers
    @passengers.map { |passenger| passenger.name }
  end

  def [](idx)
    @passengers[idx]
  end

  def <<(passenger)
    self.board_passenger(passenger)
  end
end