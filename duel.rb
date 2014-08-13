require './lib/player'
require 'io/console'

def duel
  @player_1 = Player.new({:attack => 8, :armor => 4, :life => 20, :mana => 8})
  @player_2 = Player.new({:attack => 8, :armor => 4, :life => 20, :mana => 8})

  intro

  puts "\n\nWho knows what justice or malice has led these two to face each other on the field this day? For amidst the rage and bloodthirst that drives man to wage war upon another, all reason is drowned out by one clear thought:\n\n THE OTHER MUST DIE!\n\n"

  while @player_1.life > 0 && @player_2.life > 0

    valid_options = [1,2,3,4]
    p1_turn
    unless valid_options.include?(@p1_input)
      puts "try again"
      p1_turn
    end
    p2_turn
    unless valid_options.include?(@p2_input)
      puts "\n\nNOT A VALID MOVE, FOOL. Try again"
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
      @player_2.get_blown(@player_1.attack)
      @p1_damage = @damage
    elsif @p1_input ==2
      @player_2. get_struck(@player_1.attack)
      @p1_damage = @damage
    end

    if @p2_input == 1
      @player_1.get_blown(@player_2.attack)
      @p2_damage = @damage
    elsif @p2_input ==2
      @player_1. get_struck(@player_2.attack)
      @p2_damage = @damage
    end


    if @p1_input == 1
      puts "\nPlayer 1 lashes out with a heavy blow!\n"
    elsif @p1_input ==2
      puts "\nPlayer 1 makes two quick strikes!\n"
    end

    if @p2_input == 1
      puts "\nPlayer 2 lashes out with a heavy blow!\n"
    elsif @p2_input ==2
      puts "\nPlayer 2 makes two quick strikes!\n"
    end

    if @p1_input == 3
      puts "\nPlayer 1 blocks!\n"
    elsif @p1_input == 4
      puts "\nPlayer 1 parries\n"
    end

    if @p2_input == 3
      puts "\nPlayer 2 blocks!\n"
    elsif @p2_input == 4
      puts "\nPlayer 2 parries!\n"
    end


    @player_1.parry_down
    @player_1.block_down

    @player_2.parry_down
    @player_2.block_down
  end

  if @player_1.life < 1 && @player_2.life > 0
    puts "\nPlayer 1 has been slain in the course of this duel! But in delivering this cruel fate, can we truly claim that Player 2 has won? The confounding nature of such bitter conflict shall continue to plague us, for lo, this is the fate of man, to war and to woe for so long as he inhabits this bitter earth.\n"
  elsif @player_2.life < 1 && @player_1.life > 0
    puts "\nMaidens and mothers alike shall weep for the blood spilled this day, for Player 2 has been slain in the course of this feud! But can we truly call Player 1 the victor? For what can we say this warrior has won, but a lifetime of guilty nightmares?\n"
  elsif @player_1.life < 1 && @player_2.life < 1
    puts "\nWhat crueler fate could the Gods bestow upon our would-be heroes? Each has fallen upon the other's blade, and none shall walk from the field of battle but ghosts who have shrugged off their earthly burden.\n"
  end

end

def p1_turn
  puts "\nPlayer 1:                           Player 2:"
  puts "Life: #{@player_1.life}                            Life: #{@player_2.life}"
  puts "Attack: #{@player_1.attack}                           Attack: #{@player_2.attack}"
  puts "Armor: #{@player_1.armor}                            Armor: #{@player_2.armor}"
  puts "\n\n Make your move, Player 1: pick a number"
  puts "1)Heavy Blow       3)Block"
  puts "2)Quick Strike     4)Parry"
  @p1_input = STDIN.noecho(&:gets).chomp.to_i
end

def p2_turn
  if @p2_identity == "human"
    puts "\nPlayer 1:                           Player 2:"
    puts "Life: #{@player_1.life}                            Life: #{@player_2.life}"
    puts "Attack: #{@player_1.attack}                           Attack: #{@player_2.attack}"
    puts "Armor: #{@player_1.armor}                            Armor: #{@player_2.armor}"
    puts "\n\n Make your move, Player 2: pick a number"
    puts "1)Heavy Blow       3)Block"
    puts "2)Quick Strike     4)Parry"
    @p2_input = STDIN.noecho(&:gets).chomp.to_i
  elsif @p2_identity == "computer"
    @p2_input = rand(3) + 1
  end
end

def intro
  puts "Press 1 to battle a mindless automaton, or press 2 that your blade may feast on the flesh of a living, breathing human."
  input = gets.chomp

  if input.to_i == 1
    @p2_identity = "computer"
  elsif input.to_i == 2
    @p2_identity = "human"
  else
    puts "not a valid input. Try again."
    intro
  end
end


duel









