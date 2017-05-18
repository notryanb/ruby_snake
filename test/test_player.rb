require 'minitest/autorun'
Dir["./src/models/*"].each {|file| require file }

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new(30,30)
  end

  def test_player_symbol
    assert_equal 'X', @player.to_s
  end

  def test_interface
    assert_equal 30, @player.x
    assert_equal 30, @player.y
    assert_equal :player, @player.type
  end
end
