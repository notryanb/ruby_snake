module GameState
  class Play
    include Rules

    attr_reader :rows, :columns, :completed, :name

    def initialize(rows, columns)
      @name = :play
      @rows = rows
      @columns = columns
      @board = GameBoard.new(rows, columns)
      @player = Player.new(random_position(rows), random_position(columns))
      replenish_food
      @food_available = true
      @score = 0
      @input = nil
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

    def random_position(num)
      Random.new.rand(num)
    end

    def replenish_food
      if !@food_available
        @food =
          Food.new(random_position(@rows), random_position(@columns))
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

      @input = Curses.getch

      if @input =~ /a/i
        @player.current_direction = :left
      elsif @input =~ /d/i
        @player.current_direction = :right
      elsif @input =~ /s/i
        @player.current_direction = :down
      elsif @input =~ /w/i
        @player.current_direction = :up
      elsif @input =~ /q/i
        game_over = true
      end

      @completed = true if game_over
    
      update_board(next_position) if !game_over

      Curses.setpos(0, 0)
      Curses.addstr(@board.to_s)
      Curses.addstr('=' * @rows)
      Curses.addstr("\nSCORE: #{@score}, GAME OVER: #{game_over}, COMPLETED: #{completed}")
      Curses.refresh
      
      sleep 0.1
    end
  end
end
