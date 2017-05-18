class Cell
  attr_accessor :x, :y
  attr_reader :type

  def initialize(x, y, type = :empty)
    @x = x
    @y = y
    @type = type
  end

  def to_s
    '.'
  end
end
