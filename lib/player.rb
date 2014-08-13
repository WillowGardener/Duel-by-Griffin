class Player
  attr_reader(:attributes, :attack, :armor, :life, :mana)

  def initialize(attributes)
    @attack = attributes[:attack]
    @armor = attributes[:armor]
    @life = attributes[:life]
    @mana = attributes[:mana]
    @parry_counter = 0
    @block_counter = 0
  end

  def zero_damage?
    if @damage < 0
      @damage = 0
    end
  end

  def parry
    @attack += 2
    @parry_counter = 1
    @armor += 50
  end

  def parry_down
    if @parry_counter == 1
      @armor -= 50
      @parry_counter = 0
    end
  end

  def block_down
    if @block_counter == 1
      @armor -= @block_bonus
      @block_counter = 0
    end
  end

  def block
    @block_counter = 1
    @armor += 1
    @block_bonus = (@armor * 0.5).to_i
    @armor += @block_bonus
  end

  def get_struck(enemy_attack)
    @damage = ((enemy_attack) - self.armor)
    zero_damage?
    @life = @life - @damage
    self.parry_down
    @damage = ((enemy_attack) - self.armor)
    @life = @life - @damage
  end

  def get_struck(enemy_attack)
    @damage = ((enemy_attack/2) + 4 - self.armor)
    zero_damage?
    @life = @life - @damage
    self.parry_down
    @damage = ((enemy_attack/2) + 4 - self.armor)
    zero_damage?
    @life = @life - @damage
    self.block_down
  end

  def get_blown(enemy_attack)
    @damage = (enemy_attack + 4 - self.armor)
    zero_damage?
    @life = @life - @damage
    self.parry_down
    self.block_down
  end





end
