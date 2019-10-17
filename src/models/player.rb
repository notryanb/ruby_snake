class Player < Cell
  attr_accessor :current_direction, :body

  def initialize(x, y, type = :player)
    super(x, y, type) 
  end

  def to_s
    "🐲"
  end
end
