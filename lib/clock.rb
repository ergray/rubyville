class Clock

    # pretty basic right now
    # simulated time - having trouble
    # figuring out how to do real time

    def initialize()
        @time = 0
    end

    def show_time()
        return @time
    end

    def increase_time(amount)
        @time += amount
    end

    def check_tic()
        if @time != 0 && @time % 4 == 0
            return true
        else
            return false
        end
    end
    
end