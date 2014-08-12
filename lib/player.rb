class Player
  attr_reader(:attack, :armor, :life, :mana)

  def initialize(attributes)
    @attack = attributes[:attack]
    @armor = attributes[:armor]
    @life = attributes[:life]
    @mana = attributes[:mana]
  end

  def get_blown(enemy_attack)
    @life = @life - (enemy_attack + 4 - self.armor)
  end

  def get_struck(enemy_attack)
    @life = @life - ((enemy_attack/2) + 4 - self.armor)
    @life = @life - ((enemy_attack/2) + 4 - self.armor)
  end
end
