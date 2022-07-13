require './lib/cell'

describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end

  it "cell exists" do
    expect(@cell).to be_instance_of(Cell)
  end

  it "has a coordinate" do
    expect(@cell.coordinate).to eq("B4")
  end


end
