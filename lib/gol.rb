class Cell
  attr_accessor :world, :x, :y

  def initialize(world, x=0 ,y=0)
    @world = world
    @x = x
    @y = y
    world.cells << self
  end

  def neighbors
    @neighbors = []
    world.cells.each do |cell|
    #Neighbor to the North
      if self.x == cell.x && self.y == cell.y - 1
        @neighbors << cell
      end

    #Neighbor to the Northeast
      if self.x == cell.x - 1 && self.y == cell.y - 1
        @neighbors << cell
      end

    #Neighbor to the west
      if self.x == cell.x + 1 && self.y == cell.y
        @neighbors << cell
      end

    #Neighbor to the east
      if self.x == cell.x - 1 && self.y == cell.y
        @neighbors << cell
      end
    end
    @neighbors
  end

  def populate_at(x,y)
    Cell.new(world, x, y)
  end

  def die!
    world.cells -= [self]
  end

  def dead?
    !world.cells.include?(self)
  end

  def alive?
    world.cells.include?(self)
  end

  def resurect!
    world.cells += [self]
  end
end

class World

  attr_accessor :cells
  def initialize
    @cells = []
  end

  def tick!
    cells.each do |cell|
      if cell.neighbors.count < 2
        cell.die!
      end
      if cell.neighbors.count > 3
        cell.die!
      end
      if cell.neighbors.count == 3 && cell.dead?
        cell.resurect!
      end
    end
  end
end
