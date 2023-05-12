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
    
        if passenger.has_flight?(@flight_number)
            return nil if self.full?

            @passengers << passenger
        end
    end

    def list_passengers
        (0...@passengers.length).map {|i| @passengers[i].name}
    end

    def [](index)
        @passengers[index]
    end


end