require './cell'

class GameBoard
  attr_reader :rows, :columns, :board

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @board = build_board
  end

  
  def build_board
    #Array.new(@rows, Array.new(@columns, '.'))
    Array.new(@rows) do |row_idx|
      Array.new(@columns) do |col_idx|
        '.'
        #Cell.new(row_idx, col_idx, false)
      end
    end
  end

  def to_s
    board_str = ''
    for row in @board
      for cell in row
        board_str << cell.to_s
      end
      board_str << "\n"
    end 
    board_str
  end
end
