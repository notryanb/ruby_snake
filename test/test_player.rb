require 'minitest/autorun'
require './src/player'

class TestPlayer < Minitest::Test
  def setup
    @player = Player.new(30,30)
  end

  def test_player_symbol
    assert_equal 'X', @player.to_s
  end
end
