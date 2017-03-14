require './greed/dice_set'


class Player
  :dice
  attr_reader :name
  attr_reader :points

  def initialize(name)
    @name = name
    @points = 0
    @dice = DiceSet.new
  end

  def roll(int)
    @dice.roll(int)
    @dice.values
  end
end