class Cell
  attr_accessor :world, :x, :y

  def initialize(world, x=0 ,y=0)
    @world = world
    @x = x
    @y = y
    world.cells << self
  end
  def neighbors
    []
  end

  def populate_at(x,y)
    Cell.new(world, x, y)
  end
end

class World

  attr_accessor :cells
  def initialize
    @cells = []
  end
end
