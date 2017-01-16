class Food
  attr_reader :start_position, :current_position

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @current_position = start_position
  end

  def start_position
    [ Random.new.rand(@rows), Random.new.rand(@columns) ]
  end
  
  def current_position
    @current_position
  end

  def set_current_position(x, y)
    @current_position = [ x, y ]
  end

  def to_s
    'F'
  end
end

