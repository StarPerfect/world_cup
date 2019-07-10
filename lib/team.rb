require './lib/player'

class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def add_player(name)
    @players << name
  end

  def players_by_position(position)
    @players.find_all{ |player| player.position == position }
  end
end
