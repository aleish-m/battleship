require './lib/cell'

describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end

  it "cell exists" do
    expect(@cell).to be_instance_of(Cell)
  end




end
