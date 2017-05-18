class Snake
  include Rules

  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @board = GameBoard.new(rows, columns)
    @game_state = :playing
    @player =
      Player.new(Random.new.rand(rows), Random.new.rand(columns))
    replenish_food
    @food_available = true
    @score = 0
    @history = []
    @char = nil
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
    if @game_state == :menu
      loop do
        msg = 'WELCOME TO RUBY SNAKE\n'
        File.open('./assets/high_scores.yml', 'r') do |f|
          msg << f.readline 
        end

        Curses.setpos(0, 0)
        Curses.addstr(msg)
        Curses.refresh
        sleep 10
      end
    end

    if @game_state == :playing
      @history << @player.clone
      loop do

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

        break if /q/i =~ @char || game_over
      
        update_board(next_position) if !game_over

        Curses.setpos(0, 0)
        Curses.addstr(@board.to_s)
        Curses.refresh
        
        sleep 0.1
      end
    end
  end
end
