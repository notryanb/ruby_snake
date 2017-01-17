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

  y, x = player.current_position
  board.board[y][x] = player

  b, a = food.current_position
  board.board[b][a] = food

  loop do
    printf "\033c" # Clears Screen to 0,0

    system("stty raw -echo")
    char = STDIN.read_nonblock(1) rescue nil
    current_position = player.current_position

    if char =~ /a/i # Left
      if player.current_position[0] > 0
        player.set_current_position(current_position[0] - 1, current_position[1])
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    elsif char =~ /d/i #right
      if (player.current_position[0] + 1) < columns
        player.set_current_position(current_position[0] + 1, current_position[1])
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    elsif char =~ /s/i #down
      if (player.current_position[1] + 1) < rows
        player.set_current_position(current_position[0], current_position[1] + 1)
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    elsif char =~ /w/i #up
      if (player.current_position[1] - 1) >= 0
        player.set_current_position(current_position[0], current_position[1] -1)
        board.board[player.current_position[1]][player.current_position[0]] = player
        board.board[current_position[1]][current_position[0]] = '.'
      end
    end

   
    system("stty -raw echo")

    break if /q/i =~ char

    puts "\n==================\nPRESS 'q' to quit \n"
    puts board.to_s
    
    puts "Current Position: #{current_position}"
    puts "Player Position: #{player.current_position}"
    puts "Food Position: #{food.current_position}"

    sleep 0.2
  end  

  puts "\n\nThanks for playing"
end


main
