require 'curses'

require_relative 'player'
require_relative 'food'
require_relative 'cell'
require_relative 'game_board'

class Snake
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @board = GameBoard.new(rows, columns)
    @player =
      Player.new(Random.new.rand(rows), Random.new.rand(columns))
    replenish_food
    @food_available = true
    @score = 0
    @history = []
  end

  def columns
    @columns
  end

  def rows
    @rows
  end

  def update_board(next_position)
    @player.x, @player.y = next_position
    consume_food
    replenish_food
    last_position = @history.shift
    @history << @player.clone
    @board.position = Cell.new(last_position.x, last_position.y)
    @history.each { |p| @board.position = p }
  end

  def replenish_food
    if !@food_available
      @food =
        Food
        .new(Random.new.rand(@rows), Random.new.rand(@columns), :food)
      @food_available = true
    end
    @board.position = @food
  end

  def consume_food
    if @board.position(@player).type == :food
      @history << @player
      @score += 1
      @food_available = false
    end
  end
  
  def play
    game_over = false
    next_position = [@player.x, @player.y]
    @history << @player.clone

    loop do

      if @player.current_direction == :left
        if @player.x >= 0
          next_position = [@player.x - 1, @player.y]
          game_over = true if (next_position[0]) < 0
          game_over = true if @board.position(Cell.new(next_position[0], next_position[1])).type == :player
        end
      end

      if @player.current_direction == :right
        if (@player.x + 1) <= columns
          next_position = [@player.x + 1, @player.y]
          game_over = true if (next_position[0]) >= columns
          game_over = true if @board.position(Cell.new(next_position[0], next_position[1])).type == :player
        end
      end

      if @player.current_direction == :down
        if (@player.y + 1) <= rows
          next_position = [@player.x, @player.y + 1]
          game_over = true if next_position[1] >= rows
          game_over = true if @board.position(Cell.new(next_position[0], next_position[1])).type == :player
        end
      end

      if @player.current_direction == :up
        if (@player.y) >= 0
          next_position = [@player.x, @player.y - 1]
          game_over = true if next_position[1] < 0
          game_over = true if @board.position(Cell.new(next_position[0], next_position[1])).type == :player
        end
      end

      # if char =~ /a/i
      #   @player.current_direction = :left
      # elsif char =~ /d/i
      #   @player.current_direction = :right
      # elsif char =~ /s/i
      #   @player.current_direction = :down
      # elsif char =~ /w/i
      #   @player.current_direction = :up
      # end
    

      update_board(next_position) if !game_over

      # break if /q/i =~ char || game_over

      # puts "\n==================\nPRESS 'q' to quit \n"

      Curses.setpos(0, 0)
      Curses.addstr(@board.to_s)
      Curses.refresh

      # puts "Player Position: #{[@player.x, @player.y]}"
      # puts "Player Body: #{@player.body}"
      # puts "Score: #{@score}"

      sleep 0.1
    end

    exit_message = game_over ? 'Sorry, game over!' : "\n\nThanks for playing"
    puts exit_message
  end
end
  
Curses.init_screen
begin
  Curses.nl
  Curses.noecho
  Curses.curs_set 0 # Hides cursor
  Snake.new(30,30).play
ensure
  Curses.close_screen
end

