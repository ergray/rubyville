require 'structure.rb'

class Map

  def initialize()
    @map = {}
    create_map()
  end

  def create_map()
    i = 1
    #fill up a map with values
    #eventually should take values for variable map sizes
    while i < 101
      @map[i] = Vacant.new(i)
      i+=1
    end
  end

  def change_map(type, location)
    @map[location] = type
    show_map()
  end


#   Loop through each structure in a map so long as it isn't vacant
#   Find its production values and add them to the list @values and
#   return them

  def return_production()
      @values = {'upkeep' => 0, 'income' => 0, 'happiness' => 0, 'population' => 0}
      @map.each do |map|
        if map[1].show_type != " "
            @items = map[1].show_production()
            @items.each_key { |key| @values[key] = (@items[key] + @values[key]) } 
        else
          next
        end
      end
      return @values
  end


  def show_map()
    
    i = 0
    y = 1
    x = 1
    
    puts "\n"
    print "   "
    
    while x < 11
        if (x < 10)
          print " #{x} "
        elsif (x >= 10)
          print " #{x}"
        end
        x+=1
    end
    
    # Fixed
    #this needs worked out. map shown is uneven.
    #maybe three spaces for each column? placing
    #building type in the [1] slot


    while i < @map.length + 1
        if i == 0
            print "\n"
            print " #{y} "
            i+=1
            y+=1
            next
        elsif i >= 10
          print " #{@map[i].show_type()} "
        else
          print " #{@map[i].show_type()} "
        end
        if i % 10 == 0 && i != 100
            print "\n"
            if y < 10
              print " #{y} "
            elsif y >= 10
              print " #{y}"
            end
            y+=1
        end

        i += 1
    end
    print "\n\n"
  end
  
end