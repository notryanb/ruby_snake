module GameState
  class Play
    include Rules

    attr_reader :rows, :columns, :completed

    def initialize(rows, columns)
      @rows = rows
      @columns = columns
      @board = GameBoard.new(rows, columns)
      @game_state = :playing
      @player = Player.new(Random.new.rand(rows), Random.new.rand(columns))
      replenish_food
      @food_available = true
      @score = 0
      @char = nil
      @history = [@player.clone]
      @completed = false
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

    def run
      game_over = game_over?

      @char = Curses.getch

      if @char =~ /a/i
        @player.current_direction = :left
      elsif @char =~ /d/i
        @player.current_direction = :right
      elsif @char =~ /s/i
        @player.current_direction = :down
      elsif @char =~ /w/i
        @player.current_direction = :up
      end

      @completed = true  if /q/i =~ @char || game_over
    
      update_board(next_position) if !game_over

      Curses.setpos(0, 0)
      Curses.addstr(@board.to_s)
      Curses.refresh
      
      sleep 0.1
    end
  end
end
