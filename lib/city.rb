require 'map.rb'
require 'structure.rb'

class City

    def initialize(map)
        @map = map
        @costs = {'i' => 500, 'c' => 500, 'r' => 500, 'g' => 1000, 'l' => 50}
        @values = {'upkeep' => 0, 'income' => 0, 'population' => 0, 'happiness' => 0, 'money' => 10000}
    end

    def adjust_money(type)
        @values['money'] -= @costs[type]
    end

    def show_money()
        return @values['money']
    end

    def prompt_values()
        return @values
    end    

    def adjust_values(building)
        values = building.show_production()

        values.each_key do |value|
            @values[value] += values[value]
        end
        
    end

    def show_map()
        @map.show_map()
    end

    # Retrieve production values from entire map
    # replace current values with new values

    # Potential changes:
    #  Have a structure add to value only once when it is created
    #  to avoid cycling through the map each time

    # I think I dislike this in general (current implementation)
    # Currently player does not see what's coming until it's there
    # which doesn't feel great for planning anything and makes it
    # unobvious where exactly their changes are coming from.
    # I think above idea is better suited; adding to the prompt
    # immediately, but ticking just once every four actions

    def produce()
    #    produce = @map.return_production()
    #    produce.each_key do |value|
    #     # Previously this was cummulative which was ending up with
    #     # one structure counting its value multiple times
    #     #    @values[value] = (produce[value] + @values[value])
    #        @values[value] = produce[value]
    #    end
       @values['money'] += (@values['income'] - @values['upkeep'])
    end
    
    def check_build(type, x, y, resources)
      
      building = {}
      build_location = (x + (y * 10 - 10))

      if x > 10 || x < 1 || y > 10 || y < 1
          puts "Sorry, that's out of bounds of your city!"  
          return false
      elsif type.length > 1 || ['i', 'c', 'r', 'g', 'l'].include?(type) == false
          puts "#{type} is not a building! Please see \'help\' for information.\n"
          return false      
      elsif (x * y) < 1 || (x * y) > 100
        puts "Invalid Location\n"
        return false
      elsif resources - @costs[type] < 0
        puts "Sorry, you don't have enough money!"
        return false
      else
        if type == 'i'
            building = Industrial.new(build_location)
        elsif type == 'c'
            building = Commercial.new(build_location)
        elsif type == 'l'
            building = Road.new(build_location)
        elsif type == 'r'
            building = Residential.new(build_location)
        elsif type == 'g'
            building = Government.new(build_location)
        end
        @map.change_map(building, build_location)
        adjust_money(type)
        adjust_values(building)
      end

    end

end