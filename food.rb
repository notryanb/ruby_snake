class Food
  attr_reader :start_position
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def start_position
    [ Random.new.rand(@rows), Random.new.rand(@columns) ]
  end

  def to_s
    'F'
  end
end

