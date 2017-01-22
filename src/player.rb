require './cell'

class Player < Cell
  attr_accessor :current_direction, :body
  
  def initialize(x, y, type)
    super(x, y, type) 
    @type = :player
    @body = []
  end

  def grow(cell)
    @body << cell
  end

  def to_s
    'X'
  end
end
