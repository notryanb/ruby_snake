require './cell'

class GameBoard
  attr_reader :height, :width, :board

  def initialize(height, width)
    @height = height
    @width = width
    @board = build_board
  end

  def build_board
    Array.new(height, Array.new(width, Cell.new))
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
