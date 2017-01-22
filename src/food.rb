require './cell'

class Food < Cell
  def initialize(x, y, type = :food)
    super(x, y, type) 
    @type = type
  end

  def to_s
    'F'
  end
end


