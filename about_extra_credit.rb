# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

require File.expand_path(File.dirname(__FILE__) + '/neo')
require './greed/player'
require './greed/game'

class AboutExtraCredit < Neo::Koan

  def test_player_roll
    player_a = Player.new('Player 1')
    rolls = player_a.roll(5)
    assert_equal 5, rolls.size
    assert_equal 'Player 1', player_a.name
    assert_equal 0, player_a.points
  end

  def test_calculate_points_roll
    assert_equal 250, Game.calculate_points([1, 1, 3, 4, 5])
    assert_equal 1100, Game.calculate_points([1, 1, 1, 3, 1])
    assert_equal 450, Game.calculate_points([2, 4, 4, 5, 4])
  end

  def test_game_init
    game = Game.new
    assert_equal 0, game.players.size

    player_a = Player.new('Player 1')
    player_b = Player.new('Player 2')

    game.add_player(player_a)
    game.add_player(player_b)

    assert_equal 2, game.players.size
  end

  def test_roll_no_scoring_dice
    assert_equal 3, Game.no_scoring_dice([1, 2, 3, 4, 5])
    assert_equal 0, Game.no_scoring_dice([1, 2, 2, 2, 5])
    assert_equal 5, Game.no_scoring_dice([2, 2, 3, 3, 4])
  end
end