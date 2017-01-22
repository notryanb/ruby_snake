require_relative 'player'
require_relative 'food'
require_relative 'cell'
require_relative 'game_board'

# Transpost board matrix and & standardize board access methods for array nestings

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  rows = 30
  columns = 30

  board = GameBoard.new(rows, columns)
  player = Player.new(Random.new.rand(rows), Random.new.rand(columns), :player)
  food = Food.new(Random.new.rand(rows), Random.new.rand(columns), :food)

  board.position = player
  board.position = food
  game_over = false

  loop do
    printf "\033c" # Clears Screen to 0,0

    system('stty raw -echo')
    char = STDIN.read_nonblock(1) rescue nil
    current_position = [player.x, player.y]

    if player.current_direction == :left
      if player.x >= 0
        next_position = [player.x - 1, player.y]
        game_over = true if (next_position[0]) < 0
        player.x, player.y = next_position
        player.grow(next_position) if board.position(player).type == :food
        board.position = player
        board.position = Cell.new(player.x + 1, player.y)
      end
    end

    if player.current_direction == :right
      if (player.x + 1) <= columns
        next_position = [player.x + 1, player.y]
        game_over = true if next_position[0] >= columns
        player.x, player.y = next_position
        unless game_over
          player.grow(next_position) if board.position(player).type == :food
          board.position = player
        end
        board.position = Cell.new(player.x - 1, player.y)
      end
    end

    if player.current_direction == :down
      if (player.y + 1) <= rows
        next_position = [player.x, player.y + 1]
        game_over = true if next_position[1] >= rows
        player.x, player.y = next_position
        unless game_over
          player.grow(next_position) if board.position(player).type == :food
          board.position = player
        end
        board.position = Cell.new(player.x, player.y - 1)
      end
    end

    if player.current_direction == :up
      if (player.y) >= 0
        next_position = [player.x, player.y - 1]
        game_over = true if next_position[1] < 0
        player.x, player.y = next_position
        player.grow(next_position) if board.position(player).type == :food
        board.position = player
        board.position = Cell.new(player.x, player.y + 1)
      end
    end

    if char =~ /a/i
      player.current_direction = :left
    elsif char =~ /d/i
      player.current_direction = :right
    elsif char =~ /s/i
      player.current_direction = :down
    elsif char =~ /w/i
      player.current_direction = :up
    end


    system('stty -raw echo')

    break if /q/i =~ char || game_over

    puts "\n==================\nPRESS 'q' to quit \n"
    puts board.to_s
    puts "Current Position: #{current_position}"
    puts "Player Position: #{[player.x, player.y]}"
    puts "Player Body: #{player.body}"
    puts "Food Position: #{[food.x, food.y]}"

    sleep 0.2
  end

  exit_message = game_over ? 'Sorry, game over!' : "\n\nThanks for playing"
  puts exit_message
end

main
