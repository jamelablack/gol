require 'gol'

describe 'Game of Life' do
  let(:cell) { Cell.new }

  it "Rule #1: Any cell with fewer than 2 live neighbors, dies" do
    expect(cell.neighbors).to eq []
  end
end
