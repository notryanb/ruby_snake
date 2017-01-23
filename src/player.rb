require './cell'

class Player < Cell
  attr_reader :type
  attr_accessor :current_direction, :body

  def initialize(x, y, type = :player)
    super(x, y, type) 
    @type = type
  end

  def to_s
    'X'
  end
end
