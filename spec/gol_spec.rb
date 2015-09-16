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
  end

  it "Rule #1: Any cell with fewer than 2 live neighbors, dies" do
    expect(cell.neighbors.count).to eq (0)
  end
end
