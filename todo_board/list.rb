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

end

i = List.new('help')
i.add_item("chores","2023-5-5","wash the dishes")
i.add_item("steam", "2021-11-12")
i.add_item("invaliddate", "12-200-12", "haha")

print i