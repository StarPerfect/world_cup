class Player
  attr_reader :name, :position

  def initialize(args)
    @name = args[:name]
    @position = args[:position]
  end
end
