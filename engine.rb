class Engine

  def initialize(map, city)
    @map = map
    @city = city
    #this needs a better name, confusing
    @game_running = false
    start()
  end

  def show_prompt()
    while true

      if @game_running == true
        print "$#{@city.show_money()} :>"
      else
        print ":>"
      end

      prompt = $stdin.gets.chomp.scan(/\w+/)

      if prompt[0] == "start" && @game_running == false
          start_game()
      elsif prompt[0] == "start" && @game_running == true
          puts "The game is already started!"
      elsif prompt[0] == "quit"
          exit(0)
      elsif prompt[0] == "map" && @game_running == true
        @map.show_map()
      elsif prompt[0] == "build"
        if @city.build(prompt[1].downcase, prompt[2].to_i, prompt[3].to_i, @city.show_money()) == true
            # adjust map
            @map.change_map(prompt[1].downcase, prompt[2].to_i, prompt[3].to_i)
            # adjust resources
            @city.adjust_money(prompt[1].downcase)
        end
      elsif prompt[0] == "help"
          show_help()
      end
    end
  end

  def start()
    puts '''



    ~~~~~~~~~~~~~~~~Rubyville~~~~~~~~~~~~~~~~

                Use your money to
                build a working city!

                Type in \'start\' to
                begin the game.

                Type in \'help\' for
                a list of commands.



    '''
  end

  def start_game()
    @game_running = true
    @map.show_map()
  end


  def show_help()
    puts '''
    ()-----------------------------------------------()
    |                                                 | 
    |            Rubyville!                           |
    |                                                 |
    |            Commands:                            |
    |                                                 |
    | help (shows this screen!)                       |
    | build [type] [x coordinate] [y coordinate]      |
    | quit (quits the game)                           |
    | start (starts the game)                         |
    | map (shows the current map)                     |
    |                                                 |
    |           Building Types                        |
    |                                                 |
    | i (industrial)     c (commercial)               |
    | r (residential)    g (government / civic)       |
    | l (lane / road)                                 |
    |                                                 |
    |                                                 |
    ()-----------------------------------------------()
    '''
  end

end