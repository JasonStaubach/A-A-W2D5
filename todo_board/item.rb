class Item
    def self.valid_date?(date_str)
        dateArr = date_str.split("-")
        return false if dateArr.length != 3
        return false if dateArr[1].to_i < 1 || dateArr[1].to_i > 12
        return false if dateArr[2].to_i < 1 || dateArr[2].to_i > 31
        true 
    end

end


puts Item.valid_date?('2019-10-25') # true
puts Item.valid_date?('1912-06-23') # true
puts Item.valid_date?('2018-13-20') # false
puts Item.valid_date?('2018-12-32') # false
puts Item.valid_date?('10-25-2019') # false