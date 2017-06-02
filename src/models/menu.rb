module GameState
  class Menu
    attr_accessor :completed
    attr_reader :name

    def initialize
      @player_input = nil
      @completed = false
      @name = :menu
    end

    def run
      msg = 'WELCOME TO RUBY SNAKE\n Press <e> to Start'

      # Check for user 
      @player_input = Curses.getch
      @completed = true if @player_input =~ /e/i

      Curses.setpos(0, 0)
      Curses.addstr(msg)
      Curses.refresh
      sleep 0.1
    end
  end
end
