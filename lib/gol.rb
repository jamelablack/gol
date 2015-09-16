class Cell
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end
  def neighbors
    []
  end

  def populate_at(x,y)
    Cell.new(x,y)
  end
end
