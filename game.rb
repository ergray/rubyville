require './engine.rb'
require './map.rb'
require './city.rb'

class Game

  def initialize()
    @map = Map.new()
    @city = City.new(@map)
    @engine = Engine.new(@map, @city)
    @engine.show_prompt()
  end

end