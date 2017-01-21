class Player
  attr_reader :start_position
  attr_accessor :current_position, :current_direction

  def initialize(rows, columns)
    @body = []
    @rows = rows - 1
    @columns = columns - 1
    @current_position = start_position
    @current_direction = ''
  end

  def start_position
    [Random.new.rand(@columns), Random.new.rand(@rows)]
  end

  def grow(cell)
    @body << cell
  end

  def to_s
    'X'
  end
end
