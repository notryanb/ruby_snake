class Player
  attr_reader :start_position
  def initialize(rows, columns)
    @length = 1
    @rows = rows
    @columns = columns
  end

  def start_position
    [ Random.new.rand(@rows), Random.new.rand(@columns) ]
  end

  def to_s
    'X'
  end
end
