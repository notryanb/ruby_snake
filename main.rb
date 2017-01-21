require './game_board'
require './player'
require './food'

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  rows = 20
  columns = 50

  board = GameBoard.new(rows, columns)
  player = Player.new(rows, columns)
  food = Food.new(rows, columns)

  x, y = player.current_position
  board.board[y][x] = player

  b, a = food.current_position
  board.board[b][a] = food
  game_over = false

  loop do
    printf "\033c" # Clears Screen to 0,0

    system('stty raw -echo')
    char = STDIN.read_nonblock(1) rescue nil
    current_position = player.current_position

    if player.current_direction == :left
      if player.current_position[0] >= 0
        game_over = true if (player.current_position[0] - 1) < 0
        player.current_position = [current_position[0] - 1, current_position[1]]
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    end

    if player.current_direction == :right
      if (player.current_position[0] + 1) <= columns
        game_over = true if (player.current_position[0] + 1) >= columns
        player.current_position = [current_position[0] + 1, current_position[1]]
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    end

    if player.current_direction == :down
      if (player.current_position[1] + 1) <= rows
        game_over = true if (player.current_position[1] + 1) >= rows
        player.current_position = [current_position[0], current_position[1] + 1]
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    end

    if player.current_direction == :up
      if (player.current_position[1]) >= 0
        game_over = true if (player.current_position[1] - 1) < 0
        player.current_position = [current_position[0], current_position[1] - 1]
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
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
    puts "Player Position: #{player.current_position}"
    puts "Food Position: #{food.current_position}"
    puts "Next Position: #{(player.current_position[1] - 1 < 0)}"

    sleep 0.2
  end

  exit_message = game_over ? 'Sorry, game over!' : "\n\nThanks for playing"
  puts exit_message
end

main
