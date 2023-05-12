require_relative "item.rb"
require 'byebug'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, discription = " ")
        return false if !Item.valid_date?(deadline)

        @items << Item.new(title, deadline, discription)
        true
    end

    def size
        @items.length
    end

    def valid_index?(n)
        n >= -self.size && n < self.size
    end

    def swap(i1, i2)
        if valid_index?(i1) && valid_index?(i2)
            @items[i1],@items[i2] = @items[i2],@items[i1]
            return true
        end
        false
    end

    def [](i)
        if valid_index?(i)
            return @items[i]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end


end

i = List.new('help')
i.add_item("chores","2023-5-5","wash the dishes")
i.add_item("steam", "2021-11-12")
i.add_item("invaliddate", "12-2-12", "haha")

print i.size
puts
print i.valid_index?(0)
print i.valid_index?(2)
print i.valid_index?(3)
print i.valid_index?(-1)
puts
print i.swap(1,2)
print i.swap(0,3)
print i.swap(-1,1)
print i.swap(2,2)
puts
print i[1]
print i[-1]
print i[2]
print i[4]
puts
print i.priority
