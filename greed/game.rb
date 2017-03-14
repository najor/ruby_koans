class Game

  attr_reader :players

  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def self.no_scoring_dice(rolls)
    number_repeated = []

    1.upto(6) do |index|
      number_repeated[index] = 0
    end

    rolls.each do |item|
      number_repeated[item] += 1
    end

    1.upto(6) do |index|
      number_repeated[index] = 0 if index == 1 or index == 5

      if number_repeated[index] >= 3
        number_repeated[index] -= 3
      end
    end

    number_repeated.slice(1, 6).reduce(:+)
  end

  def self.calculate_points(rolls)
    number_repeated = []

    1.upto(6) do |index|
      number_repeated[index] = 0
    end

    rolls.each do |item|
      number_repeated[item] += 1
    end

    points = 0
    1.upto(6) do |index|
      if index == 1
        if number_repeated[index] >= 3
          points += 1000
          number_repeated[index] -= 3
        end
        points += number_repeated[index] * 100
      end

      if number_repeated[index] >= 3
        points += index * 100
        number_repeated[index] -= 3
      end

      if index == 5
        points += number_repeated[index] * 50
      end
    end

    points
  end
end