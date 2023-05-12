class Passenger
    attr_reader :name
    
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        @flight_numbers.include?(str)
    end
end