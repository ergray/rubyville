class Structure

    def initialize(lot)
        @lot = lot
        @cost = 500
        @type = " "
        @neighbors = {}
        @production = {}
    end

    # for a future version
    # as well as a method for roads to find paths from residences to other
    # places (which I will steal from my ign application puzzle)

    # def detect_surroundings()
    #     directions = [@lot-10, @lot-9, @lot+1, @lot+11, @lot+10, @lot+9, @lot-1, @lot-11]

    #     if 

    #     if @lot%10 == 0

    #     elsif 
    #     # check area around structure for other structures
    #     # by lot.
    #       lot+1 == east
    #       lot-1 == west
    #       lot+10 == south
    #       lot-10 == north
    #       lot-9 == ne
    #       lot-11 == nw
    #       lot
    # end

    def show_production()
        return @production
    end

    def show_type()
        return @type
    end

end

class Vacant < Structure

    def initialize(lot)
        @type = " "
        @cost = 0
    end

end

class Industrial < Structure

    def initialize(lot)
        @type = "i"
        @production = {'upkeep' => 50, 'income' => 150, 'happiness' => -0.5}
    end
end

class Road < Structure

    def initialize(lot)
        @type = "l"
        @cost = 10
        @production = {'upkeep' => 5}
    end
end

class Residential < Structure

    def initialize(lot)
        @type = "r"
        @production = {'upkeep' => 50, 'population' => 1}
    end
end

class Commercial < Structure

    def initialize(lot)
        @type = "c"
        @production = {'upkeep' => 50, 'income' => 50, 'happiness' => 2}
    end
end


class Government < Structure

    def initialize(lot)
        @type = "g"
        @production = {'upkeep' => 50, 'income' => -25, 'happiness' => 1}
    end
end