class Food < Cell
  def initialize(x, y, type = :food)
    super(x, y, type) 
  end

  def to_s
    'F'
  end
end


