require './game_board'
require './player'

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  board = GameBoard.new(15, 60)
  game = true
  i=0
  while game == true
    printf "\033c" # Clears Screen to 0,0
    i+=1
    puts i
    puts board.to_s
    sleep 0.2
  end  


  puts "Thanks for playing!"
end

main
