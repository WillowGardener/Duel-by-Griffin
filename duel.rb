require './lib/player'

def duel
  @player_1 = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})
  @player_2 = Player.new({:attack => 8, :armor => 4, :life => 40, :mana => 8})

  while @player_1.life > 0 && @player_2.life > 0

    valid_options = [1,2,3,4]
    p1_turn
    unless valid_options.include?(@p1_input)
      puts "try again"
      p1_turn
    end
    p2_turn
    unless valid_options.include?(@p1_input)
      puts "try again"
      p2_turn
    end

    if @p1_input == 3
      @player_1.block
    elsif @p1_input == 4
      @player_1.parry
    end

    if @p2_input == 3
      @player_2.block
    elsif @p2_input == 4
      @player_2.parry
    end

    if @p1_input == 1
      @player_2.get_blown
    elsif @p1_input ==2
      @player_2. get struck
    end

    if @p2_input == 1
      @player_1.get_blown
    elsif @p2_input ==2
      @player_1. get struck
    end


  end


end

def p1_turn
  puts "Player 1                            Player 2"
  puts "Life: #{@player_1.life}                            Life: #{@player_2.life}"
  puts "Attack: #{@player_1.attack}                           Attack: #{@player_2.attack}"
  puts "Armor: #{@player_1.armor}                            Armor: #{@player_2.armor}"
  puts "\n\n Make your move, Player 1: pick a number"
  puts "1)Heavy Blow       3)Block"
  puts "2)Quick Strike     4)Parry"
  @p1_input = gets.chomp.to_i
end

def p2_turn
  puts "Player 1                                  Player 2"
  puts "Life: #{@player_1.life}                            Life: #{@player_2.life}"
  puts "Attack: #{@player_1.attack}                   Attack: #{@player_2.attack}"
  puts "Armor: #{@player_1.armor}                         Armor: #{@player_2.armor}"
  puts "\n\n Make your move, Player 2: pick a number"
  puts "1)Heavy Blow       3)Block"
  puts "2)Quick Strike     4)Parry"
  @p2_input = gets.chomp.to_i
end



duel
