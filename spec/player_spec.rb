require 'rspec'
require 'player'

describe Player do
  it "is initialized with the four beginning stats" do
    player_1 = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})
    expect(player_1).to be_an_instance_of Player
  end
end
