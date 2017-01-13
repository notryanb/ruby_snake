require './game_board'

def main
  # The whole game will be built inside this function
  # A while-loop will check for user input, keep track of
  # high scores, create game board, etc...
  game = true
  while game == true
    puts "Enter your command"
    p " >"
    input = gets.chomp
    puts "\n You input #{input}"
    sleep 1

    game = false if input == "exit"
  end  

  board = GameBoard.new(15, 60)
  puts "Width: #{board.width} Height: #{board.height}"

  puts "Thanks for playing!"
end

main
