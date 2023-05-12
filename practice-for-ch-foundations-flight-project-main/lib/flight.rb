class Flight
    attr_reader :passengers
    
    def initialize(flightN, cap)
        @flight_number = flightN
        @capacity = cap
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(passenger)
        return if self.full?

    end

end