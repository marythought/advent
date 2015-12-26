# You have 100 hit points. The boss's actual stats are in your puzzle input. What is the least amount of gold you can spend and still win the fight?
#

class Store
  attr_accessor :items

  def initialize
    @items = {}
    populate
  end

  def populate
    dagger = Item.new("dagger", 8, 4, 0, "weapon")
    shortsword = Item.new("shortsword", 10, 5, 0, "weapon")
    warhammer = Item.new("warhammer", 25, 6, 0, "weapon")
    longsword = Item.new("longsword", 40, 7, 0, "weapon")
    greataxe = Item.new("greataxe", 74, 8, 0, "weapon")
    weapons = [dagger, shortsword, warhammer, greataxe, longsword]
    weapons.each do |weapon|
      @items[weapon.name] = weapon
    end
    leather = Item.new("leather", 13, 0, 1, "armor")
    chainmail = Item.new("chainmail", 31, 0, 2, "armor")
    splintmail = Item.new("splintmail", 53, 0, 3, "armor")
    bandedmail = Item.new("bandedmail", 75, 0, 4, "armor")
    platemail = Item.new("platemail", 102, 0, 5, "armor")
    armors = [leather, chainmail, splintmail, bandedmail, platemail]
    armors.each do |armor|
      @items[armor.name] = armor
    end
    one = Item.new("damage+1", 25, 1, 0, "ring")
    two = Item.new("damage+2", 50, 2, 0, "ring")
    three = Item.new("damage+3", 100, 3, 0, "ring")
    four = Item.new("defense+1", 20, 0, 1, "ring")
    five = Item.new("defense+2", 40, 0, 2, "ring")
    six = Item.new("defense+3", 80, 0, 3, "ring")
    rings = [one, two, three, four, five, six]
    rings.each do |ring|
      @items[ring.name] = ring
    end
  end
end

class Item
  attr_accessor :name, :cost, :damage, :armor, :type

  def initialize(name, cost, damage, armor, type)
    @name = name
    @cost = cost
    @damage = damage
    @armor = armor
    @type = type
  end
end

class Character
  attr_accessor :gold, :damage, :armor, :hit_points

  def initialize(hit_points=100, damage=0, armor=0)
    @items = []
    @hit_points = hit_points
    @damage = damage
    @armor = armor
    @gold = 0
  end

  def buy_item(store, item)
    @items << store.items[item]
    @gold += store.items[item].cost
  end

  def equip
    @items.each do |item|
      @damage += item.damage
      @armor += item.armor
    end
  end

  def attack(defender)
    # Damage dealt by an attacker each turn is equal to the attacker's damage score minus the defender's armor score. An attacker always does at least 1 damage. So, if the attacker has a damage score of 8, and the defender has an armor score of 3, the defender loses 5 hit points. If the defender had an armor score of 300, the defender would still lose 1 hit point.
    damage_dealt = @damage - defender.armor
    if damage_dealt >= 1
      defender.hit_points -= damage_dealt
    else
      defender.hit_points -= 1
    end
  end

end

class Game
  attr_accessor :you, :boss

  def initialize
    @boss = Character.new(103, 9, 2)
    @you = Character.new
    @store = Store.new
    # @winning_combinations = [[4, 8], [5,7], [6, 6], [7, 5], [8, 4], [9, 2], [9, 3], [10, 2], [10, 1], [11,1], [11, 0]]
    @winner = nil
    @winning_gold = 500
    @combos = []
  end

  def make_combos
    rings = store.items.values.select { |item| item.type == "ring" }
    weapons = store.items.values.select { |item| item.type == "weapon" }
    armors = store.items.values.select { |item| item.type == "armor" }
    weapons.each do |weapon|
      armors.each do |armor|
        @combos << [weapon.name, armor.name]
      end
    end
  end

  def try_combo(weapon, *args)
    @you.buy_item(@store, weapon)
    args.each do |item|
      @you.buy_item(@store, item)
    end
    @you.equip
  end

  def fight
    loop do
      @you.attack(@boss)
      if @boss.hit_points <= 0
        @winner = @you
        @winning_gold = @you.gold < @winning_gold ? @you.gold : @winning_gold
        return "you win!"
      end
      @boss.attack(@you)
      if @you.hit_points <= 0
        @winner = @boss
        return "@boss wins!"
      end
    end
  end
end

game = Game.new
# You must buy exactly one weapon; no dual-wielding. Armor is optional, but you can't use more than one. You can buy 0-2 rings (at most one for each hand). You must use any items you buy. The shop only has one of each item, so you can't buy, for example, two rings of Damage +3.
#
# game.try_combo("dagger") #lose
# game.try_combo("dagger", "leather") #lose
# game.try_combo("dagger", "leather", "damage+1") #lose
# game.try_combo("dagger", "leather", "damage+1", "damage+2") #lose
# game.try_combo("dagger", "chainmail", "damage+2", "defense+3") #lose
# game.try_combo("dagger", "leather", "damage+3", "defense+2") #lose
# game.try_combo("dagger", "splintmail", "damage+2", "defense+1") #lose
# game.try_combo("dagger", "splintmail", "damage+1", "defense+3") #lose
# game.try_combo("shortsword", "chainmail", "damage+2", "defense+2") #lose
# game.try_combo("shortsword", "chainmail", "damage+1", "defense+3") #lose
# game.try_combo("shortsword", "bandedmail") - lose
# game.try_combo("longsword", "chainmail", "defense+2") #lose
# game.try_combo("longsword", "leather", "defense+3") #lose
# game.try_combo("longsword", "bandedmail") #lose
# game.try_combo("warhammer", "chainmail", "defense+3") #lose
# game.try_combo("dagger", "bandedmail", "damage+2", "defense+3") #213
# game.try_combo("dagger", "splintmail", "damage+2", "defense+3") #191
# game.try_combo("greataxe", "platemail") #176
# game.try_combo("shortsword", "chainmail", "damage+2", "defense+3") #171 (too high)
# game.try_combo("warhammer", "chainmail", "damage+1", "defense+3") #161
# game.try_combo("longsword", "chainmail", "defense+3") #151
# game.try_combo("greataxe", "bandedmail") # 149 | 8, 4 |
# game.try_combo("longsword", "bandedmail", "damage+1") #140 | 8, 4 |
# game.try_combo("greataxe", "damage+2", "leather") #HIGH 137

# game.try_combo("longsword", "damage+2", "leather", "defense+2") #143
# game.try_combo("greataxe", "damage+2", "leather") #HIGH 137 [10, 1]
game.try_combo("greataxe", "damage+1", "chainmail") #HIGH 130 [9, 2]

puts game.fight
