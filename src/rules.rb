module Rules
  def is_player?(next_position)
    position =
      @board
        .position(
          Cell.new(next_position[0], next_position[1])
        )

    position.type == :player
  end

  def player_next_position
    if @player.current_direction == :left
      return [@player.x - 1, @player.y]
    end

    if @player.current_direction == :right
      return [@player.x + 1, @player.y]
    end

    if @player.current_direction == :down
      return [@player.x, @player.y + 1]
    end

    if @player.current_direction == :up
      return [@player.x, @player.y - 1]
    end
    return [@player.x, @player.y]
  end

  def game_over?
    if @player.current_direction == :left
      if @player.x >= 0
        if ((player_next_position[0]) < 0 || is_player?(player_next_position))
          return true
        end
      end
    end

    if @player.current_direction == :right
      if (@player.x + 1) <= columns
        if ((player_next_position[0]) >= columns || is_player?(player_next_position))
          return true
        end
      end
    end

    if @player.current_direction == :down
      if (@player.y + 1) <= rows
        if (player_next_position[1] >= rows || is_player?(player_next_position))
          return true
        end
      end
    end

    if @player.current_direction == :up
      if (@player.y) >= 0
        if (player_next_position[1] < 0 || is_player?(player_next_position))
          return true
        end
      end
    end
    false
  end
end
