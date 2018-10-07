require './map'

class City

    def initialize(map)
        @map = map
        @money = 10000
        @costs = {'i' => 500, 'c' => 500, 'r' => 500, 'g' => 1000, 'l' => 50}
    end

    def adjust_money(type)
        @money -= @costs[type]
        puts "#{@money}"
    end

    def show_money()
        return @money
    end

    def build(type, x, y, resources)
    
      if type.length > 1 || ['i', 'c', 'r', 'g', 'l'].include?(type) == false
          puts "#{type} is not a building! Please see \'help\' for information.\n"
          return false      
      elsif (x * y) < 1 || (x * y) > 100
        puts "Invalid Location\n"
        return false
      elsif resources - @costs[type] >= 0
        return true
      else
        return false
      end

    end

end