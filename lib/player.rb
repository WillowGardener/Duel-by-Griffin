class Player
  attr_reader(:attributes, :attack, :armor, :life, :mana)

  def initialize(attributes)
    @attack = attributes[:attack]
    @armor = attributes[:armor]
    @life = attributes[:life]
    @mana = attributes[:mana]
  end

  def parry
    @attack += 2
    @parry_counter = 1
  end

  def parry_up
    if parry_counter == 1
      Player.armor += 50
    end
  end

  def parry_down
    if parry_counter == 1
      Player.armor -= 50
      @parry_counter = 0
    end
  end

  def get_blown(enemy_attack)
    # Player.parry_up
    @life = @life - (enemy_attack + 4 - self.armor)
    # Player.parry_down
  end


  def get_struck(enemy_attack)
    # Player.parry_up
    @life = @life - ((enemy_attack/2) + 4 - self.armor)
    # Player.parry_down
    @life = @life - ((enemy_attack/2) + 4 - self.armor)
  end




end
