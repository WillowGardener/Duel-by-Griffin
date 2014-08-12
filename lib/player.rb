class Player
  attr_reader(:attack, :armor, :life, :mana)

  def initialize(attributes)
    @attack = attributes[:attack]
    @armor = attributes[:armor]
    @life = attributes[:life]
    @mana = attributes[:mana]
  end

end
