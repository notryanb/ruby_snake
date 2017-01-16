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

  x, y = player.start_position
  board.board[x][y] = player

  r, z = food.start_position
  board.board[r][z] = food
  #game = true
  #i=0

  puts board.to_s
  #while game == true
    #printf "\033c" # Clears Screen to 0,0
    #i+=1
    #puts i
    #puts board.to_s
    #sleep 0.2
  #end  
end

main
