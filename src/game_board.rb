require './cell'

class GameBoard
  attr_reader :rows, :columns, :board

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @board = build_board
  end

  def build_board
    Array.new(@rows) do |row_idx|
      Array.new(@columns) do |col_idx|
        Cell.new(row_idx, col_idx)
      end
    end
  end

  def position(cell)
    @board[cell.y][cell.x]
  end

  def position=(cell)
    @board[cell.y][cell.x] = cell
  end

  def to_s
    board_str = ''
    @board.each do |row|
      row.each do |cell|
        board_str << cell.to_s
        board_str << ' '
      end
      board_str << "\n"
    end
    board_str
  end
end
