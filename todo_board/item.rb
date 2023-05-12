class Item
    def self.valid_date?(date_str)
        dateArr = date_str.split("-")
        return false if dateArr.length != 3
        return false if dateArr[1].to_i < 1 || dateArr[1].to_i > 12
        return false if dateArr[2].to_i < 1 || dateArr[2].to_i > 31
        true 
    end

    attr_reader :deadline
    attr_accessor :title, :discription

    def initialize(title, deadline, discription)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise "invalid date"
        end
        @discription = discription
    end

    def deadline=(new_dl)
        if Item.valid_date?(new_dl)
            @deadline = new_dl
        else
            raise "invalid date"
        end
    end

end

