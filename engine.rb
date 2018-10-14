require './clock.rb'

class Engine

  def initialize(map, city)
    @map = map
    @city = city
    @clock = Clock.new()
    #this needs a better name, confusing
    @game_running = false
    start()
  end

  def check_game_over()
      status = @city.prompt_values()
    if status['happiness'] < -10
        puts "Your citizens are too unhappy to go on! They all leave for another city."
        exit(0)  
    elsif status['money'] <= 0 && status['upkeep'] > status['income']
        puts "Looks like your city is broke! Better luck next time."
        exit(0)
    end
  end

  def start_time()
      while true
          @clock.check_time()
      end
  end

  def show_prompt()
    while true

      if @game_running == true
        info = @city.prompt_values()
        print "Upkeep: #{info['upkeep']} Income: #{info['income']} Population: #{info['population']} Happiness: #{info['happiness']} Money: #{info['money']} :>"
      else
        print ":>"
      end

      prompt = $stdin.gets.chomp.scan(/\w+/)
      
      if prompt.length < 1
          next
      elsif prompt[0] == "start" && @game_running == false
          start_game()
          next
      elsif prompt[0] == "start" && @game_running == true
          puts "The game is already started!"
          next
      elsif prompt[0] == "quit"
          exit(0)
      elsif prompt[0] == "map" && @game_running == true
        @map.show_map()
        next
      elsif prompt[0] == "build" && @game_running == true
          @city.check_build(prompt[1].downcase, prompt[2].to_i, prompt[3].to_i, @city.show_money())
          @clock.increase_time(1)
      elsif prompt[0] == "help"
          show_help()
          next
      elsif prompt[0] == "wait"
          @clock.increase_time(1)
      end

      if @clock.check_tic() == true
          @city.produce()
          check_game_over()
      else
          next
      end
    end
  end

  def start()
    puts '''



    ~~~~~~~~~~~~~~~~Rubyville v2.0~~~~~~~~~~~~~~~~

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
    ()-----------------------------------------------------------------------()
    |                                                                         | 
    |            Rubyville!                                                   |
    |                                                                         |
    | Total money is adjusted by Income - Upkeep                              |
    | every 4 actions (a combination of wait and build commands)              |
    |                                                                         |
    | If your happiness reaches -10 or your income is less                    |
    | than your upkeep while not having enough money to                       |
    | build a new structure, it\'s game over!                                 |
    |                                                                         |
    |            Commands:                                                    |
    |                                                                         |
    | help (shows this screen!)                                               |
    | build [type] [x coordinate] [y coordinate]                              |
    | quit (quits the game)                                                   |
    | start (starts the game)                                                 |
    | map (shows the current map)                                             |
    | wait (skips 1 tick of time)                                             |
    |                                                                         |
    |           Building Types                                                |
    |                                                                         |
    | i (industrial) $500, +50 upkeep, +150 income, -0.5 happiness            |
    | c (commercial) $500, +50 upkeep, +50 income, +2 happiness               |
    | r (residential) $500, +50 upkeep, +1 population                         |
    | g (government / civic) $500, +50 upkeep, -25 income, +1 happiness       |
    | l (lane / road) $10, +5 upkeep                                          |
    |                                                                         |
    |                                                                         |
    ()-----------------------------------------------------------------------()
    '''
  end

end