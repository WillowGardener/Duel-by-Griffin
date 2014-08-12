require 'rspec'
require 'player'

describe Player do
  it "is initialized with the four beginning stats" do
    player_1 = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})
    expect(player_1).to be_an_instance_of Player
  end

  it "uses the 'Heavy Blow' tehnique" do
    garth = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})
    garth.get_blown(8)
    expect(garth.life).to eq(32)
  end

  it "uses the 'quick strike' technique" do
    wayne = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})
    wayne.get_struck
    expect(wayne.life).to eq(32)
  end

end
