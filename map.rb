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
      @map[i] = 'V'
      i+=1
    end
  end

  def change_map(type, x, y)
    @map[x + (y * 10 - 10)] = type
    show_map()
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
    
    #this needs worked out. map shown is uneven.
    #maybe three spaces for each column? placing
    #building type in the [1] slot

    while i < @map.length + 1
        if i >= 10
          print " #{@map[i]} "
        else  
          print " #{@map[i]} "
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