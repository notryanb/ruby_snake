class Cell
  attr_reader :x, :y, :type

  def initialize(x, y, type = :empty)
    @x = x
    @y = y
    @type = type
  end

  def to_s
    '.'
  end
end
