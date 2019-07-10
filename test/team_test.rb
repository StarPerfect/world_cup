require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test
  def setup
    @team = Team.new('France')
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_team_exists
    assert_instance_of Team, @team
  end

  def test_team_country
    assert_equal 'France', @team.country
  end
  def test_team_eliminated
    refute @team.eliminated?

    @team.eliminated = true
    assert @team.eliminated?
  end

  def test_team_players
    assert_equal [], @team.players
  end

  def test_add_players_to_team
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@pogba], @team.players_by_position('midfielder')
    assert_equal [@mbappe], @team.players_by_position('forward')
    assert_equal [], @team.players_by_position('goalie')
  end
end
