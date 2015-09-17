require 'gol'

describe 'Game of Life' do
  let(:world) { World.new }
  let(:cell) { Cell.new(world) }

  context "cell lifecycle" do
    it "populates cell at (x,y)" do
      live_cell = cell.populate_at(3,5)

      expect(live_cell).to be_instance_of (Cell)
      expect(live_cell.x).to eq (3)
      expect(live_cell.y).to eq (5)
      expect(live_cell.world).to eq (cell.world)
    end

    it "detects a neighbor to the north of it" do
      north_cell = cell.populate_at(0,1)
      expect(cell.neighbors.count).to eq (1)
    end

    it "detects a neighbor to the northeast of it" do
      northeast_cell = cell.populate_at(1,1)
      expect(cell.neighbors.count).to eq(1)
    end

    it "detects a neighbor to the west of it" do
      west_cell = cell.populate_at(-1,0)
      expect(cell.neighbors.count).to eq(1)
    end

    it "detects a neighbor to the east of it" do
      east_cell = cell.populate_at(1,0)
      expect(cell.neighbors.count).to eq(1)
    end

    it "dies" do
      cell.die!
      expect(world.cells).to_not include(self)
    end
  end

  it "Rule #1: Any cell with fewer than 2 live neighbors, dies" do
    new_cell = cell.populate_at(2,3)
    world.tick!
    expect(cell).to be_dead
  end

  it "Rule #2: Any cell with two or three live neighbors, lives on to the next generation" do
    neighbor1 = cell.populate_at(1,0)
    neighbor2 = cell.populate_at(-1,0)
    world.tick!
    expect(cell).to be_alive
  end

  it "Rule #3: Any live cell with more than three live neighbours dies, as if by overcrowding"do
    neighbor1 = cell.populate_at(1,0)
    neighbor2 = cell.populate_at(-1,0)
    neighbor3 = cell.populate_at(1,1)

    world.tick!
    expect(cell).to be_dead
  end

end
