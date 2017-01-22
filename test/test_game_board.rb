require 'minitest/autorun'
Dir[File.dirname(__FILE__) + '/src/*'].each { |file| require file }

class TestGameBoard < Minitest::Test
  def setup
    @game_board = GameBoard.new(5,5)
  end

  def test_board_initialize
    asset_equal [], @gameboard.board
  end
end

