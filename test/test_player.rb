require 'minitest/autorun'
Dir["./src/models/*"].each {|file| require file }

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new(30,30)
  end

  def test_player_symbol
    assert_equal 'X', @player.to_s
  end

  def test_getters
    assert_equal 30, @player.x
    assert_equal 30, @player.y
    assert_equal :player, @player.type
  end
  
  def test_setters
    @player.x = 25
    @player.y = 35
    assert_equal 25, @player.x
    assert_equal 35, @player.y
  end
end
