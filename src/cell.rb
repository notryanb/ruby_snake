class Cell < Struct.new(:x, :y, :type)
  def initialize(x, y, type = :empty); super end

  def to_s
    '.'
  end
end

