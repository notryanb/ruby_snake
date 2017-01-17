class Player
  attr_reader :start_position, :current_position

  def initialize(rows, columns)
    @length = 1
    @rows = rows - 1
    @columns = columns - 1
    @current_position = start_position
  end

  def start_position
    [ Random.new.rand(@columns), Random.new.rand(@rows) ]

  end

  def current_position
    @current_position
  end

  def set_current_position(x, y)
    @current_position = [ x, y ]
  end

  def to_s
    'X'
  end
end
