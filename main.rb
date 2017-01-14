require './game_board'

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  board = GameBoard.new(15, 60)
  game = true

  while game == true
    puts board.to_s
    puts "Enter your command"
    p " >"
    input = gets.chomp
    puts "\n You input #{input}"
    sleep 1

    game = false if input == "exit"
  end  


  puts "Thanks for playing!"
end

main
