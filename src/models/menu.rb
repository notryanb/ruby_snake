module GameState
  class Menu
    attr_reader :name, :completed

    def initialize
      @completed = false
      @name = :menu
    end

    def run
      msg = "WELCOME TO RUBY SNAKE\n Press <e> to Start"

      # Check for user 
      player_input = Curses.getch
      @completed = true if player_input =~ /e/i

      Curses.setpos(0, 0)
      Curses.addstr(msg)
      sleep 0.1
      Curses.refresh
    end
  end
end
