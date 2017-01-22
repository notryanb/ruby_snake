require './cell'

class Food < Cell
  def initialize(x, y, type)
    super(x, y, type) 
    @type = :food
  end

  def to_s
    'F'
  end
end


