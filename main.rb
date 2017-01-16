require './game_board'
require './player'
require './food'

class IO
  def readline_nonblock
    rlnb_buffer = ""
    while ch = self.read_nonblock(1) 
      rlnb_buffer << ch
      if ch == "\n" then
        result = rlnb_buffer
        return result
      end
    end     
  end
end 

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  rows = 20
  columns = 50

  board = GameBoard.new(rows, columns)
  player = Player.new(rows, columns)
  food = Food.new(rows, columns)

  x, y = player.start_position
  board.board[x][y] = player

  r, z = food.start_position
  board.board[r][z] = food

  loop do
    printf "\033c" # Clears Screen to 0,0

    system("stty raw -echo")
    char = STDIN.read_nonblock(1) rescue nil

    board.board[x][y-1] = player if char =~ /a/i

   

    system("stty -raw echo")
    break if /q/i =~ char

    puts "PRESS 'q' to quit \n"
    puts board.to_s
    
    puts "CHAR: #{char}"

    sleep 0.2
  end  

  puts "Thanks for playing"
end


main
