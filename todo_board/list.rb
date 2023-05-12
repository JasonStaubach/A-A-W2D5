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

    def print
        puts "-" * 35
        puts " " * 7 + "GROCERIES"
        puts "-" * 35
        puts "Index | Item            | Deadline"
        puts "-" * 35
        (0...self.size).each do |i|
            puts i.to_s.ljust(6) + "| " +  @items[i].title.ljust(16) + "|"+ @items[i].deadline
        end
    end

    def print_full_item(i)
        return nil if !self.valid_index?(i)
        puts "-" * 35
        puts @items[i].title.ljust(20) + @items[i].deadline
        puts @items[i].discription
        puts "-" * 35
    end

    def print_priority
        print_full_item(0)
    end

    def up(i, amount = 1)
        return false if !valid_index?(i)
        while amount > 0 && i > 0
            @items[i],@items[i-1] = @items[i-1],@items[i]
            amount -= 1
            i -= 1
        end
        true
    end

    def down(i, amount = 1)
        return false if !valid_index?(i)
        while amount > 0 && i < @items.length - 1
            @items[i],@items[i+1] = @items[i+1],@items[i]
            amount -= 1
            i += 1
        end
        true
    end 

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end


end

# i = List.new('help')
# i.add_item("chores","2023-5-5","wash the dishes")
# i.add_item("steam", "2021-11-12")
# i.add_item("invaliddate", "12-2-12", "haha")

# i.print
# i.print_full_item(0)
# i.print_priority
# print i.size
# puts
# print i.valid_index?(0)
# print i.valid_index?(2)
# print i.valid_index?(3)
# print i.valid_index?(-1)
# puts
# print i.swap(1,2)
# print i.swap(0,3)
# print i.swap(-1,1)
# print i.swap(2,2)
# puts
# print i[1]
# print i[-1]
# print i[2]
# print i[4]
# puts
# print i.priority
